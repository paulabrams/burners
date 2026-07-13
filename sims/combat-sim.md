# Combat Sim

Monte Carlo pass of the Burners Fuel/Sparks engine against the **current** rules
(Defend without limit after any melee this round, **Block** as redirect-onto-self,
**Cover** vs missiles, Shock as `2d6 + Sword` vs wound severity, monsters with
AC folded into HP). Simulator: `sims/sim.py`. Sample party: Aldric / Senna / Pip.

Each baseline cell is 8,000 fights; curves use 4,000. Heat 6 unless noted.
All-melee, no surprise, no ranged softening — a worst case that favors the monsters.

## The short answer

Headcount is still the lethal axis. Five equal Hit-Die mooks in the open is the
knife-edge for this party (~69% win, ~25% TPK). Holding the front (Aldric draws)
lifts that to ~78%. A lone ogre or troll without adds is still a near-certain win;
adds flip the fight. Regeneration alone (with AC folded into HP, no per-blow
Resistance) barely saves a solo troll — fire still matters, but the scary troll
is the one with friends.

Compared to the older Parry/Dodge/shield-Block pass: unlimited Defend after any
melee makes the party a little safer at the fair fight (was ~52% at five orcs;
now ~69%), and the gradient stays steep — six orcs in the open is already a likely wipe.

## Baseline (open melee, Heat 6)

| Scenario | win% | rounds | Ald% | Sen% | Pip% | stand | TPK% |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 3 Orcs | 99.6 | 4.5 | 99.4 | 97.2 | 97.4 | 2.91 | 0.2 |
| 5 Orcs | 68.6 | 15.5 | 72.2 | 62.9 | 64.6 | 1.83 | 24.5 |
| Ogre | 99.7 | 4.6 | 97.4 | 98.9 | 98.4 | 2.93 | 0.1 |
| Troll | 99.7 | 6.6 | 99.6 | 99.2 | 98.5 | 2.96 | 0.0 |

Front line (Aldric holds; monsters swing at him first):

| Scenario | win% | rounds | Ald% | Sen% | Pip% | stand | TPK% |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 3 Orcs | 99.7 | 4.3 | 98.8 | 99.5 | 98.7 | 2.96 | 0.2 |
| 5 Orcs | 77.9 | 12.7 | 67.7 | 79.1 | 79.1 | 2.19 | 18.9 |
| Ogre | 99.5 | 4.6 | 98.5 | 98.0 | 98.3 | 2.93 | 0.2 |
| Troll | 99.9 | 6.4 | 99.5 | 99.7 | 98.8 | 2.98 | 0.0 |

Heat sweep (3 Orcs, open) — still a gentle dial:

| Heat | win% | rounds | TPK% |
| --- | --- | --- | --- |
| 0 | 100.0 | 3.0 | 0.0 |
| 3 | 99.9 | 3.6 | 0.1 |
| 6 | 99.7 | 4.4 | 0.1 |
| 9 | 99.4 | 5.2 | 0.3 |
| 12 | 98.7 | 6.2 | 0.7 |

## Fair-fight curve (orc count)

| Orcs | Open win % | Open TPK % | Front win % | Front TPK % |
| --- | --- | --- | --- | --- |
| 3 | 99.7 | 0.2 | 99.8 | 0.1 |
| 4 | 95.2 | 3.2 | 96.1 | 2.9 |
| 5 | 68.8 | 24.8 | 77.9 | 18.5 |
| 6 | 29.8 | 63.6 | 44.7 | 49.9 |
| 7 | 7.6 | 89.1 | 16.8 | 79.9 |
| 8 | 1.1 | 98.5 | 4.6 | 93.4 |

Five in the open is the fair window; six is a likely wipe. Front-line play buys
about one orc of margin. The coverage story under current rules: once a Burner has
meleed this round they Defend without limit against **every** melee blow, and Aldric
can spend an attack to **Block** (redirect) for a friend. The fifth and sixth bodies
still win by draining Fuel faster than the 1-die refill restores it.

