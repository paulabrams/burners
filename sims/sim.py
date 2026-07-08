#!/usr/bin/env python3
"""
Burners combat simulator — Fuel/Sparks engine.
Models: the Call (pool from level+gear+empty slots), Initiative (dice showing 3-4),
per-round refill, Veteran extra attacks, two-handed power blows, Sparks (a spent 6 = bonus action),
Parry (unlimited vs the foe you engage) / Dodge (1 die vs others) / shield Block,
armor soak on the way in, and the PC survival funnel: HP -> overflow cuts Strength ->
Wound + Shock Check (2d6 under current STR) -> KO/death; STR 0 = dead.
Monsters use the simple stat-block path: they die at HP <= 0 (no STR/shock buffer).

All-melee standing fight, no surprise, no ranged pre-softening, no chokepoint
(a worst case that favors the monsters). Party focus-fires the weakest live foe.
"""
import random
from datetime import date

def d6(): return random.randint(1, 6)

OGRE_ATTACKS = 1   # sweepable: treat the ogre as a Veteran of Sword level (attacks-1)
TROLL_REGEN = 0    # OD&D troll regeneration, HP per round (answered by fire in play)
PARRY_SIZE_CAP = False  # experiment: you cannot cleanly parry/block a foe far larger than you
                        #   (mirrors the Stunt size ladder). gap +1 -> at most 2 dice; +2 -> 1 die (dodge only)
CHOKE = None            # chokepoint width: only this many foes can reach the party each round
                        #   (the rest wait behind and step up as the front falls). None = open field.
PARTY_HP = None         # override every Burner's starting HP (None = roll 1d6 each, the level-1 rule)
FIRE = False            # the party keeps a regenerator burning (oil, brand): suppresses regeneration

# ---------- Shock table (read 2d6 when you FAIL the roll-under-STR check) ----------
def shock_result(twod6):
    if twod6 >= 12: return "ko_deep"      # KO + extra STR loss
    if twod6 == 11: return "ko"           # KO
    if twod6 == 10: return "prone_disarm"
    if twod6 == 9:  return "prone"
    if twod6 == 8:  return "stun"
    if twod6 == 7:  return "stagger"
    if twod6 == 6:  return "disarm"
    return "rocked"

# ---------- Combatant ----------
class C:
    def __init__(self, name, side, hp_max, armor, call_dice_fn, attacks, blow_dice,
                 reserve, str_score=None, shield=False, heal_charges=0, monster=False, regen=0, size=0,
                 area_dice=0, area_every=0):
        self.regen = regen; self.size = size
        self.area_dice = area_dice; self.area_every = area_every; self.area_timer = 0
        self.name = name; self.side = side
        self.hp_max = hp_max; self.hp = hp_max
        self.armor = armor
        self.call_dice_fn = call_dice_fn      # callable -> int (pool size at the Call)
        self.attacks = attacks                # base attacks per round (Veteran adds here)
        self.blow_dice = blow_dice            # dice per blow (1; 2 for two-handed power; 3 ogre)
        self.reserve = reserve                # Fuel dice to keep back for defense
        self.str_nat = str_score; self.str_cur = str_score
        self.shield = shield
        self.heal_charges = heal_charges
        self.monster = monster
        self.fuel = []
        self.down = False       # KO'd, out of fight, still alive (PCs only)
        self.dead = False
        self.stunned = False
        self.prone = False
        self.disarmed = False
        self.forfeit_refill = False
        self.shield_block_used = False
        self.target = None      # the foe/PC this combatant attacks this round (its engaged target)

    @property
    def active(self):
        return not self.down and not self.dead

    def do_call(self):
        self.fuel = [d6() for _ in range(self.call_dice_fn())]

    def refill(self):
        if self.forfeit_refill:
            self.forfeit_refill = False
            return
        self.fuel.append(d6())

    def initiative(self):
        return sum(1 for f in self.fuel if f in (3, 4))

    def spend_largest(self):
        if not self.fuel: return None
        i = max(range(len(self.fuel)), key=lambda k: self.fuel[k])
        return self.fuel.pop(i)

