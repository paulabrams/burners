---
layout: default
title: "combat-sim"
---

# Combat Sim

A Monte Carlo test of the Burners Fuel/Sparks engine, run to answer one question: is the standard fight fair, and what does a fair fight look like for the sample party?

The sample party (Aldric, Senna, Pip) is run against four foe sets. Each cell below is thousands of simulated fights. The simulator models the Initiative roll, turn order, per-round refill, Veteran extra attacks, two-handed power blows, Sparks, Parry/Dodge/Block scarcity, armor soak on the way in, and the full player death funnel (HP, then overflow cuts Strength, then a Wound and a Shock Check, then death at Strength 0). It is regenerated and appended to on a loop, alternating scenarios; a running total sits at the top.

## The short answer

For this party, the lethal axis is the number of separate attackers, not the size of any one monster.

- One HD-1 body per party member is a walkover. Three orcs win the party 99.6% of the time.
- Add two more and you hit the knife-edge. Five orcs in the open is a coin-flip: 52% party win, and a real 48% chance of a total wipe. That is the fair, deadly-but-winnable stand-up fight for a three-Burner party.
- Give the party control of the engagement and it can take more bodies. When Aldric holds the front instead of the orcs picking targets freely, five orcs rises from 52% to 78%. A chokepoint would do the same.
- A single big monster is not scary on its own. Because everyone attacks it, everyone can Parry its one attack, and it gets ganged down before it does much. The ogre dies in about three rounds and rarely drops anyone (100% party win). Even the troll, at 35 average HP, is a twelve-round grind the party still wins 99.8% of the time, because the straight OD&D conversion gives it no regeneration.

So a fair fight is roughly five equal-Hit-Die mooks in the open, or fewer if the monsters can gang the squishies. A lone creature, by contrast, cannot win on its stat line at all: no amount of HP, attacks, or armor-piercing lets one body beat three focused Burners (Batches 4 and 5 pin this down, and an 80-HP three-attack ogre still loses 98%). A solo becomes a real threat only through a different shape: adds that split the party, a regeneration that forces fire or flight, or a telegraphed area attack. This sharpens the OSE Conversions doc's warning: a solo boss does not just need more HP, it needs one of those three tools.

## Running total (baseline: open melee, Heat 6)

Cumulative wins and losses across all batches at the baseline configuration (monsters pick targets freely, Heat 6). This is the apples-to-apples number that accumulates as the loop runs.

| Scenario | Fights | Wins | Losses | Party win % |
| --- | --- | --- | --- | --- |
| 3 Orcs | 136,000 | 135,328 | 672 | 99.5 |
| 5 Orcs | 136,000 | 70,140 | 65,860 | 51.6 |
| Ogre | 136,000 | 135,995 | 5 | 100.0 |
| Troll | 136,000 | 135,714 | 286 | 99.8 |

## This batch in detail

Baseline is 8,000 fights per cell, Heat 6, all-melee (no surprise, no ranged softening, no terrain), which is a worst case that favors the monsters. Two targeting models bracket the truth: "open" (each monster swings at a random living Burner) and "front" (Aldric holds the line and draws the blows until he falls).

win% is the party win rate; rounds is the average fight length; Ald/Sen/Pip % is each character's survival rate (alive at the end, whether standing or downed-but-breathing); stand is the average number of Burners still on their feet at the end; TPK% is the total-wipe rate.

Open melee (monsters pick targets freely):

| Scenario | win% | rounds | Ald% | Sen% | Pip% | stand | TPK% |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 3 Orcs | 99.6 | 4.6 | 99.8 | 96.4 | 97.1 | 2.88 | 0.4 |
| 5 Orcs | 52.3 | 11.7 | 69.5 | 51.9 | 54.2 | 1.24 | 47.7 |
| Ogre | 100.0 | 2.9 | 96.9 | 82.7 | 92.2 | 2.69 | 0.0 |
| Troll | 99.8 | 11.8 | 100.0 | 91.7 | 97.9 | 2.85 | 0.0 |

Front line (Aldric holds; monsters swing at him first):

| Scenario | win% | rounds | Ald% | Sen% | Pip% | stand | TPK% |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 3 Orcs | 99.8 | 3.6 | 99.8 | 99.9 | 99.9 | 2.98 | 0.2 |
| 5 Orcs | 78.0 | 7.9 | 81.8 | 83.0 | 84.5 | 2.21 | 22.0 |
| Ogre | 100.0 | 2.6 | 88.3 | 100.0 | 100.0 | 2.86 | 0.0 |
| Troll | 100.0 | 9.5 | 100.0 | 100.0 | 100.0 | 3.00 | 0.0 |

Reading the two tables together: holding the front turns the 5-orc coin-flip into a solid win and cuts the wipe rate from 48% to 22%. It also shifts who dies. In the open the squishes (Senna, Pip) die about as often as they live; with Aldric drawing the blows, everyone's survival climbs into the 80s, and Aldric himself takes slightly more punishment against the ogre (his survival drops to 88% because he is now the one eating every club swing).

Heat sweep (3 Orcs, open melee) shows Heat is a gentle dial, not a cliff. It adds enemy Fuel (more defense and tempo) but no extra attackers, so it lengthens fights more than it wins them:

| Heat | win% | rounds | TPK% |
| --- | --- | --- | --- |
| 0 | 100.0 | 2.9 | 0.0 |
| 3 | 99.9 | 3.7 | 0.1 |
| 6 | 99.6 | 4.7 | 0.4 |
| 9 | 98.7 | 5.9 | 1.3 |
| 12 | 96.5 | 7.1 | 3.5 |

