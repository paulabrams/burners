#!/usr/bin/env python3
"""
Burners combat simulator — Fuel/Sparks engine (current rules).

Models:
  - Roll Initiative each round (full pool round 1; refill 1/level from round 2);
    order locked for the round from dice showing 3–4
  - Defend: melee 1 die, or unlimited if you meleed this round; missile 1 / 2 with Cover;
    hostile magic unlimited. In the dirt: every spent die is re-rolled
  - Block: spend one attack to redirect a blow aimed at an ally onto yourself
  - Sparks (spent 6) buy an extra attack / Block / Riposte
  - Binary AC/Resistance: remaining damage <= threshold stops; higher damage sinks in whole
  - Monsters use the same AC bands; at 0 HP they are Cracked and the next damaging hit drops them
  - Wound funnel: overflow → negative HP + severity → location → Shock (2d6+Sword vs severity);
    post-fight help + Craft survival or die

All-melee standing fight, no surprise, no ranged pre-softening, no chokepoint by default
(a worst case that favors the monsters). Party focus-fires the weakest live foe.
"""
import random
from datetime import date

def d6():
    return random.randint(1, 6)

OGRE_ATTACKS = 1
TROLL_REGEN = 0
CHOKE = None
PARTY_HP = None
FIRE = False
OGRE_HP = None
# Kept as a comparison switch for old runs. Current rules are binary.
BINARY_ARMOR = True


def shock_result(twod6):
    """Shock table: read the raw 2d6 when the Shock Check fails."""
    if twod6 == 2:
        return "ko_deep"
    if twod6 in (3, 4):
        return "ko"
    if twod6 == 5:
        return "prone_disarm"
    if twod6 == 6:
        return "prone"
    if twod6 == 7:
        return "stun"
    if twod6 == 8:
        return "winded"
    if twod6 == 9:
        return "stagger"
    if twod6 == 10:
        return "disarm"
    if twod6 == 11:
        return "rocked"
    return "unshaken"  # 12


class C:
    def __init__(self, name, side, hp_max, armor, call_dice_fn, attacks, blow_dice,
                 reserve, sword=0, craft=0, shield=False, cover=False, heal_charges=0,
                 monster=False, regen=0, resistance=0, area_dice=0, area_every=0):
        self.name = name
        self.side = side
        self.hp_max = hp_max
        self.hp = hp_max
        self.armor = armor              # worn or natural AC, same bands for PCs and monsters
        self.resistance = resistance    # named threshold; never added to AC
        self.call_dice_fn = call_dice_fn
        self.attacks = attacks
        self.blow_dice = blow_dice
        self.reserve = reserve
        self.sword = sword
        self.craft = craft
        self.shield = shield
        self.cover = cover              # Cover vs missiles (raised shield, terrain, …)
        self.heal_charges = heal_charges
        self.monster = monster
        self.regen = regen
        self.area_dice = area_dice
        self.area_every = area_every
        self.area_timer = 0

        self.fuel = []
        self.down = False
        self.dead = False
        self.cracked = False
        self.wounded = False
        self.severity = 0
        self.stunned = False
        self.prone = False
        self.disarmed = False
        self.forfeit_refill = False
        self.meleed_this_round = False
        self.attacks_left = 0
        self.target = None
        self.wound_locs = set()

    @property
    def active(self):
        return not self.down and not self.dead

    def threshold(self):
        if self.monster and self.cracked:
            return 0
        return max(self.armor, self.resistance)

    def do_call(self):
        self.fuel = [d6() for _ in range(self.call_dice_fn())]

    def refill(self):
        if self.forfeit_refill:
            self.forfeit_refill = False
            return
        self.fuel.append(d6())

    def initiative(self):
        return sum(1 for f in self.fuel if f in (3, 4))

    def pop_largest(self):
        if not self.fuel:
            return None
        i = max(range(len(self.fuel)), key=lambda k: self.fuel[k])
        return self.fuel.pop(i)

    def spend(self):
        """Spend one Fuel die; in the dirt, re-roll the face."""
        die = self.pop_largest()
        if die is None:
            return None
        if self.prone:
            die = d6()
        return die


