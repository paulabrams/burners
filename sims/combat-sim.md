# Combat Sim

Monte Carlo pass of the Burners Fuel/Sparks engine under **binary armor**:

- Defend cuts Damage first.
- Remaining Damage at or below AC / Resistance stops; higher Damage sinks in whole.
- Monsters use normal AC rather than folded-AC HP.
- At 0 HP a monster is **Cracked!**; the next damaging hit drops it.

Simulator: `sims/sim.py`. Sample party: Aldric / Senna / Pip. Each baseline cell is 8,000 fights; curves use 4,000. Heat 6 unless noted. All-melee, no surprise, no ranged softening — a worst case that favors the monsters.

## The short answer

Binary armor makes the exchange swingier. Armor completely catches weak remainders, but once a blow beats AC it loses none of its force. The extra hit required after a monster reaches 0 also gives enemy numbers more time to drain Fuel.

For this three-Burner sample, **four orcs are now the knife-edge**: about 70% party wins in the open, 79% behind Aldric. Five orcs are usually lethal: about 20% wins in the open, 37% behind Aldric. Solo ogres and trolls remain near-certain wins because three Burners can focus them.

## Baseline (open melee, Heat 6)

| Scenario | win% | rounds | Ald% | Sen% | Pip% | stand | TPK% |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 3 Orcs | 97.2 | 7.5 | 94.0 | 90.3 | 90.5 | 2.68 | 1.6 |
| 5 Orcs | 20.6 | 16.6 | 20.7 | 19.9 | 20.4 | 0.47 | 72.0 |
| Ogre | 99.5 | 4.1 | 89.8 | 98.3 | 97.0 | 2.84 | 0.2 |
| Troll | 99.8 | 5.7 | 95.5 | 98.4 | 97.6 | 2.90 | 0.0 |

Front line (Aldric holds; monsters swing at him first):

| Scenario | win% | rounds | Ald% | Sen% | Pip% | stand | TPK% |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 3 Orcs | 97.9 | 6.8 | 88.4 | 97.5 | 96.5 | 2.79 | 1.5 |
| 5 Orcs | 35.6 | 14.6 | 14.3 | 38.6 | 38.0 | 0.85 | 59.4 |
| Ogre | 99.2 | 4.3 | 93.2 | 95.3 | 97.3 | 2.84 | 0.4 |
| Troll | 99.8 | 5.4 | 95.7 | 99.6 | 97.8 | 2.92 | 0.0 |

## Heat sweep (3 Orcs, open)

| Heat | win% | rounds | TPK% |
| --- | --- | --- | --- |
| 0 | 99.7 | 4.6 | 0.1 |
| 3 | 98.9 | 5.9 | 0.6 |
| 6 | 97.4 | 7.5 | 1.8 |
| 9 | 94.7 | 9.4 | 3.5 |
| 12 | 90.1 | 11.2 | 7.0 |

## Orc count curve

| Orcs | Open win % | Open TPK % | Front win % | Front TPK % |
| --- | --- | --- | --- | --- |
| 3 | 97.1 | 1.8 | 98.0 | 1.4 |
| 4 | 69.8 | 23.2 | 78.7 | 18.0 |
| 5 | 20.1 | 72.0 | 36.6 | 58.0 |
| 6 | 2.2 | 96.1 | 9.9 | 87.4 |
| 7 | 0.1 | 99.8 | 1.6 | 97.8 |
| 8 | 0.0 | 100.0 | 0.2 | 99.6 |

Front-line play buys roughly one orc of margin. Numbers drain Fuel, and every Cracked foe still needs a finishing blow.

## Solos and adds

| Scenario | win % | TPK % | rounds |
| --- | --- | --- | --- |
| Ogre alone | 99.6 | 0.1 | 4.2 |
| Ogre + 2 Orcs | 60.1 | 24.2 | 18.7 |
| Ogre + 4 Orcs | 1.4 | 94.6 | 12.7 |
| Troll alone | 99.8 | 0.0 | 5.8 |
| Troll + 2 Orcs | 62.3 | 20.3 | 20.7 |

Adds split focus, eat Block budget, and survive for a finishing hit. A lone melee monster still cannot beat three focused Burners who have all meleed.

## Troll regeneration

Solo troll, open, Heat 6. HP 25, hide as gambeson (AC 2):

| Regen / round | win % | stale % | TPK % |
| --- | --- | --- | --- |
| 0 | 99.8 | 0.1 | 0.1 |
| 1 | 98.4 | 1.6 | 0.0 |
| 2 | 96.1 | 3.9 | 0.1 |
| 3 | 87.5 | 12.4 | 0.1 |

The simulator does not currently regenerate a troll after it reaches Cracked. Set `FIRE = True` to suppress regeneration before Cracked.

## Combatants

| Burner | Approach | HP | Armor | Pool | Attacks | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| Aldric | Sword 1 | 1d6 | AC 3 (mail) | 7 | 2 | rotella (Cover); holds 1 attack to Block when 2+ foes |
| Senna | Sorcerie 1 | 1d6 | AC 1 | 5 | 1 | one Stanch; dagger otherwise |
| Pip | Craft 1 | 1d6 | AC 1 | 7 | 1 | two-handed spear (2 dice) |

| Foe | HD | HP | AC | Resistance | Pool | Attacks | Blow |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Orc | 1 | 1d8 | 1 (leather) | 0 | 4 | 1 | 1 |
| Ogre | 4+2 | 4d6+2 | 1 (hide as leather) | 0 | 10 | 1 | 3 |
| Troll | 5 | 25 | 2 (hide as gambeson) | 0 | 9 | 3 | 1 each |

## Engine notes

- Defend caps: melee 1 die, or unlimited if you meleed this round; missile 1 / 2 with Cover; hostile magic unlimited. In the dirt, spent dice are re-rolled.
- Block spends one attack and redirects the blow onto the blocker (PCs only).
- Shock: `2d6 + Sword` vs total wound severity; fail → shock table on the raw 2d6.
- Post-fight: wounded Burners need help + `2d6 + Craft` vs severity or die. All-down mid-fight counts as a coup / TPK.
- Not modeled: Ward, poleax armor-break Sparks, called shots, Stunts, morale, or terrain chokepoints in the baseline.

## How to re-run

```bash
python3 sims/sim.py
```

Toggles at the top of `sim.py`: `BINARY_ARMOR`, `OGRE_ATTACKS`, `TROLL_REGEN`, `CHOKE`, `PARTY_HP`, `FIRE`, `OGRE_HP`.