# ---------- Defense: choose dice to cut an incoming blow ----------
def defend(defender, attacker, raw):
    """Return hp_loss (or overflow handling done by caller). Spends Fuel dice, returns
    (net_after_defense_and_soak, sparked). net = damage that reaches HP/STR."""
    soak = defender.armor
    if getattr(defender, "half_armor", False) and random.random() < 0.5:
        soak = 0            # ogre hide covers only half the body
    undef = max(0, raw - soak)
    if undef == 0:
        return 0, False
    # capacity to cut this blow, as a max number of dice (inf = unlimited)
    if attacker is defender.target:
        maxd = float('inf')   # Parry the foe you engage
    elif defender.shield and not defender.shield_block_used:
        maxd = float('inf'); defender.shield_block_used = True   # free shield Block on one other foe
    elif defender.prone:
        maxd = 0              # prone: no Dodge vs a foe you are not engaging
    else:
        maxd = 1              # Dodge
    # size cap: you cannot cleanly turn a blow from something much larger than you
    if PARRY_SIZE_CAP and maxd == float('inf'):
        gap = getattr(attacker, "size", 0) - getattr(defender, "size", 0)
        if gap >= 2: maxd = 1
        elif gap == 1: maxd = 2
    if maxd <= 0 or not defender.fuel:
        return undef, False
    sparked = False; spent = 0; used = 0
    if maxd == 1:
        # Dodge (or size-capped to a single die): spend one only if it matters
        if undef >= 2 or undef >= defender.hp:
            die = defender.spend_largest(); spent += die; used += 1
            if die == 6: sparked = True
        else:
            return undef, False
    else:
        # Parry/Block, up to maxd dice. Prevent a wound; blunt a heavy chip; conserve on small ones.
        want_full = (undef >= defender.hp) or (undef >= 3)
        if want_full:
            keep = 0 if undef >= defender.hp else defender.reserve
            while spent < undef and used < maxd and len(defender.fuel) > keep:
                die = defender.spend_largest(); spent += die; used += 1
                if die == 6: sparked = True
        elif undef == 2:
            die = defender.spend_largest(); spent += die; used += 1
            if die == 6: sparked = True
        else:
            return undef, False
    net = max(0, raw - spent - soak)
    return net, sparked

# ---------- Apply damage to a target ----------
def _land(target, net, log=None):
    """Apply net damage that has already passed defense/armor, to HP or the PC funnel."""
    if net <= 0:
        return
    if target.monster:
        target.hp -= net
        if target.hp <= 0:
            target.dead = True
        return
    # PC funnel
    if target.hp > 0:
        if net < target.hp:
            target.hp -= net
            return
        overflow = net - target.hp
        target.hp = 0
    else:
        overflow = net
    wound(target, overflow, log)

def apply_hit(attacker, target, raw, log):
    net, riposte = defend(target, attacker, raw)
    _land(target, net, log)

def wound(target, overflow, log):
    loc = d6()  # 1 head 2 torso 3 waist 4 arm 5 hand 6 leg
    target.str_cur -= max(1, overflow)
    if target.str_cur <= 0:
        target.str_cur = 0; target.dead = True; target.down = True
        return
    # location effect (subset modeled)
    if loc == 2:  # torso winded: lose a Fuel die now (or forfeit next refill)
        if target.fuel: target.spend_largest()
        else: target.forfeit_refill = True
    elif loc in (3, 6):  # waist/leg: prone until healed
        target.prone = True
    # (head/arm/hand: flavor; light-touch in this model)
    # Shock Check: 2d6 under current STR
    roll = d6() + d6()
    if roll <= target.str_cur:
        return  # shrug, stay up
    res = shock_result(roll)
    if res == "ko_deep":
        target.str_cur = max(0, target.str_cur - 2)
        if target.str_cur == 0: target.dead = True
        target.down = True
    elif res == "ko":
        target.down = True
    elif res == "prone_disarm":
        target.prone = True; target.disarmed = True
    elif res == "prone":
        target.prone = True
    elif res == "stun":
        target.stunned = True
    elif res == "disarm":
        target.disarmed = True
    # stagger / rocked: no strong mechanical effect in this melee model

