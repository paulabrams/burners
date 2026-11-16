#!/usr/bin/env python3
"""
Referee-speed Hit Dice Monte Carlo (Lothian crab / Wet Devil).

Monster durability = one physical die per Hit Die on the table.
  soft: hd_off = round(damage / 10)
  hard: hd_off = max(0, round(damage / 10) - 1)
  kryptonite: use soft rounding (no -1)

Heat pile is separate (Initiative + optional press); not modeled as offense dice here —
monsters deal flat quotes. PCs burn blow_dice d6 as a simplified Fuel spend each attack.

Cracked: HD <= half (floor) AND a Spark this blow → no further meaning except
quotes stay; dead at 0 HD. (Spark = any PC blow that includes a face-6 burned.)
"""
from __future__ import annotations

import random
import statistics
from dataclasses import dataclass, field


def d6() -> int:
    return random.randint(1, 6)


def hd_off(damage: int, hard: bool, kryptonite: bool) -> int:
    base = int(round(damage / 10))
    if hard and not kryptonite:
        return max(0, base - 1)
    return base


@dataclass
class PC:
    name: str
    hp: int
    armor: int
    blow_dice: int  # dice burned per attack
    attacks: int = 1
    kryptonite: bool = False  # poleax vs shell
    spark_sever: bool = False  # can Sever many-part (uses a 6 if present)


@dataclass
class Monster:
    name: str
    hd_max: int
    hard: bool
    quote: int
    attacks: int
    many_part: bool = False
    HD: int = 0
    limbs: int = 0
    dead: bool = False
    cracked: bool = False

    def __post_init__(self) -> None:
        self.hd = self.hd_max
        self.limbs = self.attacks


def roll_blow(pc: PC) -> tuple[int, bool, bool]:
    """Return (damage, sparked, sever_if_available).

    blow_dice = Fuel faces burned on the attack (table dumps are chunky —
    Herrick logged 15 on the crabs).
    """
    faces = [d6() for _ in range(pc.blow_dice)]
    damage = sum(faces)
    sparked = 6 in faces
    sever = bool(pc.spark_sever and sparked)
    return damage, sparked, sever


def pc_party_session2() -> list[PC]:
    # Fuel spends sized to match Session 2 table feel (Herrick blow 15).
    return [
        PC("Herrick", hp=1, armor=3, blow_dice=3),
        PC("Reinhardt", hp=3, armor=3, blow_dice=3, kryptonite=True),
        PC("Bellemy", hp=4, armor=1, blow_dice=2),
        PC("Gar", hp=1, armor=2, blow_dice=2),
    ]


def pc_party_session3() -> list[PC]:
    return [
        PC("Herrick", hp=1, armor=3, blow_dice=3),
        PC("Reinhardt", hp=3, armor=3, blow_dice=3, spark_sever=True),
        PC("Bellemy", hp=4, armor=1, blow_dice=2),
        PC("Egil", hp=5, armor=1, blow_dice=2),
        PC("Spade", hp=2, armor=1, blow_dice=3),
        PC("Ylva", hp=2, armor=2, blow_dice=2),
        PC("Gar", hp=1, armor=2, blow_dice=2),
    ]


def make_crabs(n: int = 3) -> list[Monster]:
    return [
        Monster(f"Crab{i+1}", hd_max=3, hard=True, quote=4, attacks=1)
        for i in range(n)
    ]


def make_devil(brood: bool = True) -> Monster:
    # Brood default: few quotes until Frenzy. Session 3 ran many arms —
    # toggle brood=False for that TPK-path standup.
    return Monster(
        "WetDevil",
        hd_max=8,
        hard=False,  # sushi
        quote=3,
        attacks=3 if brood else 8,
        many_part=True,
    )


@dataclass
class FightResult:
    win: bool
    rounds: int
    pc_hp_left: dict
    hd_removed: int
    cracked_hit: bool
    tpk: bool
    note: str = ""


def focus_target(monsters: list[Monster]) -> Monster | None:
    live = [m for m in monsters if not m.dead]
    if not live:
        return None
    return min(live, key=lambda m: (m.hd, m.hd_max))