## HP roll at the fair fight

Fixed starting HP, 5 Orcs, open, Heat 6 (N=4,000):

| Party HP each | win % |
| --- | --- |
| 2 | 57.0 |
| 3 | 67.2 |
| 4 | 75.6 |
| 5 | 82.0 |
| 6 | 87.3 |

Rolling 1d6 (mean ~3.5) lands near ~69%, in line with the table. The level-1 HP
lottery still matters most when the fight is already on the knife-edge.

## Solos and adds

| Scenario | win % | TPK % | rounds |
| --- | --- | --- | --- |
| Ogre alone | 99.7 | 0.1 | 4.6 |
| Ogre + 2 Orcs | 80.5 | 9.8 | 14.9 |
| Ogre + 4 Orcs | 13.6 | 73.6 | 18.7 |
| Troll alone | 99.9 | 0.0 | 6.6 |
| Troll + 2 Orcs | 81.3 | 5.1 | 17.4 |

A lone melee monster still cannot beat three focused Burners who have all meleed
(unlimited Defend, gang damage). Adds split focus and eat Block budget — that is
still the lever. Area/breath and regeneration remain the other two roads; this pass
did not re-sweep breath.

## Troll regeneration

Solo troll, open, Heat 6. HP is `5 × HD +` folded soak (`25 + 20 = 45`); no
per-blow Resistance. Under that conversion, regen is a weak solo lever:

| Regen / round | win % | stale % |
| --- | --- | --- |
| 0 | 99.8 | 0.2 |
| 1 | 99.3 | 0.7 |
| 2 | 99.1 | 0.9 |
| 3 | 96.5 | 3.5 |

Fire on a regen-3 solo: win ~99.8% (stale ~0.2%). A Resistance-lane troll (soak
kept as per-blow Resistance instead of folded HP) would chip much slower and make
regen matter more — worth a follow-up if you run hide as Resistance.

## Combatants

| Burner | Approach | HP | Armor | Pool | Attacks | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| Aldric | Sword 1 | 1d6 | AC 3 (mail) | 7 | 2 | rotella (Cover); holds 1 attack to Block when 2+ foes |
| Senna | Sorcerie 1 | 1d6 | AC 1 | 5 | 1 | one Stanch; dagger otherwise |
| Pip | Craft 1 | 1d6 | AC 1 | 7 | 1 | two-handed spear (2 dice) |

| Foe | HD | HP | Resistance | Pool | Attacks | Blow |
| --- | --- | --- | --- | --- | --- | --- |
| Orc | 1 | 1d8+2 (fold soak 1) | 0 | 4 | 1 | 1 |
| Ogre | 4+2 | 4d6+2+8 (fold soak 1) | 0 | 10 | 1 | 3 |
| Troll | 5 | 45 (5×HD + fold soak 2) | 0 | 9 | 3 | 1 each |

## Engine notes

- Defend caps: melee 1 die, or unlimited if you meleed this round; missile 1 / 2 with
  Cover; hostile magic unlimited. In the dirt, spent dice are re-rolled.
- Block spends one attack and redirects the blow onto the blocker (PCs only).
- Shock: `2d6 + Sword` vs total wound severity; fail → shock table on the raw 2d6.
- Post-fight: wounded Burners need help + `2d6 + Craft` vs severity or die (Pip's
  Craft 1 helps allies). All-down mid-fight counts as a coup / TPK.
- Monsters die at 0 HP. Heat dice join the enemy pools once at the Call.
- Not modeled: Ward, called shots, soft-target bonuses, Stunts, rising-under-press
  beyond dirt re-rolls, terrain chokepoints in the baseline (toggle `CHOKE` in the sim).

## How to re-run

```bash
python3 sims/sim.py
```

Toggles at the top of `sim.py`: `OGRE_ATTACKS`, `TROLL_REGEN`, `CHOKE`, `PARTY_HP`, `FIRE`, `OGRE_HP`.