# ---------- One combatant's turn (attacks, sparks, heal) ----------
def take_turn(actor, allies, foes, log):
    if not actor.active: return
    if actor.stunned:
        actor.stunned = False
        return
    live_foes = [f for f in foes if f.active]
    if not live_foes: return

    # Area/breath: the blow you cannot dodge. Hits every enemy, ignores armor, only a shield Blocks it.
    if actor.monster and actor.area_dice and actor.area_every and actor.area_timer == 0:
        for t in live_foes:
            net = sum(d6() for _ in range(actor.area_dice))
            if t.shield and not t.shield_block_used:
                t.shield_block_used = True
                while net > 0 and t.fuel:
                    net -= t.spend_largest()
                net = max(0, net)
            _land(t, net)
        actor.area_timer = actor.area_every
        return

    # Senna: heal if valuable
    if actor.heal_charges > 0:
        downed = [a for a in allies if a.down and not a.dead]
        hurt = [a for a in ([actor] + allies) if a.active and a.hp <= max(1, a.hp_max // 2)]
        tgt = None
        if downed: tgt = downed[0]
        elif hurt: tgt = min(hurt, key=lambda a: a.hp)
        if tgt is not None and actor.fuel:
            actor.spend_largest()  # 1 die to cast (L1)
            actor.heal_charges -= 1
            if tgt.down and not tgt.dead:
                tgt.down = False; tgt.prone = False; tgt.stunned = False
            tgt.hp = min(tgt.hp_max, (tgt.hp if tgt.hp > 0 else 0) + d6())
            return

    focus = actor.target if (actor.target in live_foes) else min(live_foes, key=lambda f: f.hp)
    n_attacks = 1 if (actor.prone or actor.disarmed) else actor.attacks
    blow = 1 if actor.prone else actor.blow_dice

    attacks_made = 0
    sparks_pending = 0
    total_cap = 8
    while attacks_made < total_cap and (attacks_made < n_attacks or sparks_pending > 0):
        if attacks_made >= n_attacks:
            if sparks_pending > 0: sparks_pending -= 1
            else: break
        # affordability: keep reserve unless a blow could kill focus
        need = blow
        can_kill = focus.active and focus.monster and (focus.hp <= 6 * blow)  # rough
        if len(actor.fuel) - need < actor.reserve and not can_kill:
            break
        if len(actor.fuel) < need:
            break
        dice = [actor.spend_largest() for _ in range(need)]
        if any(x == 6 for x in dice): sparks_pending += 1
        raw = sum(dice)
        apply_hit(actor, focus, raw, log)
        attacks_made += 1
        if not focus.active:
            live_foes = [f for f in foes if f.active]
            if not live_foes: break
            focus = min(live_foes, key=lambda f: f.hp)

# ---------- Targeting: who each combatant attacks this round ----------
def assign_targets(party, foes, targeting):
    live_party = [p for p in party if p.active]
    live_foes = [f for f in foes if f.active]
    if live_foes:
        weakest = min(live_foes, key=lambda f: f.hp)   # party focus-fires
        for p in live_party: p.target = weakest
    if live_party:
        for f in live_foes:
            if targeting == 'front' :
                aldric = next((p for p in live_party if p.name == 'Aldric'), None)
                f.target = aldric if aldric else random.choice(live_party)
            else:  # 'random' open melee
                f.target = random.choice(live_party)

# ---------- Build combatants ----------
def _php():  # a Burner's starting HP: fixed override, else roll 1d6 (the level-1 rule)
    return PARTY_HP if PARTY_HP is not None else d6()

def make_party():
    # STR scores fixed & flagged as assumptions; HP = 1d6 rolled per fight (level 1, current rule)
    aldric = C("Aldric", "party", hp_max=_php(), armor=3,
               call_dice_fn=lambda: 7,   # 1 level +2 sword +3 heater +1 empty
               attacks=2, blow_dice=1, reserve=3, str_score=13, shield=True)
    senna  = C("Senna", "party", hp_max=_php(), armor=1,
               call_dice_fn=lambda: 5,   # 1 level +1 dagger +3 empty
               attacks=1, blow_dice=1, reserve=2, str_score=9, heal_charges=1)
    pip    = C("Pip", "party", hp_max=_php(), armor=1,
               call_dice_fn=lambda: 7,   # 1 level +3 spear +3 empty
               attacks=1, blow_dice=2, reserve=2, str_score=11)  # 2-handed spear power blow
    return [aldric, senna, pip]

def make_orc():
    return C("Orc", "foe", hp_max=d6()+d6() if False else random.randint(1,8), armor=1,
             call_dice_fn=lambda: 4,     # 1 HD + 3 (sword d8)
             attacks=1, blow_dice=1, reserve=1, monster=True)

OGRE_HP = None   # override the ogre's HP (None = roll 4d6+2) to test solo survival time

def make_ogre():
    hp = OGRE_HP if OGRE_HP is not None else sum(d6() for _ in range(4))+2
    o = C("Ogre", "foe", hp_max=hp, armor=1,  # 4d6+2 HP by default
          call_dice_fn=lambda: 10,    # 4 HD + 6 (giant club WC6)
          attacks=OGRE_ATTACKS, blow_dice=3, reserve=3, monster=True)
    o.half_armor = True   # hide covers only half the body: 50% of hits meet AC0
    o.size = 1            # Large (one size up from a human)
    return o

def make_troll():
    return C("Troll", "foe", hp_max=sum(d6() for _ in range(10)), armor=2,  # 2d6/HD * 5 = 10d6
             call_dice_fn=lambda: 9,     # 5 HD + 4 (claw+bite naturals)
             attacks=3, blow_dice=1, reserve=3, monster=True, regen=TROLL_REGEN, size=1)

SCENARIOS = {
    "3 Orcs":  lambda: [make_orc() for _ in range(3)],
    "5 Orcs":  lambda: [make_orc() for _ in range(5)],
    "Ogre":    lambda: [make_ogre()],
    "Troll":   lambda: [make_troll()],
}

# ---------- Heat as a shared enemy reserve pool ----------
class HeatReserve:
    def __init__(self, heat): self.dice = [d6() for _ in range(heat)]

def run_fight(scenario_fn, heat, targeting, max_rounds=40):
    party = make_party()
    foes = scenario_fn()
    # Ogre: AC1 over half body -> 50% of hits meet AC0. Model by per-fight coin? Simpler: per hit.
    heat_pool = [d6() for _ in range(heat)]
    for c in party + foes: c.do_call()
    # append shared heat dice to the foe side once: distribute into foes' fuel pools evenly at Call
    fi = 0
    for die in heat_pool:
        foes[fi % len(foes)].fuel.append(die); fi += 1

    for rnd in range(1, max_rounds + 1):
        if rnd > 1:
            for c in party + foes:
                if c.active: c.refill()
            for c in foes:   # regeneration (troll): heals unless a fire counter is used (not modeled here)
                if c.active and c.regen and not FIRE and 0 < c.hp < c.hp_max:
                    c.hp = min(c.hp_max, c.hp + c.regen)
                if c.active and c.area_every and c.area_timer > 0:
                    c.area_timer -= 1   # breath recharge
        for c in party + foes:
            c.shield_block_used = False
        live_foes = [f for f in foes if f.active]
        front = live_foes[:CHOKE] if CHOKE else live_foes   # only the front rank is in reach
        assign_targets(party, front, targeting)
        order = sorted([c for c in party if c.active] + list(front),
                       key=lambda c: (c.initiative(), random.random()), reverse=True)
        for actor in order:
            if not actor.active: continue
            if actor.side == "party":
                take_turn(actor, [p for p in party if p is not actor], front, None)
            else:
                take_turn(actor, [f for f in front if f is not actor], party, None)
            if all(not f.active for f in foes): break
            if all((not p.active) for p in party): break
        if all(not f.active for f in foes):
            standing = [p for p in party if p.active]
            return dict(win=True, stale=False, rounds=rnd,
                        aldric=not party[0].dead, senna=not party[1].dead, pip=not party[2].dead,
                        standing=len(standing))
        if all(not p.active for p in party):
            return dict(win=False, stale=False, rounds=rnd,
                        aldric=not party[0].dead, senna=not party[1].dead, pip=not party[2].dead,
                        standing=0)
    # round cap reached with foes still standing: the party could not finish them and
    # would withdraw (or must switch tactics, e.g. fire on a regenerator). Not a win.
    return dict(win=False, stale=True, rounds=max_rounds,
                aldric=not party[0].dead, senna=not party[1].dead,
                pip=not party[2].dead, standing=sum(1 for p in party if p.active))

def batch(scenario_name, heat, targeting, n):
    wins = rounds = alds = sens = pips = stand = 0
    tpk = stale = 0
    for _ in range(n):
        r = run_fight(SCENARIOS[scenario_name], heat, targeting)
        wins += r["win"]; rounds += r["rounds"]; stale += r.get("stale", False)
        alds += r["aldric"]; sens += r["senna"]; pips += r["pip"]; stand += r["standing"]
        if r["standing"] == 0 and not r["win"]: tpk += 1
    return dict(n=n, win=wins/n, rounds=rounds/n, aldric=alds/n, senna=sens/n, pip=pips/n,
                stand=stand/n, tpk=tpk/n, stale=stale/n)

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