## The fair-fight curve (orc count)

Batch 3 swept the number of HD-1 orcs to map the difficulty gradient and pin the fair-fight point. Open melee and front-line (Aldric holds), Heat 6, 8,000 fights per cell.

| Orcs | Open win % | Open TPK % | Front win % | Front TPK % |
| --- | --- | --- | --- | --- |
| 3 | 99.6 | 0.4 | 99.9 | 0.1 |
| 4 | 89.8 | 9.6 | 96.2 | 3.7 |
| 5 | 52.0 | 46.9 | 76.6 | 23.3 |
| 6 | 14.3 | 85.2 | 41.6 | 58.4 |
| 7 | 1.7 | 98.2 | 13.5 | 86.5 |
| 8 | 0.1 | 99.9 | 2.6 | 97.3 |

Two things stand out. First, the fair fight, a genuine coin-flip around 50 to 70 percent party win, is five orcs in the open, or five to six if the party holds a line or a chokepoint. Second, the gradient is brutally steep: four orcs is a likely win (90%) and six is a likely wipe (14%), so the whole fair window is about one orc wide.

This is the defensive-coverage math showing through. A three-Burner party with one shield-tank can cleanly defend about four attackers a round: Aldric Parries the foe he engages and Blocks one other with his shield, while Pip and Senna each Parry only the one they engage. The fifth attacker gets a single Dodge die at best, and every body past that lands closer to whole. Five is exactly where coverage breaks.

The practical upshot for the Guide: encounter lethality is extremely sensitive to headcount right at the party's capacity. Adding one body past four is not a small nudge, it roughly halves the party's odds. That is the dial to respect, far more than Heat or the size of any single monster.

## The HP roll swings the fair fight

At level 1 each Burner rolls 1d6 for HP, and the sim rolls it fresh every fight. Batch 7 fixed that roll at a constant to isolate how much it matters. Party win %, open melee, Heat 6, 8,000 fights per cell.

| Party HP each | 3 Orcs | 5 Orcs | 6 Orcs |
| --- | --- | --- | --- |
| 2 | 99.3 | 43.1 | 8.9 |
| 3 | 99.8 | 53.6 | 14.5 |
| 4 | 99.9 | 60.5 | 19.0 |
| 5 | 100.0 | 67.5 | 23.9 |
| 6 | 100.0 | 73.9 | 28.5 |

Two things. First, HP matters only when the fight is already dangerous. Against three orcs the party wins whatever the roll (99 to 100% from HP 2 to 6); against five or six, each point of HP per Burner is worth about seven or eight points of win rate, so a party that rolled 2s (43% at five orcs) and one that rolled 5s (67%) are fighting very different fights.

Second, the variance itself costs the party. Rolling 1d6 each (average 3.5) lands the five-orc fight at about 51%, roughly six points below what a flat 3.5 HP would give. The fight is decided by the weakest link: a Burner who rolls a 1 or 2 is a soft target the mob picks off, and that downside outweighs the upside of a lucky high roll. So the level-1 HP roll does not merely add swing, it lowers the party's expected odds at the knife-edge.

This is not a flaw, it is the familiar low-level OSR HP lottery, and it is a knob. A flat starting HP (say 4) removes the swing and lifts the fair fight a few points; keeping 1d6 keeps the white-knuckle variance that makes a good roll feel earned. Worth a deliberate choice rather than a default.

## Terrain: a chokepoint raises the fair fight, but attrition caps it

The open-field numbers are a worst case. Batch 6 added a chokepoint (only so many foes can reach the party each round, the rest waiting behind and stepping up as the front falls) to see how far terrain moves the fair fight. Party win % (TPK %), open melee, Heat 6, 8,000 fights per cell.

| Orcs | Open field | 2-wide choke | 1-wide choke |
| --- | --- | --- | --- |
| 5 | 50 (49) | 73 (26) | 93 (6) |
| 6 | 14 (85) | 37 (61) | 69 (24) |
| 7 | 2 (98) | 11 (88) | 34 (53) |
| 8 | 0 (100) | 2 (97) | 9 (75) |
| 10 | 0 (100) | 0 (99) | 0 (83) |
| 12 | 0 (100) | 0 (99) | 0 (82) |

A chokepoint is worth about one to two extra orcs of fair fight. The open-field coin-flip is five orcs; at a two-wide gap it is about six; at a one-wide gap about six or seven. It turns the losing six-orc fight (14% in the open) into a likely win (69% at one-wide).

But terrain has a ceiling, and the ceiling is Fuel. A chokepoint cannot save the party from a true horde: ten or twelve orcs still win even through a one-wide door, killing the party about 80% of the time. The reason is the refill. Everyone tops up only one Fuel die a round, so a long fight grinds every fighter down to a one-die trickle, and a horde behind a chokepoint is a long fight (the ten-orc fights here run about 28 rounds). Once the party is winded, even the thin stream of attacks a one-wide gap allows begins landing whole, and the crew is worn down. This is the engine's own thesis in numbers: it rewards short, decisive fights and punishes taking hit after hit. Terrain buys margin, not immortality; the party must still win fast.

One caveat on the horde figures: the model keeps all three Burners swinging at the front rank every round. A real party at a one-wide door could rotate the tank, rest the back rank to recover Fuel, or shoot bows, all of which extend endurance, so the ten-plus rows are pessimistic. The direction holds regardless: attrition punishes long fights, terrain or no.

## Solo monsters: attacks are not the lever, adds are