def apply_pc_damage(
    m: Monster, damage: int, sparked: bool, sever: bool, pc: PC
) -> None:
    if m.dead:
        return
    off = hd_off(damage, m.hard, pc.kryptonite and m.hard)
    if off:
        m.hd = max(0, m.hd - off)
    if sever and m.many_part and m.limbs > 1:
        m.limbs -= 1
    half = m.hd_max // 2
    if not m.cracked and m.hd <= half and sparked:
        m.cracked = True
    if m.hd <= 0:
        m.dead = True
        m.hd = 0


def monster_swing(m: Monster, pcs: list[PC], max_attacks: int | None = None) -> None:
    if m.dead:
        return
    live = [p for p in pcs if p.hp > 0]
    if not live:
        return
    n = min(m.limbs, m.attacks)
    if max_attacks is not None:
        n = min(n, max_attacks)
    for _ in range(n):
        live = [p for p in pcs if p.hp > 0]
        if not live:
            return
        # Prefer the front-liner (highest armor), not the HP-1 soft target —
        # matches "Reinhardt holds / party doesn't feed Gar to claws."
        target = max(live, key=lambda p: (p.armor, p.hp))
        raw = m.quote
        # Unlimited Defend once in melee: burn 1d6 (fighters often more — keep 1)
        defend = d6()
        through = max(0, raw - target.armor - defend)
        target.hp -= through


def fight_crabs(n_fights: int = 5000) -> dict:
    wins = rounds = tpks = 0
    round_list = []
    survivors = {n: 0 for n in ["Herrick", "Reinhardt", "Bellemy", "Gar"]}
    for _ in range(n_fights):
        pcs = pc_party_session2()
        # fresh HP copies
        for p, hp in zip(pcs, [1, 3, 4, 1]):
            p.hp = hp
        monsters = make_crabs(3)
        r = 0
        cracked_any = False
        while r < 30:
            r += 1
            # PCs act (party mostly before crabs — ignore init variance)
            for pc in pcs:
                if pc.hp <= 0:
                    continue
                for _ in range(pc.attacks):
                    t = focus_target(monsters)
                    if not t:
                        break
                    dmg, sparked, sever = roll_blow(pc)
                    apply_pc_damage(t, dmg, sparked, sever, pc)
                    if t.cracked:
                        cracked_any = True
            if all(m.dead for m in monsters):
                wins += 1
                rounds += r
                round_list.append(r)
                for p in pcs:
                    if p.hp > 0:
                        survivors[p.name] += 1
                break
            for m in monsters:
                if not m.dead:
                    monster_swing(m, pcs, max_attacks=1)
            if all(p.hp <= 0 for p in pcs):
                tpks += 1
                rounds += r
                round_list.append(r)
                break
        else:
            # timeout = loss
            tpks += 1
            round_list.append(r)
    return {
        "scenario": "3 hard crabs (HD 3 each) vs Session 2 party",
        "n": n_fights,
        "win%": 100 * wins / n_fights,
        "tpk%": 100 * tpks / n_fights,
        "avg_rounds": statistics.mean(round_list) if round_list else 0,
        "survive%": {k: 100 * v / n_fights for k, v in survivors.items()},
    }


def fight_devil(
    n_fights: int = 5000,
    hard: bool = False,
    brood: bool = True,
    heat_note: str = "soft sushi",
    party_first: bool = True,
) -> dict:
    wins = tpks = 0
    round_list = []
    reinhardt_hurt = 0
    cracked_fights = 0
    for _ in range(n_fights):
        pcs = pc_party_session3()
        for p, hp in zip(pcs, [1, 3, 4, 5, 2, 2, 1]):
            p.hp = hp
        devil = make_devil(brood=brood)
        devil.hard = hard
        r = 0
        saw_crack = False
        while r < 40:
            r += 1

            def party_pass() -> None:
                nonlocal saw_crack
                for pc in pcs:
                    if pc.hp <= 0:
                        continue
                    for _a in range(pc.attacks):
                        if devil.dead:
                            return
                        dmg, sparked, sever = roll_blow(pc)
                        apply_pc_damage(devil, dmg, sparked, sever, pc)
                        if devil.cracked:
                            saw_crack = True

            def devil_pass() -> None:
                nonlocal reinhardt_hurt
                rh = next(p for p in pcs if p.name == "Reinhardt")
                before = rh.hp
                monster_swing(devil, pcs)
                if rh.hp < before:
                    reinhardt_hurt += 1

            if party_first:
                party_pass()
                if devil.dead:
                    wins += 1
                    round_list.append(r)
                    if saw_crack:
                        cracked_fights += 1
                    break
                devil_pass()
            else:
                devil_pass()
                if all(p.hp <= 0 for p in pcs):
                    tpks += 1
                    round_list.append(r)
                    break
                party_pass()
                if devil.dead:
                    wins += 1
                    round_list.append(r)
                    if saw_crack:
                        cracked_fights += 1
                    break

            if all(p.hp <= 0 for p in pcs):
                tpks += 1
                round_list.append(r)
                break
        else:
            tpks += 1
            round_list.append(r)

    return {
        "scenario": f"Wet Devil HD 8 ({heat_note}) vs Session 3 party",
        "n": n_fights,
        "win%": 100 * wins / n_fights,
        "tpk%": 100 * tpks / n_fights,
        "avg_rounds": statistics.mean(round_list) if round_list else 0,
        "reinhardt_hurt_fights%": 100 * reinhardt_hurt / n_fights,
        "cracked_before_death%": 100 * cracked_fights / max(wins, 1),
    }


