# Combat Sim

Monte Carlo pass of the Burners Fuel/Sparks engine against the **current** rules
(Defend without limit after any melee this round, **Block** as redirect-onto-self,
**Cover** vs missiles, Shock as `2d6 + Sword` vs wound severity, monsters with
AC folded into HP).

- PC armor and monster Resistance subtract from every blow.
- At **0 down to −Max HP** a monster is **Cracked!** (no Resistance, no Fuel refill; next damaging hit drops it).
- **Past −Max HP** it is **Splatted!**

Simulator: `sims/sim.py`. Sample party: Aldric / Senna / Pip. Each baseline cell is 8,000 fights; curves use 4,000. Heat 6 unless noted. All-melee, no surprise, no ranged softening — a worst case that favors the monsters.

## The short answer

Headcount remains the lethal axis. Cracked gives each monster a final stretch unless a blow Splats it outright, so five equal Hit-Die mooks are harder than in the pre-Cracked subtractive pass.

For this three-Burner sample, four orcs favor the party; five are the knife-edge: about 40% party wins in the open and 61% behind Aldric. Solo ogres and trolls remain near-certain wins; adds flip the fight.

## Baseline (open melee, Heat 6)

| Scenario | win% | rounds | Ald% | Sen% | Pip% | stand | TPK% |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 3 Orcs | 98.2 | 6.1 | 99.5 | 97.2 | 97.7 | 2.91 | 0.1 |
| 5 Orcs | 40.2 | 20.8 | 61.9 | 58.0 | 58.7 | 1.49 | 36.5 |
| Ogre | 99.6 | 4.7 | 97.5 | 99.3 | 98.6 | 2.94 | 0.1 |
| Troll | 99.8 | 6.6 | 99.6 | 99.4 | 98.9 | 2.97 | 0.0 |

Front line (Aldric holds; monsters swing at him first):

| Scenario | win% | rounds | Ald% | Sen% | Pip% | stand | TPK% |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 3 Orcs | 99.4 | 5.8 | 98.6 | 99.6 | 98.8 | 2.96 | 0.2 |
| 5 Orcs | 61.1 | 16.5 | 53.0 | 68.3 | 67.7 | 1.79 | 31.1 |
| Ogre | 99.1 | 4.8 | 98.9 | 98.2 | 98.8 | 2.94 | 0.1 |
| Troll | 99.9 | 6.4 | 99.6 | 99.9 | 98.8 | 2.98 | 0.0 |

## Heat sweep (3 Orcs, open)

| Heat | win% | rounds | TPK% |
| --- | --- | --- | --- |
| 0 | 99.7 | 4.0 | 0.0 |
| 3 | 99.1 | 5.0 | 0.0 |
| 6 | 98.1 | 6.1 | 0.2 |
| 9 | 96.5 | 7.4 | 0.4 |
| 12 | 94.3 | 8.9 | 0.9 |

## Orc count curve

| Orcs | Open win % | Open TPK % | Front win % | Front TPK % |
| --- | --- | --- | --- | --- |
| 3 | 98.2 | 0.2 | 99.4 | 0.1 |
| 4 | 84.6 | 5.1 | 91.5 | 5.0 |
| 5 | 40.4 | 35.7 | 60.4 | 30.6 |
| 6 | 8.2 | 78.5 | 24.0 | 68.5 |
| 7 | 0.3 | 97.4 | 5.3 | 92.0 |
| 8 | 0.0 | 99.9 | 0.6 | 98.7 |

Front-line play buys roughly one orc of margin. Numbers drain Fuel; Cracked foes get no refill and often fall to a finishing poke, while overkill past −Max HP Splats them outright.

## Solos and adds

| Scenario | win % | TPK % | rounds |
| --- | --- | --- | --- |
| Ogre alone | 99.7 | 0.0 | 4.6 |
| Ogre + 2 Orcs | 76.8 | 10.7 | 17.1 |
| Ogre + 4 Orcs | 5.6 | 82.7 | 18.2 |
| Troll alone | 99.9 | 0.0 | 6.6 |
| Troll + 2 Orcs | 79.1 | 4.9 | 19.0 |

Adds split focus, eat Block budget, and leave Cracked survivors with no refill. A lone melee monster still cannot beat three focused Burners who have all meleed.

## Troll regeneration

Solo troll, open, Heat 6. HP is `5 × HD +` folded soak (`25 + 20 = 45`); no per-blow Resistance.

| Regen / round | win % | stale % | TPK % |
| --- | --- | --- | --- |
| 0 | 99.8 | 0.2 | 0.0 |
| 1 | 99.7 | 0.3 | 0.0 |
| 2 | 99.6 | 0.4 | 0.0 |
| 3 | 97.7 | 2.2 | 0.0 |

The simulator does not regenerate a troll after it reaches Cracked (refill and regen both stop). Set `FIRE = True` to suppress regeneration before Cracked.

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
  Cover; hostile magic unlimited. In the dirt, burned dice are re-rolled.
- Block spends one attack and redirects the blow onto the blocker (PCs only).
- Shock: `2d6 + Sword` vs total wound severity; fail → shock table on the raw 2d6.
- Post-fight: wounded Burners need help + `2d6 + Craft` vs severity or die (Pip's
  Craft 1 helps allies). All-down mid-fight counts as a coup / TPK.
- Monsters become Cracked at 0 HP and die on the next damaging hit, or immediately past −Max HP. Heat dice join the enemy pools once at the Call.
- Not modeled: Ward, called shots, soft-target bonuses, Man-handles, rising-under-press
  beyond dirt re-rolls, terrain chokepoints in the baseline (toggle `CHOKE` in the sim).

## How to re-run

```bash
python3 sims/sim.py
```

Toggles at the top of `sim.py`: `OGRE_ATTACKS`, `TROLL_REGEN`, `CHOKE`, `PARTY_HP`, `FIRE`, `OGRE_HP`.