Prompted by the question "the ogre is a Veteran, so why doesn't it get more attacks?", this batch tested the solo-monster problem directly. Three results, all at Heat 6, open melee, 8,000 fights per cell.

First, giving the solo ogre more attacks (treating it as a Veteran of rising Sword level) does not help it. It gets worse:

| Ogre model | Party win % | Avg rounds |
| --- | --- | --- |
| 1 attack (Sword 0) | 100.0 | 2.9 |
| 2 attacks (Sword 1) | 100.0 | 2.4 |
| 3 attacks (Sword 2) | 100.0 | 2.2 |
| 5 attacks (Sword 4) | 100.0 | 2.2 |

More attacks makes the ogre die faster, because every die it spends swinging is a die it no longer has to Parry the party's focus-fire, and its extra swings get Parried for free anyway.

The real cause is action economy plus unlimited Parry. All three Burners attack the lone foe, so all three may Parry it (Parry is unlimited against a foe you engage), and they gang its HP down before it lands anything meaningful. This is structural to any solo fight in the current rules: a lone monster grants the whole party free defense against it.

Adds are the fix. The moment the party must split its attacks, it can no longer all-engage-and-Parry the big one:

| Scenario | Party win % | TPK % | Avg rounds |
| --- | --- | --- | --- |
| Ogre alone | 100.0 | 0.0 | 2.9 |
| Ogre + 2 Orcs | 72.2 | 22.9 | 12.1 |
| Ogre + 4 Orcs | 7.1 | 91.9 | 7.3 |
| 2 Ogres | 53.1 | 41.5 | 13.3 |
| Troll alone | 99.8 | 0.0 | 11.9 |
| Troll + 2 Orcs | 86.5 | 5.7 | 20.3 |

And the Veteran-attacks idea is vindicated, but only in context: extra ogre attacks are inert for a solo, yet they start to bite once it has adds, because then its club lands on Burners who are busy engaging an orc and can only Dodge one die. Even so, having the adds matters far more than the attack count (about 20 points versus about 4).

## Why a lone melee monster cannot win (the action-economy ceiling)

Batch 4 tested the two remaining candidate fixes for a solo: a proposed Parry size cap (you cannot cleanly turn a blow from a foe far larger than you, mirroring the Stunt size ladder: one size up caps your Parry or shield Block at two dice, two sizes up drops you to a single Dodge die), and raw HP. Neither rescues a solo, and the reason is structural.

The size cap alone is inert:

| Scenario | Cap off | Cap on |
| --- | --- | --- |
| Ogre (solo) | 100.0 | 99.9 |
| Troll (solo) | 99.7 | 99.7 |
| Ogre + 2 Orcs | 71.5 | 69.7 |
| 5 Orcs (sanity, orcs are not large) | 50.7 | 51.1 |

It does nothing on its own because it lets big blows land, but the ogre throws one blow a round and dies in three rounds, so a few points of leaked damage never accumulate. And it cannot help the troll at all, whose blows are single dice that two Parry dice already smother.

Nor does HP plus attacks plus the cap, even stacked together. A lone ogre, party win % (open, Heat 6):

| Ogre HP | 1 attack, cap on | 3 attacks, cap on |
| --- | --- | --- |
| 16 (normal) | 99.9 | 99.9 |
| 50 | 99.4 | 97.9 |
| 80 | 99.2 | 97.9 |

An ogre with 80 HP (five times normal), three attacks a round, and a Parry-piercing size cap still loses 98% of the time, over a tedious 17-round slog. Per-character survival in that maxed case is Aldric 88%, Senna 71%, Pip 77%: everyone gets chipped, but the monster cannot drop all three before it dies.

The ceiling is action economy crossed with the death funnel. Three Burners focus-firing put roughly four attacks a round into one body and kill it before it can knock out all three of them. And a knocked-out Burner is only unconscious, not dead, so the moment any surviving ally finishes the monster, the downed wake up. A solo therefore has to drop the entire party inside the handful of rounds it survives, which it cannot do. Buffing its HP just lengthens the fight without changing the outcome.

So the levers that actually make a solo dangerous are the two that break this math, not the ones that pump its stats:

- Adds. Minions split the party's focus, occupy its attacks, and can threaten the armored tank the big monster cannot. Ogre plus two orcs is 72% party win with a 24% wipe; the solo ogre is 100%.
- Unparryable, armor-ignoring area or breath. The blow you cannot dodge reaches even the tank and hits the whole party at once, sidestepping both Parry and the action-economy ceiling. This is the dragon's tool, not the ogre's, and it is the reason a breath weapon is a different order of threat from a club.
- Regeneration is a third, special case (see below): it wins not by dropping the party but by being unkillable, which forces fire or flight rather than a fair trade of blows.

The upshot for tuning: do not try to fix a solo boss with HP or damage. Give it minions or a telegraphed area attack. This is exactly the instinct in the OSE Conversions doc, now quantified.

Batch 5 measured the area lever directly. A dragon-style solo (50 HP, soak 2, two claws) with no breath sits at the usual ceiling, 98.8% party win. Give it a breath that hits every Burner at once, ignores armor, and can only be met by a shield (no Parry, no Dodge), firing every third round:

| Breath | Party win % | TPK % |
| --- | --- | --- |
| none | 98.8 | 0.0 |
| 2d6 to all | 0.0 | 96.4 |
| 3d6 to all | 0.0 | 100.0 |
| 4d6 to all | 0.0 | 100.0 |