def defend_cap(defender, kind="melee"):
    if kind == "melee":
        return float("inf") if defender.meleed_this_round else 1
    if kind == "missile":
        return 2 if (defender.cover or defender.shield) else 1
    return float("inf")  # hostile magic


def spend_to_cut(defender, need, maxd):
    """Spend up to maxd dice trying to cut `need` damage. Returns (spent_sum, sparked)."""
    if maxd <= 0 or not defender.fuel or need <= 0:
        return 0, False
    sparked = False
    spent = 0
    used = 0
    keep = defender.reserve if need < max(3, defender.hp if defender.hp > 0 else 1) else 0
    if need >= (defender.hp if defender.hp > 0 else 1) or need >= 3:
        keep = 0 if need >= (defender.hp if defender.hp > 0 else 1) else defender.reserve
        while spent < need and used < maxd and len(defender.fuel) > keep:
            die = defender.spend()
            if die is None:
                break
            spent += die
            used += 1
            if die == 6:
                sparked = True
    elif (need == 2 or (BINARY_ARMOR and need == 1)) and used < maxd:
        die = defender.spend()
        if die is not None:
            spent += die
            used += 1
            if die == 6:
                sparked = True
    return spent, sparked


def maybe_dirty_fight(defender, undef, maxd):
    """Trash pool vs a big blow: throw yourself in the dirt to re-roll spends."""
    if defender.prone or maxd < 2 or undef < 3:
        return
    if sum(defender.fuel) >= undef:
        return
    if undef >= (defender.hp if defender.hp > 0 else 1) or undef >= 6:
        defender.prone = True


def apply_armor(remaining, threshold):
    """Apply AC/Resistance to damage already cut by Fuel Defend."""
    remaining = max(0, remaining)
    if threshold <= 0:
        return remaining
    if BINARY_ARMOR:
        # Threshold: bounce or full sink — never subtract.
        return 0 if remaining <= threshold else remaining
    return max(0, remaining - threshold)


def defend(defender, raw, kind="melee"):
    threshold = defender.threshold()
    # Still aim to cut down to the armor threshold (same spend target either mode).
    undef = max(0, raw - threshold)
    if undef == 0:
        return 0, False
    maxd = defend_cap(defender, kind)
    maybe_dirty_fight(defender, undef, maxd)
    if maxd <= 0 or not defender.fuel:
        return apply_armor(raw, threshold), False
    if maxd == 1:
        should_defend = undef >= 2 or undef >= (defender.hp if defender.hp > 0 else 1)
        if BINARY_ARMOR:
            # One point of cutting can turn a full hit into a complete bounce.
            should_defend = raw > threshold
        if should_defend:
            die = defender.spend()
            if die is None:
                return apply_armor(raw, threshold), False
            return apply_armor(raw - die, threshold), die == 6
        return apply_armor(raw, threshold), False
    spent, sparked = spend_to_cut(defender, undef, maxd)
    return apply_armor(raw - spent, threshold), sparked


def wound(target, overflow):
    """Open / deepen a Wound. overflow is damage past 0 after armor (must be > 0)."""
    overflow = max(0, overflow)
    if overflow <= 0:
        return
    target.wounded = True
    target.hp -= overflow  # deepen negative tally
    target.severity += overflow

    loc = d6()  # 1 head 2 torso 3 waist 4 arm 5 hand 6 leg
    target.wound_locs.add(loc)
    if loc == 2:  # torso winded
        if target.fuel:
            target.spend()
        else:
            target.forfeit_refill = True
    elif loc in (3, 6):  # waist / leg → in the dirt until full HP
        target.prone = True
    elif loc in (4, 5):  # arm / hand
        target.disarmed = True

    # Shock Check: 2d6 + Sword vs total severity; nat 1+1 fail, 6+6 succeed
    a, b = d6(), d6()
    roll = a + b
    auto_fail = a == 1 and b == 1
    auto_ok = a == 6 and b == 6
    check = roll + target.sword
    if not auto_fail and (auto_ok or check >= target.severity):
        if auto_ok and target.prone and loc not in (3, 6):
            target.prone = False  # unshaken can rise free — only if wound didn't pin you
        return

    res = shock_result(roll)
    if res == "ko_deep":
        shortfall = max(1, target.severity - check) if not auto_fail else max(1, target.severity)
        target.hp -= shortfall
        target.severity += shortfall
        target.down = True
    elif res == "ko":
        target.down = True
    elif res == "prone_disarm":
        target.prone = True
        target.disarmed = True
    elif res == "prone":
        target.prone = True
    elif res == "stun":
        target.stunned = True
    elif res == "winded":
        if target.fuel:
            target.spend()
        else:
            target.forfeit_refill = True
    elif res == "disarm":
        target.disarmed = True
    elif res == "unshaken" and target.prone and loc not in (3, 6):
        target.prone = False
    # stagger / rocked: flavor in this melee model