def round1_kill_rate(n: int = 5000, hard: bool = False) -> float:
    """Fraction of fights where Devil dies before acting (party-first one pass)."""
    kills = 0
    for _ in range(n):
        pcs = pc_party_session3()
        devil = make_devil(brood=True)
        devil.hard = hard
        for pc in pcs:
            dmg, sparked, sever = roll_blow(pc)
            apply_pc_damage(devil, dmg, sparked, sever, pc)
            if devil.dead:
                kills += 1
                break
    return 100 * kills / n


def avg_HD_from_one_pass(n: int = 5000, hard: bool = False) -> float:
    total = 0
    for _ in range(n):
        pcs = pc_party_session3()
        devil = make_devil()
        devil.hard = hard
        start = devil.hd
        for pc in pcs:
            dmg, sparked, sever = roll_blow(pc)
            apply_pc_damage(devil, dmg, sparked, sever, pc)
        total += start - devil.hd
    return total / n


def main() -> None:
    random.seed(20260722)
    N = 8000
    print("=== Hit Dice Referee-speed sim ===")
    print("rule: round(dmg/10); hard −1; kryptonite skips −1; dead at 0 HD")
    print("PC blows: fighters 3d6 Fuel faces, supports 2d6 (matches Herrick's 15-ish)\n")

    crabs = fight_crabs(N)
    for k, v in crabs.items():
        print(f"  {k}: {v}")
    print()

    for label, hard, brood in [
        ("soft sushi + brood (3 quotes)", False, True),
        ("soft sushi + frenzy (8 quotes)", False, False),
        ("hard curse-hide + brood", True, True),
    ]:
        d = fight_devil(N, hard=hard, brood=brood, heat_note=label)
        r1 = round1_kill_rate(N, hard=hard)
        d["round1_kill%_before_her_turn"] = r1
        d["avg_HD_stripped_round1"] = round(avg_HD_from_one_pass(2000, hard), 2)
        print(f"--- Wet Devil: {label} ---")
        for k, v in d.items():
            print(f"  {k}: {v}")
        print()

    print("=== Conversion check ===")
    for dmg in (4, 11, 15, 18):
        soft = hd_off(dmg, False, False)
        hard = hd_off(dmg, True, False)
        kryp = hd_off(dmg, True, True)
        print(f"  dmg {dmg:2d} → soft {soft}  hard {hard}  kryptonite {kryp}")

    # Expected HD from mean damage
    print("\n=== Expected HD / attack (mean d6) ===")
    for name, nd, kryp in [("3d6 fighter", 3, False), ("3d6 poleax", 3, True), ("2d6 support", 2, False)]:
        # monte mean
        soft_h = hard_h = kryp_h = 0
        trials = 5000
        for _ in range(trials):
            dmg = sum(d6() for _ in range(nd))
            soft_h += hd_off(dmg, False, False)
            hard_h += hd_off(dmg, True, False)
            kryp_h += hd_off(dmg, True, True)
        print(
            f"  {name}: soft {soft_h/trials:.2f}  hard {hard_h/trials:.2f}  "
            f"kryptonite {kryp_h/trials:.2f}"
        )


if __name__ == "__main__":
    main()