Even a modest 2d6 breath flips the fight from a near-certain party win to a near-certain wipe. It bypasses everything that made a melee solo harmless: it hits all three at once (no action-economy dilution), it ignores the tank's armor, and it cannot be Parried. This is why a breath weapon is a different order of threat from a club, and it is the mechanical heart of what makes a dragon a dragon. It is also strong enough that the counters the rules already give it, raising a shield, warding it with a caster's Action and a bump of Heat, taking cover, are not flavor but the balancing mechanism. The model here granted only Aldric's shield, so these numbers are a worst case with no warding or cover; a party that gets to answer the telegraph does better.

With this the solo picture is complete. A lone monster has exactly three roads to being a real threat, and none of them is a bigger stat line: adds (break focus, threaten the tank), a regenerator that forces fire or flight, or a telegraphed area attack that the party must actively answer.

## Troll regeneration: the one lever that fixes a solo

Regeneration is the exception to "solos are structurally weak," because it does not fight the party's Parry at all. It attacks their damage output instead. A troll that heals faster than three Burners can chip it (through soak 2, everyone Parried for free or not) simply cannot be killed with steel, no matter how freely the party ganks it. Simulated solo, open melee, Heat 6:

| Regen per round | Solo party win % | Could-not-kill % |
| --- | --- | --- |
| 0 HP | 99.8 | 0.2 |
| 1 HP | 93.9 | 6.1 |
| 2 HP | 77.0 | 22.9 |
| 3 HP (OD&D) | 25.2 | 74.8 |

At the OD&D-authentic 3 HP a round the solo troll flips from a 99.8% party win to 25%, and in three quarters of fights the party cannot grind it down at all: the fight caps out with the troll still standing, nobody wiped (TPK stays near zero), and the only real plays left are fire or withdrawal. This is the design working as intended, and it is the same shape as We Burn Undead: steel is the wrong tool, fire is the right one. Regen is also a smooth dial (1, 2, 3 HP a round maps to 94, 77, 25% party win), so troll deadliness is precisely tunable.

Batch 9 added the counter. Fire suppresses regeneration (the OD&D rule that a troll cannot regrow what the flame took), and it completes the picture:

| Troll config | No fire | With fire |
| --- | --- | --- |
| regen 0 (bare) | 99.8 (0) | 99.8 (0) |
| regen 3 (apex) | 24.9 (0) | 99.8 (0) |
| regen 3 plus 2 Orcs | 12.8 (5) | 86.7 (5) |

Fire is neutral against a non-regenerator, since you only ever need it for something that heals, but against a lone regenerating troll it is the whole fight: 25% party win without it, 99.8% with. It is not a bonus, it is the switch.

This also exposes what a troll encounter should be. A lone troll is a poor fight either way: without fire an unkillable slog the party must flee (25%), with fire trivial (99.8%). The good troll encounter is a troll with adds. Regen 3 plus two orcs is a brutal 13% win without fire and 87% with, so the orcs supply the danger and the wipe risk, the regeneration forces the party to commit to burning it, and doing that plus competent play carries the fight. That is the setting's thesis rendered as an encounter: bring more oil than you think you need. (The model abstracts fire as sustained suppression; in play it costs oil and actions, so a party short on either fares worse.)

## What this suggests for tuning

- Monsters-as-Veterans (extra attacks by HD) is a defensible consistency change, but do not expect it to make big monsters scary. The sim shows it is a weak lever everywhere: nil for a solo, a few points with adds.
- The solo-monster weakness is action economy, not any one stat, and it cannot be fixed by stats (see the action-economy ceiling, above). Three Burners kill a lone body before it can drop all three of them, and downed Burners recover once an ally finishes the monster. Buffing HP, attacks, or defense-piercing (the Parry size cap) does not close it: an 80-HP, three-attack, cap-piercing ogre still loses 98%. The two fixes that work are adds (minions split focus and threaten the tank) and telegraphed area or breath attacks (the blow you cannot dodge, which reaches the whole party including the tank). Field solos with one or the other; do not inflate them.
- The troll's regeneration is confirmed as its whole threat (see above). Without it the troll is a slow, safe grind (99.8% party win); with the OD&D 3 HP a round it becomes unkillable by steel (25% party win, three quarters of fights a stalemate the party must burn or flee). Recommend the baseline troll carry regen 3 plus an explicit fire counter, rather than being run bare.
- The five-orc coin-flip is a good "hard but fair" target for three Burners. If a 48% wipe feels too swingy, the answer in play is terrain and tactics, which the front-line numbers show the party can lean on.

## The combatants

Party sheets. Strength scores are fixed and flagged as assumptions (the sample-party writeup predates ability scores); HP is rolled fresh at 1d6 each fight, per the current level-1 rule, which is the source of much of the swing.

| Burner | Approach | STR | HP | Armor | Call pool | Attacks | Notes |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Aldric | Sword 1 | 13 | 1d6 | AC 3 (full mail) | 7 dice | 2 | heater shield (free Block on one other foe); one-handed sword, 1 die a blow |
| Senna | Sorcerie 1 | 9 | 1d6 | AC 1 (quarter) | 5 dice | 1 | one Stanch (heal or rouse, once); dagger otherwise; frail |
| Pip | Craft 1 | 11 | 1d6 | AC 1 (quarter) | 7 dice | 1 | two-handed spear, 2 dice a power blow |

Call pools are built from the current rule (one die per level, one per weapon slot, one per shield slot, one per empty slot up to four). Aldric's seven dice match the worked example in the core doc.

## The foes