def land(target, net):
    if net <= 0:
        return
    if target.monster:
        if target.cracked:
            target.dead = True
            return
        target.hp = max(0, target.hp - net)
        if target.hp == 0:
            target.cracked = True
        return
    if target.hp > 0:
        if net < target.hp:
            target.hp -= net
            return
        overflow = net - target.hp
        target.hp = 0
        if overflow > 0:
            wound(target, overflow)
        # exactly at 0: luck spent, not yet Wounded
    else:
        # already at 0 or below: the next blow drives negative / deepens
        wound(target, net)


def try_block(target, target_allies):
    """An ally with attacks left may Block: redirect the blow onto themselves."""
    if target.monster:
        return target
    blockers = [a for a in target_allies
                if a is not target and a.active and not a.monster
                and a.attacks_left > 0 and not a.disarmed]
    if not blockers:
        return target
    blockers.sort(key=lambda a: (0 if a.name == "Aldric" else 1, -a.attacks_left))
    b = blockers[0]
    soft = (not target.meleed_this_round) or target.hp <= 2 or target.armor <= 1
    if b.name == "Aldric" or soft:
        b.attacks_left -= 1
        b.meleed_this_round = True
        return b
    return target


def apply_hit(attacker, target, raw, target_allies, kind="melee"):
    """target_allies = the target's friends (who may Block for them)."""
    target = try_block(target, target_allies)
    net, riposte = defend(target, raw, kind=kind)
    land(target, net)
    if riposte and target.active and attacker.active and target.fuel:
        die = target.spend()
        if die is not None:
            land(attacker, apply_armor(die, attacker.threshold()))