| Foe | HD | HP | Soak | Call pool | Attacks | Per-blow dice |
| --- | --- | --- | --- | --- | --- | --- |
| Orc | 1 | 1d8 | 1 (AC6) | 4 (1 HD + 3 sword) | 1 | 1 |
| Ogre | 4+2 | 4d6+2 | 1 over half the body, else 0 | 10 (4 HD + 6 club WC6) | 1 | 3 |
| Troll | 5 | 10d6 (2d6 per HD) | 2 (AC4) | 9 (5 HD + 4 claw/bite) | 3 (claw/claw/bite) | 1 each |

Conversions follow the OSE Conversions doc: HD sets the pool spine, the damage die sets weapon slots, AC becomes soak by (ascending AC minus 10, halved). Heat is added once to the enemy side as a shared Fuel reserve, not multiplied per monster. The ogre's three-dice club blow matches the worked ogre example in the core (a big two-handed stroke plus a size nudge). The troll's baseline row is run without regeneration, per "use his number of attacks and damage from OD&D"; regeneration is modeled and togglable (TROLL_REGEN), and its large effect is analyzed above.

## Engine assumptions and simplifications

These shape the numbers and are the first things to challenge if a result looks wrong.

- All-melee, everyone in reach of everyone, no surprise round, no ranged pre-softening, no chokepoint. This is a worst case for the party. Real play with archery and terrain favors the party; smart monster focus-fire on the squishes favors the monsters. The two targeting models bracket that range.
- The party focus-fires the weakest live foe. Because they all attack it, they can all Parry it, which is exactly why solo monsters fold.
- Defenders spend Fuel intelligently: Parry the foe they engage (unlimited dice), free shield Block on one other for Aldric, otherwise a single Dodge die, spending the least needed to prevent a wound or blunt a heavy hit and conserving otherwise.
- Sparks are modeled as bonus attacks and ripostes. The optional reroll of a spent 3 or 4 is not modeled (a wash on tempo). Wound soft-target bonuses and called shots are not modeled. Location effects are modeled for the ones that bite (prone from a leg or waist wound, winded from a torso wound); head, arm, and hand wounds are treated lightly.
- Monsters die at 0 HP (the simple stat-block path); only the Burners get the Strength-and-Shock survival funnel. This is per the core: a monster's overflow past 0 is simply the killing wound.
- A fight that reaches the 40-round cap with foes still standing counts as a non-win, not a party victory: the party could not finish them and would withdraw or change tactics. This matters only for a regenerating troll (which can stall indefinitely against steel); ordinary fights resolve in well under the cap.

## Batch log