def take_turn(actor, allies, foes):
    if not actor.active:
        return
    if actor.stunned:
        actor.stunned = False
        return
    live_foes = [f for f in foes if f.active]
    if not live_foes:
        return

    # Area / breath: hits every foe, ignores armor; Fuel Defend as hostile magic (unlimited).
    # Ward not modeled (no dedicated caster Action mid-enemy-turn).
    if actor.monster and actor.area_dice and actor.area_every and actor.area_timer == 0:
        for t in list(live_foes):
            raw = sum(d6() for _ in range(actor.area_dice))
            maxd = defend_cap(t, "magic")
            spent, _ = spend_to_cut(t, raw, maxd)
            land(t, max(0, raw - spent))
        actor.area_timer = actor.area_every
        return

    # Senna: Stanch if someone is down or badly hurt
    if actor.heal_charges > 0:
        downed = [a for a in allies if a.down and not a.dead]
        hurt = [a for a in ([actor] + allies) if a.active and a.hp <= max(1, a.hp_max // 2)]
        tgt = downed[0] if downed else (min(hurt, key=lambda a: a.hp) if hurt else None)
        if tgt is not None and actor.fuel:
            actor.spend()
            actor.heal_charges -= 1
            if tgt.down and not tgt.dead:
                tgt.down = False
                if not (tgt.wound_locs & {3, 6}):
                    tgt.prone = False
                tgt.stunned = False
            if tgt.hp < 0:
                tgt.hp = 0
            tgt.hp = min(tgt.hp_max, tgt.hp + d6())
            return

    focus = actor.target if (actor.target in live_foes) else min(live_foes, key=lambda f: f.hp)
    n_attacks = actor.attacks_left
    blow = 1 if actor.prone else actor.blow_dice
    if actor.disarmed:
        n_attacks = 0

    # Hold one attack for Block when facing multiple foes (tank duty)
    hold_block = 1 if (actor.name == "Aldric" and len(live_foes) >= 2 and n_attacks >= 2) else 0

    sparks_pending = 0
    attacks_made = 0
    total_cap = 8

    while attacks_made < total_cap and (attacks_made < n_attacks - hold_block or sparks_pending > 0):
        if attacks_made >= n_attacks - hold_block:
            if sparks_pending > 0:
                sparks_pending -= 1
            else:
                break
        need = blow
        can_kill = focus.active and focus.monster and (focus.hp <= 6 * blow)
        if len(actor.fuel) - need < actor.reserve and not can_kill:
            break
        if len(actor.fuel) < need:
            break
        dice = [actor.spend() for _ in range(need)]
        if any(x == 6 for x in dice if x is not None):
            sparks_pending += 1
        raw = sum(x for x in dice if x is not None)
        actor.meleed_this_round = True
        actor.attacks_left = max(0, actor.attacks_left - 1)
        # live_foes = opposing side = target's friends (monsters never Block)
        apply_hit(actor, focus, raw, live_foes)
        attacks_made += 1
        if not focus.active:
            live_foes = [f for f in foes if f.active]
            if not live_foes:
                break
            focus = min(live_foes, key=lambda f: f.hp)

def assign_targets(party, foes, targeting):
    live_party = [p for p in party if p.active]
    live_foes = [f for f in foes if f.active]
    if live_foes:
        weakest = min(live_foes, key=lambda f: f.hp)
        for p in live_party:
            p.target = weakest
    if live_party:
        for f in live_foes:
            if targeting == "front":
                aldric = next((p for p in live_party if p.name == "Aldric"), None)
                f.target = aldric if aldric else random.choice(live_party)
            else:
                f.target = random.choice(live_party)


def _php():
    return PARTY_HP if PARTY_HP is not None else d6()


def make_party():
    # Match the Adventure Game sample: Aldric Sword 1, mail AC 3, sword + rotella (pool 7).
    aldric = C("Aldric", "party", hp_max=_php(), armor=3,
               call_dice_fn=lambda: 7,  # 1 level + 2 sword + 4 rotella
               attacks=2, blow_dice=1, reserve=3, sword=1, craft=0, shield=True, cover=True)
    senna = C("Senna", "party", hp_max=_php(), armor=1,
              call_dice_fn=lambda: 5,  # 1 level + 1 dagger + empties / arcana abstraction
              attacks=1, blow_dice=1, reserve=2, sword=0, craft=0, heal_charges=1)
    pip = C("Pip", "party", hp_max=_php(), armor=1,
            call_dice_fn=lambda: 7,  # 1 level + 3 spear + empties
            attacks=1, blow_dice=2, reserve=2, sword=0, craft=1)
    return [aldric, senna, pip]


def make_orc():
    # HD 1, printed 1d8 HP, leather-equivalent AC 1.
    return C("Orc", "foe", hp_max=random.randint(1, 8), armor=1,
             call_dice_fn=lambda: 4, attacks=1, blow_dice=1, reserve=1, monster=True)


def make_ogre():
    # HD 4+2; printed 4d6+2 HP; thick hide as leather AC 1.
    hp = OGRE_HP if OGRE_HP is not None else sum(d6() for _ in range(4)) + 2
    return C("Ogre", "foe", hp_max=hp, armor=1,
             call_dice_fn=lambda: 10, attacks=OGRE_ATTACKS, blow_dice=3, reserve=3,
             monster=True)


def make_troll():
    # HD 5; HP 5*HD; rubbery hide as gambeson AC 2; claw/claw/bite.
    return C("Troll", "foe", hp_max=25, armor=2,
             call_dice_fn=lambda: 9, attacks=3, blow_dice=1, reserve=3,
             monster=True, regen=TROLL_REGEN)


SCENARIOS = {
    "3 Orcs": lambda: [make_orc() for _ in range(3)],
    "5 Orcs": lambda: [make_orc() for _ in range(5)],
    "Ogre": lambda: [make_ogre()],
    "Troll": lambda: [make_troll()],
}


def post_fight_survival(party):
    """After a party win: wounded Burners need help + Craft survival or they die."""
    standing = [p for p in party if p.active]
    helper_craft = max((p.craft for p in standing), default=0)
    for p in party:
        if p.dead or not p.wounded:
            continue
        if not standing:
            p.dead = True
            continue
        # help is available if anyone stands; survival 2d6 + Craft vs severity
        a, b = d6(), d6()
        roll = a + b
        if a == 1 and b == 1:
            p.dead = True
            continue
        if a == 6 and b == 6:
            continue
        craft = max(p.craft, helper_craft)
        if roll + craft < p.severity:
            p.dead = True


def run_fight(scenario_fn, heat, targeting, max_rounds=40):
    party = make_party()
    foes = scenario_fn()
    heat_pool = [d6() for _ in range(heat)]
    for c in party + foes:
        c.do_call()
    fi = 0
    for die in heat_pool:
        foes[fi % len(foes)].fuel.append(die)
        fi += 1

    for rnd in range(1, max_rounds + 1):
        if rnd > 1:
            for c in party + foes:
                if c.active:
                    c.refill()
            for c in foes:
                if c.active and c.regen and not FIRE and 0 < c.hp < c.hp_max:
                    c.hp = min(c.hp_max, c.hp + c.regen)
                if c.active and c.area_every and c.area_timer > 0:
                    c.area_timer -= 1

        for c in party + foes:
            c.meleed_this_round = False
            c.attacks_left = c.attacks if c.active else 0

        live_foes = [f for f in foes if f.active]
        front = live_foes[:CHOKE] if CHOKE else live_foes
        assign_targets(party, front, targeting)

        # Locked Initiative for the round (count of 3–4s); PC wins ties
        order = sorted(
            [c for c in party if c.active] + list(front),
            key=lambda c: (c.initiative(), 1 if c.side == "party" else 0, random.random()),
            reverse=True,
        )
        for actor in order:
            if not actor.active:
                continue
            if actor.side == "party":
                take_turn(actor, [p for p in party if p is not actor], front)
            else:
                take_turn(actor, [f for f in front if f is not actor], party)
            if all(not f.active for f in foes) or all(not p.active for p in party):
                break

        if all(not f.active for f in foes):
            post_fight_survival(party)
            standing = [p for p in party if p.active and not p.dead]
            return dict(
                win=True, stale=False, rounds=rnd,
                aldric=not party[0].dead, senna=not party[1].dead, pip=not party[2].dead,
                standing=len(standing),
            )
        if all(not p.active for p in party):
            # Coup assumed — downed without a win die
            for p in party:
                if p.down:
                    p.dead = True
            return dict(
                win=False, stale=False, rounds=rnd,
                aldric=not party[0].dead, senna=not party[1].dead, pip=not party[2].dead,
                standing=0,
            )

    return dict(
        win=False, stale=True, rounds=max_rounds,
        aldric=not party[0].dead, senna=not party[1].dead, pip=not party[2].dead,
        standing=sum(1 for p in party if p.active),
    )


def batch(scenario_name, heat, targeting, n):
    wins = rounds = alds = sens = pips = stand = 0
    tpk = stale = 0
    for _ in range(n):
        r = run_fight(SCENARIOS[scenario_name], heat, targeting)
        wins += r["win"]
        rounds += r["rounds"]
        stale += int(r.get("stale", False))
        alds += r["aldric"]
        sens += r["senna"]
        pips += r["pip"]
        stand += r["standing"]
        if r["standing"] == 0 and not r["win"]:
            tpk += 1
    return dict(
        n=n, win=wins / n, rounds=rounds / n, aldric=alds / n, senna=sens / n, pip=pips / n,
        stand=stand / n, tpk=tpk / n, stale=stale / n,
    )


if __name__ == "__main__":
    N = 8000
    HEAT = 6
    print(f"# Burners combat sim  ({date.today().isoformat()})  N={N}/cell  Heat={HEAT}\n")
    for tgt in ("random", "front"):
        print(f"## Targeting = {tgt}")
        print(f"{'Scenario':10} {'win%':>6} {'rounds':>7} {'Ald%':>6} {'Sen%':>6} {'Pip%':>6} {'stand':>6} {'TPK%':>6}")
        for s in ("3 Orcs", "5 Orcs", "Ogre", "Troll"):
            r = batch(s, HEAT, tgt, N)
            print(f"{s:10} {r['win']*100:6.1f} {r['rounds']:7.1f} {r['aldric']*100:6.1f} "
                  f"{r['senna']*100:6.1f} {r['pip']*100:6.1f} {r['stand']:6.2f} {r['tpk']*100:6.1f}")
        print()
    print("## Heat sweep, 3 Orcs, targeting=random")
    print(f"{'Heat':>4} {'win%':>6} {'rounds':>7} {'TPK%':>6}")
    for h in (0, 3, 6, 9, 12):
        r = batch("3 Orcs", h, "random", N)
        print(f"{h:4d} {r['win']*100:6.1f} {r['rounds']:7.1f} {r['tpk']*100:6.1f}")

    # Fair-fight curve + key lever checks (smaller N for speed)
    N2 = 4000
    def run_n(n, tgt, trials):
        wins = tpk = 0
        for _ in range(trials):
            r = run_fight(lambda nn=n: [make_orc() for _ in range(nn)], HEAT, tgt)
            wins += r["win"]
            if r["standing"] == 0 and not r["win"]:
                tpk += 1
        return wins / trials, tpk / trials

    print(f"\n## Orc count curve (N={N2}, Heat={HEAT})")
    print(f"{'Orcs':>4} {'Open win':>9} {'Open TPK':>9} {'Front win':>10} {'Front TPK':>10}")
    for n_orcs in range(3, 9):
        ow, ot = run_n(n_orcs, "random", N2)
        fw, ft = run_n(n_orcs, "front", N2)
        print(f"{n_orcs:4d} {ow*100:9.1f} {ot*100:9.1f} {fw*100:10.1f} {ft*100:10.1f}")

    def bat_fn(fn, trials=N2):
        wins = tpk = rounds = 0
        for _ in range(trials):
            r = run_fight(fn, HEAT, "random")
            wins += r["win"]
            rounds += r["rounds"]
            if r["standing"] == 0 and not r["win"]:
                tpk += 1
        return wins / trials, tpk / trials, rounds / trials

    print(f"\n## Adds vs solo (N={N2}, Heat={HEAT}, open)")
    for label, fn in (
        ("Ogre alone", lambda: [make_ogre()]),
        ("Ogre + 2 Orcs", lambda: [make_ogre(), make_orc(), make_orc()]),
        ("Ogre + 4 Orcs", lambda: [make_ogre()] + [make_orc() for _ in range(4)]),
        ("Troll alone", lambda: [make_troll()]),
        ("Troll + 2 Orcs", lambda: [make_troll(), make_orc(), make_orc()]),
    ):
        w, t, rnds = bat_fn(fn)
        print(f"{label:16} win%={w*100:5.1f}  TPK%={t*100:5.1f}  rounds={rnds:5.1f}")

    print(f"\n## Troll regen (solo, open, N={N2})")
    for reg in (0, 1, 2, 3):
        def mk(reg=reg):
            t = make_troll()
            t.regen = reg
            return [t]
        w = tpk = stale = 0
        for _ in range(N2):
            r = run_fight(mk, HEAT, "random")
            w += r["win"]
            stale += int(r["stale"])
            if r["standing"] == 0 and not r["win"]:
                tpk += 1
        print(f"regen {reg}: win%={w/N2*100:5.1f}  stale%={stale/N2*100:5.1f}  TPK%={tpk/N2*100:5.1f}")