- Batch 1, 2026-07-06. Seeded all four scenarios at baseline (open melee, Heat 6), plus the front-line variant and a Heat sweep on 3 Orcs. 8,000 fights per cell. Simulator: burners_sim.py. Rotation for subsequent batches: 3 Orcs, 5 Orcs, Ogre, Troll, repeating; each fire runs one scenario and adds to its running total.
- Batch 2, 2026-07-06. Rotation scenario: 3 Orcs (8,000 fights, 7,960 W / 40 L, added to the running total). Flagged experiment: added troll regeneration to the simulator and measured the before/after (see Troll regeneration, above). Also fixed a scoring bug in stalemate resolution: a fight that reached the round cap with foes still standing was being credited to the party if any one foe had died, which had inflated long-fight win rates. Corrected, and re-verified that the four baseline running totals were unaffected (their round-cap rate is under 1.2%). The correction lowered the with-adds numbers modestly (Troll + 2 Orcs 95.3 to 86.5, 2 Ogres 59.0 to 53.1); the adds table above now reflects the fix. Next rotation scenario: 5 Orcs.
- Batch 3, 2026-07-06. Rotation scenario: 5 Orcs (8,000 fights, 4,213 W / 3,787 L, added to the running total; consistent with Batch 1 at 52.7%). Added analysis: swept orc count 3 through 8 in both targeting modes (see The fair-fight curve, above), which pins the fair fight at five orcs in the open and shows a very steep lethality gradient (the fair window is about one orc wide). No simulator changes this batch. Next rotation scenario: Ogre.
- Batch 4, 2026-07-06. Rotation scenario: Ogre (8,000 fights, 8,000 W / 0 L, added to the running total). Flagged experiment: implemented the proposed Parry size cap as a toggle (default off, so the baseline is unchanged; sanity-checked that cap-off reproduces prior numbers and that orcs, being human-sized, are unaffected) and added an ogre HP override. Findings (see the action-economy ceiling, above): the size cap is inert on a solo, and even 80 HP plus three attacks plus the cap leaves the lone ogre at 98% party win. Conclusion: solos cannot be fixed by stats; use adds or area attacks. Next rotation scenario: Troll.
- Batch 5, 2026-07-06. Rotation scenario: Troll (8,000 fights, 7,985 W / 15 L, added to the running total; consistent at 99.8%). Flagged experiment: added area/breath attacks to the simulator (a toggle-free capability keyed on area_dice/area_every; the blow hits every enemy, ignores armor, and only a shield Blocks it) and measured it on a dragon-style solo. Finding (see the area lever, above): a mere 2d6 breath every third round flips a 50-HP solo from 98.8% party win to 96% TPK, the one lever that breaks the action-economy ceiling. The solo-boss map is now complete: adds, regeneration, or area attack, never stats. Sanity-checked that the area code leaves all four baselines unchanged. Rotation wraps: next scenario is 3 Orcs again.
- Batch 6, 2026-07-06. Rotation scenario: 3 Orcs (8,000 fights, 7,958 W / 42 L, added to the running total; cumulative 24,000 at 99.5%). Flagged experiment: added a chokepoint model (CHOKE = front-rank width; the rest of the mob waits and steps up as the front falls) and swept orc count against choke width (see Terrain, above). Findings: a chokepoint is worth about one to two extra orcs of fair fight (open coin-flip 5, one-wide gap 6 to 7), but it cannot beat a true horde, because the 1-die-per-round refill means a long fight (about 28 rounds for ten orcs) grinds the party down to a trickle and attrition kills them. Confirms the design thesis that short fights are rewarded and attrition punished. Sanity-checked choke-off reproduces the baselines. Next rotation scenario: 5 Orcs.
- Batch 7, 2026-07-06. Rotation scenario: 5 Orcs (8,000 fights, 4,085 W / 3,915 L, added to the running total; cumulative 24,000 at 52.0%). Flagged experiment: added a party-HP override and swept fixed starting HP at the fair fight (see The HP roll swings the fair fight, above). Findings: at five orcs each point of HP per Burner is worth about seven to eight points of win rate, and the 1d6 variance itself costs about six points versus a flat average, because the fight is decided by the weakest HP roll. HP is irrelevant to safe fights (three orcs) and decisive at dangerous ones. Sanity-checked HP-override-off reproduces the baselines. Next rotation scenario: Ogre.
- Batch 8, 2026-07-06. Rotation scenario: Ogre (8,000 fights, 8,000 W / 0 L; cumulative 24,000 at 100.0%). Confirming batch, no new experiment: the solo ogre is fully mapped (see the action-economy ceiling). Next rotation scenario: Troll.
- Batch 9, 2026-07-06. Rotation scenario: Troll (8,000 fights, 7,985 W / 15 L; cumulative 24,000 at 99.8%). Flagged experiment: added a fire toggle (suppresses regeneration) and demonstrated the counter (see Troll regeneration, above). Findings: fire flips a lone regen-3 troll from 25% to 99.8%, so a solo troll is either an unkillable slog or trivial; the good troll encounter is troll-plus-adds (regen 3 + 2 orcs = 13% no fire, 87% with), where adds supply danger and fire is mandatory to finish it. With this every scenario and every major lever is mapped; the four baselines are stable across three batches each. Rotation wraps to 3 Orcs. Further fires will re-confirm rather than discover unless the loop is redirected.
- Batch 10, 2026-07-06. Rotation scenario: 3 Orcs (8,000 fights, 7,948 W / 52 L; cumulative 32,000 at 99.5%). Confirming batch, no new experiment (analysis complete). Next rotation scenario: 5 Orcs.
- Batch 11, 2026-07-06. Rotation scenario: 5 Orcs (8,000 fights, 4,132 W / 3,868 L; cumulative 32,000 at 51.9%). Confirming batch, no new experiment. Next rotation scenario: Ogre.
- Batch 12, 2026-07-06. Rotation scenario: Ogre (8,000 fights, 8,000 W / 0 L; cumulative 32,000 at 100.0%). Confirming batch, no new experiment. Next rotation scenario: Troll.
- Batch 13, 2026-07-06. Rotation scenario: Troll (8,000 fights, 7,978 W / 22 L; cumulative 32,000 at 99.8%). Confirming batch, no new experiment. All four scenarios now at 32,000 fights and stable. Next rotation scenario: 3 Orcs.
- Batch 14, 2026-07-06. Rotation scenario: 3 Orcs (8,000 fights, 7,965 W / 35 L; cumulative 40,000 at 99.5%). Confirming batch, no new experiment. Next rotation scenario: 5 Orcs.
- Batch 15, 2026-07-06. Rotation scenario: 5 Orcs (8,000 fights, 4,169 W / 3,831 L; cumulative 40,000 at 52.0%). Confirming batch, no new experiment. Next rotation scenario: Ogre.
- Batch 16, 2026-07-06. Rotation scenario: Ogre (8,000 fights, 8,000 W / 0 L; cumulative 40,000 at 100.0%). Confirming batch, no new experiment. Next rotation scenario: Troll.
- Batch 17, 2026-07-06. Rotation scenario: Troll (8,000 fights, 7,979 W / 21 L; cumulative 40,000 at 99.8%). Confirming batch, no new experiment. All four scenarios now at 40,000 fights, fully stable. Next rotation scenario: 3 Orcs.
- Batch 18, 2026-07-06. Rotation scenario: 3 Orcs (8,000 fights, 7,968 W / 32 L; cumulative 48,000 at 99.5%). Confirming batch, no new experiment. Next rotation scenario: 5 Orcs.
- Batch 19, 2026-07-06. Rotation scenario: 5 Orcs (8,000 fights, 4,133 W / 3,867 L; cumulative 48,000 at 51.9%). Confirming batch, no new experiment. Next rotation scenario: Ogre.
- Batch 20, 2026-07-06. Rotation scenario: Ogre (8,000 fights, 8,000 W / 0 L; cumulative 48,000 at 100.0%). Confirming batch, no new experiment. Next rotation scenario: Troll.
- Batch 21, 2026-07-06. Rotation scenario: Troll (8,000 fights, 7,985 W / 15 L; cumulative 48,000 at 99.8%). Confirming batch, no new experiment. All four scenarios at 48,000 fights, stable. Next rotation scenario: 3 Orcs.
- Batch 22, 2026-07-06. Rotation scenario: 3 Orcs (8,000 fights, 7,953 W / 47 L; cumulative 56,000 at 99.5%). Confirming batch, no new experiment. Next rotation scenario: 5 Orcs.
- Batch 23, 2026-07-06. Rotation scenario: 5 Orcs (8,000 fights, 4,094 W / 3,906 L; cumulative 56,000 at 51.8%). Confirming batch, no new experiment. Next rotation scenario: Ogre.
- Batch 24, 2026-07-06. Rotation scenario: Ogre (8,000 fights, 8,000 W / 0 L; cumulative 56,000 at 100.0%). Confirming batch. Note: the armor rework left the sample party's AC unchanged (Aldric chainmail AC 3, Senna/Pip leather AC 1) and Aldric's rotella is still 3 dice, so the baseline remains valid. Next rotation scenario: Troll.
- Batch 25, 2026-07-06. Rotation scenario: Troll (8,000 fights, 7,980 W / 20 L; cumulative 56,000 at 99.8%). Confirming batch, no new experiment. All four scenarios at 56,000 fights, stable. Next rotation scenario: 3 Orcs.
- Batch 26, 2026-07-06. Rotation scenario: 3 Orcs (8,000 fights, 7,971 W / 29 L; cumulative 64,000 at 99.5%). Confirming batch, no new experiment. Next rotation scenario: 5 Orcs.
- Batch 27, 2026-07-06. Rotation scenario: 5 Orcs (8,000 fights, 4,121 W / 3,879 L; cumulative 64,000 at 51.8%). Confirming batch, no new experiment. Next rotation scenario: Ogre.
- Batch 28, 2026-07-06. Rotation scenario: Ogre (8,000 fights, 8,000 W / 0 L; cumulative 64,000 at 100.0%). Confirming batch, no new experiment. Next rotation scenario: Troll.
- Batch 29, 2026-07-06. Rotation scenario: Troll (8,000 fights, 7,987 W / 13 L; cumulative 64,000 at 99.8%). Confirming batch, no new experiment. All four scenarios at 64,000 fights, stable. Next rotation scenario: 3 Orcs.
- Batch 30, 2026-07-06. Rotation scenario: 3 Orcs (8,000 fights, 7,961 W / 39 L; cumulative 72,000 at 99.5%). Confirming batch, no new experiment. Next rotation scenario: 5 Orcs.
- Batch 31, 2026-07-06. Rotation scenario: 5 Orcs (8,000 fights, 4,085 W / 3,915 L; cumulative 72,000 at 51.7%). Confirming batch, no new experiment. Next rotation scenario: Ogre.
- Batch 32, 2026-07-06. Rotation scenario: Ogre (8,000 fights, 8,000 W / 0 L; cumulative 72,000 at 100.0%). Confirming batch, no new experiment. Next rotation scenario: Troll.
- Batch 33, 2026-07-07. Rotation scenario: Troll (8,000 fights, 7,983 W / 17 L; cumulative 72,000 at 99.8%). Confirming batch, no new experiment. All four scenarios at 72,000 fights, stable. Next rotation scenario: 3 Orcs.
- Batch 34, 2026-07-07. Rotation scenario: 3 Orcs (8,000 fights, 7,965 W / 35 L; cumulative 80,000 at 99.5%). Confirming batch, no new experiment. Next rotation scenario: 5 Orcs.
- Batch 35, 2026-07-07. Rotation scenario: 5 Orcs (8,000 fights, 4,153 W / 3,847 L; cumulative 80,000 at 51.7%). Confirming batch, no new experiment. Next rotation scenario: Ogre.
- Batch 36, 2026-07-07. Rotation scenario: Ogre (8,000 fights, 8,000 W / 0 L; cumulative 80,000 at 100.0%). Confirming batch, no new experiment. Next rotation scenario: Troll.
- Batch 37, 2026-07-07. Rotation scenario: Troll (8,000 fights, 7,984 W / 16 L; cumulative 80,000 at 99.8%). Confirming batch, no new experiment. All four scenarios at 80,000 fights, stable. Next rotation scenario: 3 Orcs.
- Batch 38, 2026-07-07. Rotation scenario: 3 Orcs (8,000 fights, 7,960 W / 40 L; cumulative 88,000 at 99.5%). Confirming batch, no new experiment. Next rotation scenario: 5 Orcs.
- Batch 39, 2026-07-07. Rotation scenario: 5 Orcs (8,000 fights, 4,020 W / 3,980 L; cumulative 88,000 at 51.6%). Confirming batch, no new experiment. Next rotation scenario: Ogre.
- Batch 40, 2026-07-07. Rotation scenario: Ogre (8,000 fights, 8,000 W / 0 L; cumulative 88,000 at 100.0%). Confirming batch, no new experiment. Next rotation scenario: Troll.
- Batch 41, 2026-07-07. Rotation scenario: Troll (8,000 fights, 7,989 W / 11 L; cumulative 88,000 at 99.8%). Confirming batch, no new experiment. All four scenarios at 88,000 fights, stable. Next rotation scenario: 3 Orcs.
- Batch 42, 2026-07-07. Rotation scenario: 3 Orcs (8,000 fights, 7,973 W / 27 L; cumulative 96,000 at 99.5%). Confirming batch, no new experiment. Next rotation scenario: 5 Orcs.
- Batch 43, 2026-07-07. Rotation scenario: 5 Orcs (8,000 fights, 4,142 W / 3,858 L; cumulative 96,000 at 51.6%). Confirming batch, no new experiment. Next rotation scenario: Ogre.
- Batch 44, 2026-07-07. Rotation scenario: Ogre (8,000 fights, 8,000 W / 0 L; cumulative 96,000 at 100.0%). Confirming batch, no new experiment. Next rotation scenario: Troll.
- Batch 45, 2026-07-07. Rotation scenario: Troll (8,000 fights, 7,982 W / 18 L; cumulative 96,000 at 99.8%). Confirming batch, no new experiment. All four scenarios at 96,000 fights, stable. Next rotation scenario: 3 Orcs.
- Batch 46, 2026-07-07. Rotation scenario: 3 Orcs (8,000 fights, 7,950 W / 50 L; cumulative 104,000 at 99.5%). Confirming batch, no new experiment. Next rotation scenario: 5 Orcs.
- Batch 47, 2026-07-07. Rotation scenario: 5 Orcs (8,000 fights, 4,144 W / 3,856 L; cumulative 104,000 at 51.6%). Confirming batch, no new experiment. Next rotation scenario: Ogre.
- Batch 48, 2026-07-07. Rotation scenario: Ogre (8,000 fights, 7,999 W / 1 L; cumulative 104,000 at 100.0%). First recorded ogre loss across 104,000 fights, so a solo ogre is not literally unbeatable, just about 1 in 100,000. No new experiment. Next rotation scenario: Troll.
- Batch 49, 2026-07-07. Rotation scenario: Troll (8,000 fights, 7,977 W / 23 L; cumulative 104,000 at 99.8%). Confirming batch, no new experiment. All four scenarios at 104,000 fights, stable. Next rotation scenario: 3 Orcs.
- Batch 50, 2026-07-07. Rotation scenario: 3 Orcs (8,000 fights, 7,963 W / 37 L; cumulative 112,000 at 99.5%). Confirming batch, no new experiment. Fiftieth batch; the four baselines have held at 99.5 / 51.6 / ~100 / 99.8 for ~40 confirming batches. Next rotation scenario: 5 Orcs.
- Batch 51, 2026-07-07. Rotation scenario: 5 Orcs (8,000 fights, 4,136 W / 3,864 L; cumulative 112,000 at 51.6%). Confirming batch, no new experiment. Next rotation scenario: Ogre.
- Batch 52, 2026-07-07. Rotation scenario: Ogre (8,000 fights, 7,999 W / 1 L; cumulative 112,000 at 100.0%, 2 losses in 112k). Confirming batch, no new experiment. Next rotation scenario: Troll.
- Batch 53, 2026-07-07. Rotation scenario: Troll (8,000 fights, 7,984 W / 16 L; cumulative 112,000 at 99.8%). Confirming batch, no new experiment. All four scenarios at 112,000 fights, stable. Next rotation scenario: 3 Orcs.
- Batch 54, 2026-07-07. Rotation scenario: 3 Orcs (8,000 fights, 7,951 W / 49 L; cumulative 120,000 at 99.5%). Confirming batch, no new experiment. Next rotation scenario: 5 Orcs.
- Batch 55, 2026-07-07. Rotation scenario: 5 Orcs (8,000 fights, 4,034 W / 3,966 L; cumulative 120,000 at 51.5%). Confirming batch, no new experiment. Next rotation scenario: Ogre.
- Batch 56, 2026-07-07. Rotation scenario: Ogre (8,000 fights, 7,999 W / 1 L; cumulative 120,000 at 100.0%, 3 losses in 120k). Confirming batch, no new experiment. Next rotation scenario: Troll.
- Batch 57, 2026-07-07. Rotation scenario: Troll (8,000 fights, 7,984 W / 16 L; cumulative 120,000 at 99.8%). Confirming batch, no new experiment. All four scenarios at 120,000 fights, stable. Next rotation scenario: 3 Orcs.
- Batch 58, 2026-07-07. Rotation scenario: 3 Orcs (8,000 fights, 7,959 W / 41 L; cumulative 128,000 at 99.5%). Confirming batch, no new experiment. Next rotation scenario: 5 Orcs.
- Batch 59, 2026-07-07. Rotation scenario: 5 Orcs (8,000 fights, 4,171 W / 3,829 L; cumulative 128,000 at 51.6%). Confirming batch, no new experiment. Next rotation scenario: Ogre.
- Batch 60, 2026-07-07. Rotation scenario: Ogre (8,000 fights, 8,000 W / 0 L; cumulative 128,000 at 100.0%, 3 losses in 128k). Confirming batch. Note: the folder moved mid-batch from gm/campaigns/game-systems/ to gm/original-systems/burners-2026-07-06/; the results doc and simulator now live there. Next rotation scenario: Troll.
- Batch 61, 2026-07-07. Rotation scenario: Troll (8,000 fights, 7,982 W / 18 L; cumulative 128,000 at 99.8%). Confirming batch, no new experiment. All four scenarios at 128,000 fights, stable. Next rotation scenario: 3 Orcs.
- Batch 62, 2026-07-07. Rotation scenario: 3 Orcs (8,000 fights, 7,955 W / 45 L; cumulative 136,000 at 99.5%). Confirming batch, no new experiment. Next rotation scenario: 5 Orcs.
- Batch 63, 2026-07-07. Rotation scenario: 5 Orcs (8,000 fights, 4,124 W / 3,876 L; cumulative 136,000 at 51.6%). Confirming batch, no new experiment. Next rotation scenario: Ogre.
- Batch 64, 2026-07-07. Rotation scenario: Ogre (8,000 fights, 7,998 W / 2 L; cumulative 136,000 at 100.0%, 5 losses in 136k). Confirming batch, no new experiment. Next rotation scenario: Troll.
- Batch 65, 2026-07-07. Rotation scenario: Troll (8,000 fights, 7,986 W / 14 L; cumulative 136,000 at 99.8%). Confirming batch, no new experiment. All four scenarios at 136,000 fights, stable. Next rotation scenario: 3 Orcs.
