# Burners game development

## Design issues

#### Initiative dice pool sizing is off

- The initial pool is too large, enabling apex strikes if the characters get the drop on a monster. But the refresh is too low, especially if players don't conserve their strength.
- Even if they do conserve their strength, they'll certainly be down to one die per round after four rounds of fighting. We want to keep fights short, but this keeps them short by dropping the party.
- Current rules: round 1 pool = level + weapon slots + shield slots + empty slots (up to 4) + Arcana. Refill from round 2 = one die per level. Several characters start at 10 dice; a level 1 character then gets 1 die a round.
- Saxon's capacity math (1 on 1, no resistance): sword and board, attacking while spending 1 die a round on defense, lasts about 10 rounds; longsword two-handed (8 start dice, 2 dice per blow) about 4. At 2 dice of defense a round: 5 and 2. Once capacity runs out, the one die a round goes to defense and the fight is lost.
- Paul: some characters start with 10 dice. A 3-round fight leaves them about 4 dice a round. The current setup makes fighting longer a failure state.
- Options on the table:
  - A. No empty-slot dice in round 1; add them to the refresh instead. (Check the math: adding all 4 every round takes refresh from 1 to 5. Half of them, or a flat +1 for any empty slots, is closer to today's totals.)
  - B. A free die for each attack, or for each Block with a shield.
  - C. Dice tied to level, not gear: each round 3 + level dice, no carry-over. Tune that one number on its own.
- Assessment of C: ends the long-fight collapse (round 4 is as strong as round 1), removes the alpha strike, removes the shield exploit, gives one number to tune, and lets Class and tags tell weapons apart. Costs: slots stop being Initiative dice and become carrying capacity only, saving dice across rounds stops being a choice, and the "winded" rule needs rewriting.
- C pairs with B to give each loadout a role:
  - Shield in hand: +1 die each round, usable only for Defend or Block. Drop the shield and the die is gone next round.
  - Two-handed weapon: the second die of a two-handed blow is free.
- Initiative band: with a fixed pool of up to 6 dice, the chance the PCs act before the foes' d6 is exactly pool size × faces counted ÷ 36.

| Pool | Count 3–4 | Count 1–3 |
| --- | --- | --- |
| 4 dice (level 1) | 22% | 33% |
| 5 dice (level 2) | 28% | 42% |
| 6 dice (level 3) | 33% | 50% |

- Counting 1–3 also adds a tradeoff: those faces are spent as Fuel, so a fast pool hits softer. Counting 3–4 has no such tradeoff.

#### Side initiative or each Burner's own count

- Paul (Oct 11): is each Burner's own Initiative an interesting part of the game, or bookkeeping we don't need? B/X uses one d6 per side.
- B/X side initiative: party and foes each roll a d6, high goes first. The party goes first 42% of the time, ties 17%, foes first 42%. One roll, the party acts together, and holding already lets anyone wait.
- Today's count is already close to that. The Referee names one number, and each Burner is either before or after it. The per-Burner part is just counting your own faces.
- What the count gives that side initiative doesn't:
  - Faces mean something besides damage. With the top-off (October 13 update 2), what you keep is a choice between speed, Sparks and big blows.
  - Light kit is quick feet: more empty slots, more dice, more chances to go first.
  - The party can split, so a slow fighter and a quick archer play differently.
- What it costs: one count per player per round, and with small pools most Burners go after the foes unless the band widens.
- Bands for a pool of n dice (n × faces counted ÷ 36):

| Pool | Count 3–4 | Count 1–3 | Count 1–4 |
| --- | --- | --- | --- |
| 4 dice (level 1) | 22% | 33% | 44% |
| 5 dice (level 2) | 28% | 42% | 56% |
| 6 dice (level 3) | 33% | 50% | 67% |

- Counting 1–4 makes nearly every die count, so keeping dice for speed stops being a choice. Counting 1–3 keeps the choice: fast dice are soft dice.
- **Decision (Paul, Oct 11): d6 per side.** At the table, asking everyone for their Initiative at the top of each round has been slow. Side initiative is faster. Fuel faces stop counting for speed; what you keep at the top-off is a choice between Sparks, big blows and Defends.
- Confirmed (Paul): classic B/X d6 per side. It fits how he's been running the game, as a B/X hack. Name idea, in the line of The White Hack and The Black Hack: *The Burning Hack*.
- Light kit (Paul): side initiative loses "light kit, quick feet." Fix: with 4+ empty slots, add 1 to your side's roll for you alone. Fuel caps at 3 empty slots, so this gives the 4th slot a job. Party first 42% → a light Burner first 58%; it only matters on a tie or a loss by 1, so it's one check, not a count.
  - Extended (Paul): +1 per 4 empty slots, so the really light monk or rogue does well. 8 empty slots = +2, first 72% of the time. Steps at 4 and 8, not 3 and 6: with packs left behind, 3 empty is the norm and +1 at 3 would go to nearly everyone.
- Split sides (Paul): a side can roll more than one d6 when it's split up in the fiction (separate rooms, a scout ahead). Referee's call, not the players', so they can't all opt into rolling alone.
  - Splitting gives no edge on average: each Burner still goes first 5 times in 12 either way. It only trades the party's all-or-nothing swing for a mix, and since anyone who goes first can hold, a single party roll is if anything better for coordination.
  - The real cost of letting players split at will is time: back to a roll per player, the thing side initiative fixes.
- **Revised (Paul, Oct 14): pay to go first.** The Referee rolls 1d6 for the foes. On a 1 or 2 the Burners go first. On a 3 or more, a Burner spends a Fuel die of that number or higher to go before the foes; the rest go after. Fuel cap goes from 3 empty slots to 4, so everyone has one more die to spend on it.
  - Keeps side initiative's speed (one roll, no counting) and gives faces a job besides damage again: going first costs a die, and a high one when the foes roll high.
  - Light kit bonus dropped (Paul): it's already in the dice you get. More empty slots, up to 4, is more dice to pay with.
  - At level 1 with 5 dice: free a third of the time; otherwise holding a payable die 99% (vs 3), 97% (4), 87% (5), 60% (6). Being able to go first is nearly certain; whether it's worth the die is the choice.
- Earlier recommendation, superseded: keep the count and switch to 1–3. At level 1 a party of four has at least one Burner going first about half the time (B/X: 42%), though foes rolling 5 or 6 always go first, and the keep-or-drop choice at the top-off means something. If play shows the count is only bookkeeping, side initiative is the fallback, and it drops in without touching anything else.

#### Monster damage

- Paul (Oct 13): the Referee always rolls monster damage. It's more fun and more exciting than flat quotes. Use the monster's damage die as printed.
- When a monster's attack die rolls its top face (6 on a d6, 8 on a d8, 4 on a d4), roll one more of that die and add it. Same blow, not a second attack, which matters for poison and the Trait Curse: one Defend, one touch, one dose, one curse.
- Decided (Paul): top face for any die size, so d4 monsters get it too. The extra die doesn't roll again.
- Replaces the flat quotes (2 to 5) in the Referee Guide and OSE Conversions.
- Decided (Paul): with several dice on their top face, the Referee judges. A deadly attack gets an extra die for each; otherwise he can limit it. The roll is always the most the blow can do, and the Referee may deal less when the situation merits it.

#### Fatigue in long fights

- Paul (Oct 12): after 10 rounds of fighting (1 Turn), everyone is Fatigued until they rest an hour. While Fatigued, your Fuel maximum is halved, rounded up: 4 → 2, 5 → 3, 6 → 3.
- Fits the 1-minute round: target fights are 2–4 rounds, so it only bites a grind like the doorway fight, and it says "end it or get out" without touching normal fights. It carries over, so the next wandering monster meets a tired party.
- The rest is the existing Hour Rest (one hour, food and water), already a full Turn Tracker cycle with wandering-monster checks.
- B/X comparison: rest 1 turn in 6 or −1 to hit and damage (dungeon); 1 day in 7 (wilderness); run 30 rounds, then rest 3 turns. Burners already drops OSE's hourly rest tax (OSE conversions).
- **General condition (Paul):** Fatigued isn't only for long fights. Any hard exertion can leave you Fatigued: you come out of class 5 rapids half-drowned and straight into a fight, not fresh. Ten rounds of fighting is one trigger among several.
  - Why (Paul): Fatigued represents fatigue without dealing HP or raising Heat. Heat is now effectively karmic debt, a consequence owed from a short Approach roll, so wear and tiredness shouldn't be paid in it. Three separate channels: HP for harm, Heat for debt, Fatigued for wear.
  - Knock-on: the Referee Guide's Grind section (crawl fatigue raising Heat) and the Journeyman example in the core rules (cold rain costs 6 Heat) both pay wear in Heat. They should become Fatigued, with Craft stretching how long the Journeyman's party can go before it sets in.
  - Other triggers, Referee's call: a long sprint or chase, a hard climb, a forced march, a night without sleep, carrying a comrade out.
  - One condition, no stacking. An Hour Rest clears it.
  - It works out of combat too, and it fills the gap left by dropping the Heat grind tick (Paul): a long crawl with no rest can leave the crew Fatigued.
  - Journeyman (Paul): he keeps the group moving farther and longer. For time-based triggers, his Craft extends how long the group he's guiding can go before becoming Fatigued, in hours or days. Example: if the base is 6 days of travel before a rest day (as in B/X), Craft 2 makes it 8.
    - Base numbers still to set: days of overland travel, hours of delving without an Hour Rest.
    - One-off shocks (the rapids) have no clock to stretch. They come from the Approach roll for the crossing.
    - Fights stay with the Veteran: the Journeyman rules the journey, not the melee, so his Craft doesn't add rounds. A parallel option: Sword level adds rounds before a fight leaves you Fatigued.
- Open:
  - Count per fight or across fights since the last rest? Per fight is simpler to track.
  - Foes: undead and constructs never tire (the skeleton doorway grind gets scarier). Living foes mostly break on morale before round 10.
  - Sorcerers: half the maximum can put top-level spells out of reach (spell-level dice), which fits.

#### Trained attack rule

Shared by every model below. Replaces separate free dice for two-handers and shields with one rule: the Trait makes the die free.

- **Free die with the Trait:** an attack with a weapon whose Trait you hold rolls its die free, with the attack. Without the Trait, burn that die from your pool.
- **Block with a shield:** costs an attack, as now. With the shield's Trait, the Block gets that attack's free die. Block can cover a blow aimed at you as well as one aimed at an adjacent ally.
- **Two-handed blow:** a weapon of 3+ slots in two hands may add a second die, burned from your pool.
- **Joining attacks:** as a Veteran you may join two attacks into one blow. Both free dice go into it, up to what the weapon allows: two dice for a two-hander, one for everything else. A trained two-hander's joined blow is two free dice; a one-hander gains nothing by joining.
- Draft wording:

> **Attacking.** Burn one Fuel die per attack; its face is the damage. If you hold the weapon's Trait, that die is free: roll it with the attack. A weapon of 3+ slots in two hands may add a second die, burned from your Fuel. Up to two dice a blow from mundane steel; other arms stay one die. As a Veteran you may join two of your attacks into one blow, and both free dice go into it, still no more than the weapon allows.

- Level 1 Veteran (Sword 1, two attacks), trained:
  - Two-hander: join for one blow of two free dice, or make two one-die blows and pay a pool die to add a second die to either.
  - Sword and board: one blow of one free die and one Block of one free die.
- Non-Veteran with a trained two-hander: one free die, plus a paid second die if he wants the big blow.
- Joining is a real choice. Against a closed foe a joined two-die blow averages 0.81 Hits, against 0.33 for two one-die blows. Against an open foe two blows do better (2.33 against 1.81). Crack the shell or spread the cuts.
- Traits matter for every weapon, not only two-handers, which answers Saxon's "Traits don't matter in combat."
- Casting can follow the same rule: a free die on a cast with the school's Trait (see *Sorcerers and Arcana*).
- Under this rule the Trait matters through the free first die, so an untrained two-hander may pay for both dice.
- Paul's general form: when you take your action, you get one free die if you hold the Trait for the item you're using. Veterans get one on each extra attack too. Example: Aren attacks with his longsword. His first die is free and he can pay for the second, or he joins his two attacks and the two-die blow is free. The same form covers a cast (the school's Trait) and could cover man-handling (*wrestling*).

#### When the free dice are rolled

Paul's concern: free dice rolled at the moment of the attack aren't known up front. Fuel is read from faces already on the table, and every choice depends on seeing them first. Three ways to handle it:

1. **Rolled live.** Each trained attack, Block or cast rolls its free die when you take it.
   - Pros: no new bookkeeping, and free dice can only go where the Trait says.
   - Cons: you can't plan around faces you haven't seen, which breaks how Fuel works. Sparks come out of nowhere. Free dice don't count for Initiative.
2. **Rolled up front, kept apart.** At Roll Initiative, roll the free dice in another color. They can only fuel an attack, Block or cast with the trained item, and any left at the end of the round are lost.
   - Pros: faces are known, and the dice keep their purpose.
   - Cons: two kinds of dice on the table, and a rule about which pile pays for what.
3. **Folded into the refresh.** At Roll Initiative, add one die per attack you have with a weapon whose Trait you hold (one for most characters, Sword + 1 for a Veteran), one more for a trained shield in hand, and one for a Sorcerer with the school's Trait. They become ordinary Fuel.
   - Pros: one pool, faces known, as now. Joining needs no rule: Aren's two attack dice go into one two-handed blow or two one-die blows, the same two dice either way. The extra dice count for Initiative, which fixes the dead-Initiative problem: a full-kit level 1 trained Veteran rolls 3 dice a round, not 1. Traits, not gear, decide who gets them, which keeps Saxon's rule.
   - Cons: the dice can go to Defend, so a trained Veteran who never swings defends better (arguably right: skill at arms is defense too). The two-handed blow costs dice again, but they come back fresh every round, so it's a choice, never a cost you can't pay.
   - Level 1 trained Veteran in full kit (pool 1): sword and board rolls 1 + 2 attacks + 1 shield = 4 dice a round, all one-die blows and Blocks; a two-hander rolls 1 + 2 = 3 dice but can make two-die blows. The shield gives a die, the two-hander gives bigger blows.
   - Paul: putting the dice into the pool makes the sword and the shield have the same effect. A shield die in the common pool is just another die. The shield needs something only a shield does:
     - **Separate shield die.** At Roll Initiative a trained shield rolls one die in another color, usable only on a Block or a Defend, lost at the end of the round. It's the only die tracked apart; weapon dice stay ordinary Fuel.
     - **Shield adds to the Block.** A trained shield's Block cuts the blow by the shield's size on top of the Fuel burned: buckler 2, heater 3, rotella 4. Nothing to roll, and it fits Saxon's "gear changes what a die is worth." A heater's 3 is about one die's worth, every time, but only on the blow you Block. Risk: a flat cut on every Block may be too strong against small blows; check it in the simulation.
   - With either shield version, each piece of kit has its own job: a weapon Trait gives attack dice, a two-hander turns them into bigger blows, and a shield makes a Block hold.
4. **Matching.** No free die at all: the trained item copies the face of a die you burn, so that die counts twice.
   - Trained two-hander: burn one die and the second die matches it. Spend a 5 and the blow is 10.
   - Trained shield Block: burn a die on the Block and the shield matches it. Spend a 3 and the Block cuts 6.
   - One-handed weapons: no match. A blow from one hand stays one die.
   - A matched die averages 7, the same as two dice, with a wider spread (2 to 12 in steps of 2; a matched 6 is 12). A matched 6 Sparks once; the copy isn't a second natural 6.

| Blow | Hits per blow, open foe | Hits per blow, closed foe |
| --- | --- | --- |
| One die | 1.17 | 0.17 |
| Two dice | 1.81 | 0.81 |
| One die matched | 1.83 | 0.83 |

- Pros: nothing rolled live and nothing extra in the pool, so you know every blow and Block from the faces at Roll Initiative. The two-hander and the shield do different things (one doubles the blow, the other the Block). No joining rule. Saving your best face for the matched blow becomes the play. It fits Saxon's "gear changes what a die is worth."
- Cons: every action costs a pool die again, since the free die was also paying for the attack. Under level + open slots a full-kit Veteran can't fuel both attacks; matching needs the refresh option or the flat pool behind it.
  - Flaw (Paul): one-handed weapons get no benefit from matching, so the *arming sword* or *small ax* Trait does nothing in a fight except accept magic. Possible patches: pair matching with option 3, so every trained weapon adds an attack die at Roll Initiative and matching is the extra for two-handers and shields; or let a trained one-hander match on a Counterattack or a Spark.
  - Dropped (Paul): Sparks are already wild enough that matching on a Counterattack or Spark would add more confusion.

1. **Rerolls.** The Trait improves the dice you burn instead of adding dice. (Replaced by October 13 update 3: a trained 1 adds the item's slots. Kept as history.)
   - The Trait is the reroll: with the Trait for what you're using, reroll 1s as you burn them, on a blow with that weapon or a Block with that shield. Without the Trait, no reroll.
   - The gear's own benefit is what it lets you do at all (Paul). A weapon gives a full die of damage; a punch doesn't. A shield can Block an arrow or a blade; a bare hand can't.
   - Two-handers need no rule of their own: the second die rerolls like the first. With a trained two-hander in two hands, a blow of two 1s rerolls both.
   - Each die rerolls once, and you keep the reroll even if it's no better. Whether a rerolled 6 Sparks needs a ruling: letting it is simpler; allowing only first-roll 6s keeps Sparks tamer. In the dirt, where burned Fuel is already re-rolled, the Trait's reroll applies to that re-roll.
   - It extends to anything with a Trait: *wrestling* or *boxing* on an unarmed blow or a man-handle, a school's Trait on a cast.
   - Gap: the core rules don't say what an unarmed blow does. Pugilism is Class 0 in Arms & Armor, but nothing says a punch is less than a full die. If the weapon's benefit is "a full die," the rules need the punch's number (half a die, or a die that armor soaks first).

| Burned on a blow | Average | Hits per blow, open foe | Hits per blow, closed foe |
| --- | --- | --- | --- |
| One die, untrained | 3.5 | 1.17 | 0.17 |
| One die, trained (reroll 1s) | 3.9 | 1.19 | 0.19 |
| Two dice, untrained two-hander | 7.0 | 1.81 | 0.81 |
| Two dice, trained two-hander (reroll 1s) | 7.8 | 1.97 | 0.97 |

- On a Block every pip counts (Defend cuts point for point, no division by 5). Each Block die averages 4.2 instead of 3.5. Against the ogre's pressed 10, two Block dice stop the whole blow 17% of the time untrained and 23% with the shield's Trait, before armor soaks.
- Loadouts (trained): sword and board rerolls 1s on one-die blows and on Blocks, so it's the better defender. A two-hander rerolls 1s on both dice of its blows and hits harder.
- Pros: easy to say at the table, nothing to add up, no extra dice to track. The Trait matters for every weapon. Junk faces get a use: a trained fighter burns 1s and 2s on blows or Blocks and keeps good faces for Defend.
- Cons: rerolls are rolled live, though only on bad faces. One-die blows barely move against monsters, since converting damage to Hits only cares about 6s; mace and other right-tool weapons still carry undead fights. It adds no dice, so it needs the refresh option or the flat pool behind it.
- Best pairing: the refresh option for how many dice (trained weapons add attack dice at Roll Initiative), with rerolls as what training does to them.

#### Proposed Fuel model

- From Saxon's second round: dice should come from things that don't change mid-fight. Gear should add free dice or change what a die is worth, never make you pay more dice to use it. The old model (gear gives starting dice, slow refill, pay extra dice for what the gear does) is the root of the shield exploit, the weak two-handers, and the long-fight collapse.
- **Pool:** at each Roll Initiative, roll level + open inventory slots (up to 4). Everything you carry counts. Fresh every round, no carry-over: what you don't burn this round is gone.
- **Attacks and Blocks:** the trained attack rule above.
- What it fixes: the shield exploit (a shield adds no pool dice), a trained Veteran's big two-handed blow costs no pool dice, round 4 is as strong as round 1, and the alpha strike is gone.
- One die against two free dice:

| Blow | Hits per blow, open foe | Hits per blow, closed foe | Chance of a Spark |
| --- | --- | --- | --- |
| One die (arming sword) | 1.17 | 0.17 | 17% |
| Two free dice (two-hander) | 1.81 | 0.81 | 31% |

- A level 1 Veteran with a greatsword gets through a 3-card closed skeleton in about 2 rounds, against about 9 with an arming sword.
- Level 1 trained Veteran (Sword 1, two attacks) in full kit, so pool 1 each round:
  - Two-hander: one joined blow of two free dice, 1 pool die for Defend. Or two one-die blows with the pool die paying a second die on one of them, nothing left for Defend.
  - Sword and board: one blow of one free die, one Block of one free die, 1 pool die for another Defend.
  - Light kit with 4 open slots: pool 5 each round.
- Saxon's refuel variant (Oct 11): round 1 = level + empty slots (up to 4); each later round refuels level + half your empty slots (up to 2). His reason: people get tired in a fight. Paul: not with 1-minute rounds; hardened adventurers don't tire in a few minutes.
  - The only difference from round 1 is half the empty slots, at most 2 dice. Full kit sees no change (1, then +1 at level 1). Light kit at level 1 goes 5, then +3. If refuel adds to unspent dice, anyone who doesn't spend everything never declines. It reads as a fast start for light kit more than as tiredness.
  - Realism cuts Saxon's way (real fights exhaust in minutes; boxing rounds are 3 minutes with rests). The stronger case against is design: fights are meant to last 2–4 rounds, and HP, Wounds and the Monster Stack already model wearing down, so a shrinking pool punishes the same thing twice.
  - Middle ground: keep the fresh pool, count all empty slots (up to 4) on the opening Roll Initiative and half (up to 2) after. Same numbers as his refuel, framed as the first rush, no carry-over.
- Every current Lothian sheet (Gar, Ylva, Aren) is 12 of 12, so each rolls a pool of 1. Armor and shields now cost dice directly; that's the intended trade, but check it at the table.
- Open questions:
  - Initiative: with a pool of n dice counting 3s and 4s, the chance of going before the foes is n ÷ 18. A full-kit level 1 PC goes first about 6% of the time. Options: count the free dice too, count 1–3 instead (n ÷ 12), or lock round 1's order.
  - Dropping gear mid-fight opens slots for the next round. Count open slots at the first Roll Initiative only, or let dropping a pack be a real choice?
  - Sorcerers: see *Sorcerers and Arcana* below.
  - A non-Veteran with a shield has one attack, so he chooses between striking and Blocking.
  - Every two-hander throws the same two dice. Bigger ones (battle ax, greatsword, halberd) need tags or Class to beat a longsword held in two hands.
  - Magic arms: the extra die becomes another free die? With one-die blows that is still 1.5× (open) to 5× (closed) a mundane weapon.
  - Rules to rewrite: the refill, winded, and Fuel-debt paragraphs, the Aldric example, the Kragg example, and the FAQ.

#### Alternative: shields out of the pool

The smaller change. Keep today's pool and refill, and change only shields and two-handers.

- **Pool:** level + weapon slots + empty slots (up to 4) + Arcana, as now, but a shield adds no dice. Refill stays one die per level per round.
- **Attacks and Blocks:** the trained attack rule above.
- What it fixes: the shield exploit (a shield never gave pool dice, so dropping it keeps nothing), Saxon's points 5 and 7 (a trained Veteran's joined two-handed blow costs nothing), and most of the long-fight collapse: a trained fighter's attacks are free, so the slow refill only has to cover Defend.
- What it doesn't fix: the opening alpha strike, gear still setting the pool, and untrained fighters still running dry by round 3 or 4.
- Shield-bearers lose 2–4 opening dice. Gar drops from 5 to 2, Ylva from 7 to 4 if she keeps the shield. Free attacks and a free Block die pay that back.

#### Alternative: flat pool

No slots in the pool at all. Every round, roll level + 3 (or level + 4), fresh, no carry-over.

- **Pool:** level + 3 each round. A level 1 PC rolls 4, a level 3 PC rolls 6. That is option C above.
- **Attacks and Blocks:** the trained attack rule above. With free trained attacks, all 4–5 pool dice can go to Defend, which may make defense close to total. If it does, drop the base to level + 2.
- Level 1 trained Veteran (two attacks), pool 4:
  - Two-hander: two blows of one free die plus one pool die each, 2 pool dice left for Defend. Or one joined blow of two free dice, 4 left.
  - Sword and board: one blow of one free die, one Block of one free die, 4 pool dice for Defend.
- What it fixes: everything the proposed model fixes, plus there is one number to tune, and every character at the table rolls the same pool regardless of kit. No sheet goes down to a pool of 1.
- What it costs: slots stop mattering in a fight. Today empty slots are speed ("light kit, quick feet") and the proposed model makes armor cost dice; here plate costs only gold and the Trait. Saving dice across rounds stops being a choice.
- Initiative: 4 dice counting 3s and 4s goes first 22% of the time (33% counting 1–3); 6 dice, 33% (50%).
- Optional: keep empty slots for Initiative only. Count 3s and 4s across the pool plus one extra die per empty slot (up to 4), and the extra dice aren't Fuel. Light kit stays quick without feeding the fight.

#### Comparing pools

Round 1 pool, and dice each round after. Gar: level 1, small ax 2, heater 3, 12 of 12 slots. Ylva: level 1, battle ax 3, shield 3, 12 of 12. Wand Sorcerer: the core rules' example, level 1, wand Arcana, 1 empty physical slot. Staff Sorcerer: level 1, staff, ring and amulet (5 Arcana dice), no empty slots.

| Character | Current rules | Shields out of the pool | Level + open slots | Flat (level + 3) |
| --- | --- | --- | --- | --- |
| Gar | 5, then +1 a round | 2, then +1 | 1 a round + free dice | 4 a round |
| Ylva | 7, then +1 | 4, then +1 | 1 a round + free dice | 4 a round |
| Wand Sorcerer | 3, then +1 | 3, then +1 | 2 a round + free dice | 4 a round |
| Staff Sorcerer | 6, then +1 | 6, then +1 | 1 a round + free dice | 4 a round |

#### Sorcerers and Arcana

- **Now:** each Sorcerie slot filled by Arcana adds one die to the round 1 pool. Empty Sorcerie slots, books and scrolls add none, and Sorcerie slots never count as empty inventory. Refill is level only, so Arcana are round 1 dice.
- A combat cast burns at least SL Fuel dice for the cast total, and there's no upper limit. More dice in the pool means a bigger cast total, so Arcana are the Sorcerer's opening burst. A staff (3 slots) plus a ring and amulet is 5 extra dice for the first cast.
- Arcana are also the reason to buy costume Arcana at 100 gp, and the reason to keep Sorcerie slots full rather than empty.
- **Shields out of the pool:** Sorcerers are unchanged.
- **Level + open slots:** Arcana add nothing, and Sorcerie slots never count as open, so re-splitting for a bigger hand also costs dice. The wand Sorcerer rolls 2 a round plus a free die per cast. That sustains a 1st- or 2nd-level cast every round better than today, but the opening burst is gone. The staff Sorcerer drops from a 6-die first cast to 2 dice. This nerfs Sorcerers in burst and makes Arcana dead weight in a fight.
- **Flat pool:** Arcana add nothing, but every level 1 Sorcerer rolls 4 fresh dice a round. With no cap on cast dice that's a 4-die cast every round, well above today. It's a buff, and it wants either a cap (for example, at most SL + Sorcerie dice in a cast) or a smaller base for casters.
- **Fixes that fit the gear-gives-free-dice pattern:**
  - Follow the trained attack rule: a cast with the school's Trait and Arcana in hand gets a free die, the way a trained attack does. Enchanted Arcana could give a second.
  - Or let Arcana count as open slots for the level + open slots pool, sharing the cap of 4. Arcana aren't dropped mid-fight, so this keeps Saxon's rule about dice coming from things that don't change.
- Canting kicks follow the same rules as Arcana and need the same decision.

#### Resistance against one-die blows

- Current rule: closed (any face-down card left, or "flesh that shrugs their edge") = −1 Hit, after dividing damage by 5.
- Saxon's proposal: subtract Resistance before dividing by 5. At Resistance 5 this is identical to the current −1 card: ⌈(d − 5) ÷ 5⌉ = ⌈d ÷ 5⌉ − 1. The real proposal is letting Resistance be a number from 1 to 5, which mirrors PC armor (AC 1–5). The cost is a subtraction on every blow, the "Referee math tax" our conversion notes warn about.
- One die (a one-handed blow, or any blow once a level 1 PC is down to one die a round):

| Face burned | 1 | 2 | 3 | 4 | 5 | 6 |
| --- | --- | --- | --- | --- | --- | --- |
| Current (−1 card, same as Resistance 5) | 0 | 0 | 0 | 0 | 0 | 1 |
| Resistance 3 | 0 | 0 | 0 | 1 | 1 | 1 |
| Resistance 2 | 0 | 0 | 1 | 1 | 1 | 1 |

- Two-dice blows barely change: Resistance 3 only adds a Hit when the sum lands on 4, 5, 9 or 10.
- Against a 3-card skeleton with one die a round, all of it spent attacking: about 18 rounds now, about 6 at Resistance 3, about 2.6 with no resistance.
- The right-tool claim (one extra Fuel into the blow) doesn't help a level 1 PC after round 1. There is no extra die to burn.
- Paul: resistance is meant to make weapon choice matter. The players knew there were skeletons and brought crushing weapons. The "shrugs their edge" clause already rewards maces over swords.
- Middle ground: Fiore's murder-stroke (crossguard and pommel) counts as a crushing blow, so the edge clause doesn't apply. Optional cost: one die per blow.

### Delaying actions and movement

- We need to clarify concepts around delaying actions and movement outside of your initiative cohort.
- We were aligned on saying you cannot hold an action for a trigger. But then the skeletons moving up in the fight after their initiative cohort breaks that rule.
- I think potentially we want to say you can't move outside of your native cohort, but you can defer your action and then take it based on some trigger.
- If we do the above, we need to make the timing/ordering clear. Proposal: *A deferred action takes place simultaneously with the trigger, so both things will happen*.
  - It's important to separate the **movement** portion of a creature's turn from the **action** portion of their turn.
  - Example: "I'm going to move to the right and get my bow out and point it down the hallway and take the shot at the first thing I see". The arrow will be loosed at the same time as the movement, which is before the creature's melee attack.
- We should also clarify if we will allow a trigger that was not declared, such as when it's obvious/implicit. For example, if a fighter doesn't use his attacks and an enemy comes up into melee range with him, he's going to clearly want to use his attacks on that opponent. It doesn't need to specify a trigger to do that. Even the archer example might fall in this category. I don't want this to get too confusing or tactical. I want it to feel natural.
- Note: this reverses a line in the current rules ("You cannot hold an Action or an attack until a trigger"). Say the reversal is deliberate.
- Suggested rule, no declared triggers: *An attack you haven't used this round can be used the moment a foe comes into your reach or your sight, at the same time as its move.* Movement stays locked to your own place in the order, so a second-rank foe can't step up until its group's turn. Its own attack still comes on its action, after.
- B/X note (Saxon raised B/X side initiative): in B/X a rear-rank monster can still step up and attack in the same round if its side hasn't acted yet. It only waits if its side already went.
- **Decision (Paul and Saxon, Oct 11):** don't lock movement to your place in the order. Allow delaying to a later point in the round. Whoever delays holds their move, their action, or both. A Veteran may hold some or all of his attacks. The archer who shoots the first thing that comes into view is the model case. This replaces the suggested rule above.
- Draft wording for the core rules (replaces "You cannot hold an Action or an attack until a trigger"):

> **Delaying.** You may hold any part of your turn past your place in the order: your move, your Action, or both. As a Veteran you may hold some of your attacks and use the rest now. A held part goes off later in the round when you choose, or the moment its trigger happens ("the first thing through that door"), at the same time as the trigger. Holding costs no Fuel. Anything still held at the next Roll Initiative is lost.

- Same rule for foes: a skeleton that delays its move can step up after its group's turn.
- ~~**Fallen combatants stay until the next Roll Initiative.**~~ Considered, then dropped (Paul, Oct 11). A body blocking its space also stops you moving through it to the foe behind, so players would want it one way in one fight and the other way in the next, and a Referee can wave it off ("skeletons are skinny"). Other options weighed: mindless foes can't hold; stepping into reach invites a Counterattack; stepping over a body is a demanding shift; the killer takes the ground.
- **Conclusion (Paul):** the rank behind stepping up was never the real problem, and it isn't about skeletons; goblins, orcs or trolls would do the same. The player's argument was "why kill this guy now, when he's holding the space and next round I'll have more dice?" The fiction is the hero dropping foes with reckless abandon: the next one steps up, he drops that one too, "who else wants some of this?" It only became an issue because he was out of dice. With an attack left, a longsword fighter just says "my weapon's longer; as he steps up, I stick him." That's a dice problem, fixed by the Fuel changes, plus the delay rule letting an unused attack meet a foe stepping into reach.
- Open: does a trigger have to be named, or can an obvious one fire on its own (a fighter with unused attacks when a foe steps into reach)? Paul earlier wanted it to feel natural without declarations.

#### Shields can be dropped without losing their dice

- Ylva carries an ax (3 slots) and a shield (3 slots): 10 dice in round 1. She drops the shield and swings the ax two-handed, keeping the shield's dice.
- Fix if we keep the current pool: dropping or stowing a shield or weapon burns dice equal to its slots, your choice of faces.
- Under option C (3 + level, with a shield die each round), the problem goes away: no shield in hand, no shield die next round.
- Under the proposed Fuel model the shield adds no pool dice at all, only a free die on Block, so there's nothing to keep by dropping it.

#### The usage of 2H weapons is unclear

- Some aspects were clear in Legends but not carried over into Burners, e.g. class dropping by 1 if used in 1H.
- The rule (two-handed weapon used one-handed: Weapon Class −1, no tags) is only in Arms & Armor. Put it in the core rules.
- Paul: a longsword (3 slots) can be used in one or two hands. A greatsword (4 slots) is fully two-handed.
- Saxon: one-handed, a longsword is worse than an arming sword (Class 2, no tags, one more slot, more coin). Two-handed it costs the shield, burns dice twice as fast, and hits harder for only about 2 rounds.
- Proposal: a hand-and-a-half rule. The longsword keeps its tags one-handed and only loses the second die. Fiore shows the longsword used one-handed from horseback.
- Saxon: the hand-and-a-half rule doesn't fix two-handers. The second die is a cost, not a bonus, and at one die of refill a round it can't be paid after round 2. Make two-handers better without spending more dice. He's right; the proposed Fuel model makes the second die free.

#### Encounter staging at level 1

- Session 9: the gladiators left their room, the party held a doorway against 18 gladiators and 4 archers, and level 1 front-liners spent nearly every die on Defend.
- The Ebb Barrow notes call for knots of 2d4 that will not leave the room, and warn that forty gladiators is a TPK.
- For level 1: one attacker per front-liner, archers as a separate problem someone can go deal with, and a held doorway ends the wave after a knot or two.
- Tools the table may not be using: shield-bearers Block for others; front-line swaps let a fighter step back and rebuild his pool.

#### Undead and fire

- Saxon's B/X comparison (fewer HP, weapons do less, undead damage doesn't heal, no turning, no wizard area spells, same XP) is accurate, and mostly by design: "You don't turn undead. You burn." Undead damage doesn't come back with Hour Rest.
- Burners' replacement for clerics and area spells is fire: a thrown incendiary lands as an area effect that can't be dodged. The table hasn't been reaching for it (Aren carried 4 flasks of oil into Session 9).
- Say it out loud: undead are an oil and holy water problem, and steel holds the line while the fire works.

#### Treasure and XP

- Saxon: nights he and Leon attend are mostly fighting with no treasure, while other nights find magic swords and treasure. XP comes almost entirely from treasure, so their characters won't level.
- The gladiators were 10 XP each, and the gold-filigree caps were ruled armor (0 XP).
- Options: coin on or behind fights, count the caps as treasure, or raise fight XP.

#### Shields, guards, and what a Trait buys

Decided (October 13 update 3): a 1 burned with a trained item adds the item's slots. Each item upgrades one 1 per blow or Defend. A Handguard parries as 1 slot, or 2 for rings and baskets; Defensive goes.

Dropped (Paul, Oct 15): the Defend cap of 2, 3 with a raised shield (update 7). Shields already get their benefit from their 1s, so Defend stays melee one die, or no limit if you made a melee attack this round.

Decided (Paul, Oct 23): the old Defensive tag comes back as **Parrying**, and Handguard changes jobs. Parrying names the act like Binding and Hooking, and doesn't suggest shields. A sword parries better than an axe by its shape, whatever the hilt. Parrying weapons (the swords, langes messer, parrying dagger) add their slots on a Defend, like a shield. Shield and Parrying weapons may all go on the same 1, with no cap: sword and heater make a single 1 into a 6, sword and tower an 8. Stacking fixes the old objection that sidesword and buckler would be no better than the sidesword, and it matters most under the one-die melee Defend. Handguard is now graded hand protection, numbered like `Far`: `Handguard` (simple cross hilt: 1), `Handguard2` (cross with a finger ring or knuckle bow), `Handguard3` (swept or cup hilt), `Handguard4` (full basket). The number is AC on the weapon hand (back to the pre-Oct 13 idea of armor for the hand): against a blow aimed specifically at that hand it soaks leftover after Defend, using the better of it and the suit's AC, not both. Nothing against other blows, and it doesn't soften a Wound rolled to the hand. A center-grip shield (buckler, round shield, large round; tag `Centergrip`) adds its slots to the hand's AC (Oct 24). The line is grip, not size: a fist-held shield goes forward with the sword hand, as the buckler does in I.33, while strapped shields (target, heater, rotella, kite) ride the forearm and cover the body. A heater covers the hand in guard but not during the cut. Strapped shields got their own edge so the round shield wouldn't beat the heater outright: a Man-handle can pin a strapped shield but never tear it away, and braced against a Man-handle it is one free defense die. Not a free hand: a rotella's strap and grip keep the hand busy (Paul). It's a bonus the player claims when the Referee says a foe goes for the hand: rare, not a sure thing, there for the player who reads the sheet. Disarms are Man-handles, where armor never counts. Handguard3: rapier, Swiss saber. Handguard2: parrying dagger, cutlass, sidesword, sabre, greatsword. Handguard: the cross-hilted swords (short sword, arming sword, falchion, longsword, the Alu swords, Vakaar falchion). The langes messer has none.

- The problem: once items gave no Fuel, a buckler and a tower did the same thing (Defend 3, Cover, the Trait reroll). Bigger shields only cost slots, speed and coin.
- The reroll was universal but didn't make slots matter, and nobody liked the reroll.
- Adding the slots is deterministic, known up front, and bigger is better: a slot 3 weapon is a +3 weapon, only on a 1. The 1 itself is the Trait's +1, so a dagger still gets a 2.
- A size 5 Defensive polearm turning 1s into 6s on Defends beat arming sword and shield at the same 5 slots. Parrying as 1 slot fixes it. Paul, a dozen years of HEMA: sidesword and buckler is better than sidesword alone, and the buckler (3) over the hilt (2) matches that.
- History: arming sword and round shield was a fighting style because the cross hilt parries but doesn't cover. Shields and bucklers went with simple hilts; the complex hilt took the buckler's job and the buckler dropped out. The finger buckler covers a messer hand, which has no guard.
- Defensive, Guard and Handguard were one idea too many. Handguard is the protection around the hand, and that's what lets a sword parry.
- Casts don't fumble in combat, so a 1 into a cast is just a low die, or the Arcana's slots plus one.
- Each item once per blow or Defend, not each 1 taking the best item. Sword and buckler is definitely better on defense than axe and buckler, and this is what shows it: two 1s are 3 and 2 against 3 and 1. It also caps a two-hander's double 1s at 6 and 1 rather than 12.
- A two-handed sword is one item, so it upgrades one 1 per blow or Defend. Good trade (Paul): the greatsword turns a 1 into a 5 on the attack, and sword and buckler defends better.

Decided (Paul, Oct 25): **the gear bonus moves from the 1 to the 6** (*Your 1s* becomes *Your 6s*). Burn a 6 with an item you have the Trait for and you may take your gear instead of the Spark: add its slots, free. Why: two faces where something happens was one too many, and the 1s were a distraction; the 6 stays the die that matters, and now it carries a real choice (pay Fuel for the clever move, or take the free number). Paul floated this on Oct 23 and went with 1s so the 1 felt improved, but a 1-slot item barely improves it (a dagger's 2 still feels like a bad die). The gain is the same +slots either way; on the 6 it reads as a bonus. Small items lean toward Sparks (a dagger's +1 rarely beats Flurry or Impale), big ones toward the number. Paul wants heroic swings, so:

- The slots add to the damage, and against a Monster Stack the total converts at ÷5 as usual (Paul). Small weapons often stay in the same band (a dagger's 6 + 1 is still 2 Hits); a 5-slot weapon always moves up one. Adding the slots as whole cards was written briefly and reverted the same day: not what was agreed, and far too swingy (a polearm 6 took 7 of an ogre's 8 cards).
- On a Defend, shield and Parrying weapons stack on the 6, with no cap: sword and heater 11, sword and tower 13. "A 6 negates the blow" was considered: a 6 already stops any unpressed quote (2–5), but a pressed blow is 6–10, and once in six the press die shows 6 and a second die follows (12–17). The gear decides that spike, so 6 + slots, not a flat negate.
- Each item once per blow, Defend, or cast; two 6s, one can take the gear and the other Spark. Taking the gear is instead of the Spark, so no Counterattack or Past them on that 6. Cursed Traits never add slots. A 1 is a plain low die again; the old "a raised 1 is never a Spark" clause is gone.
- Open: Breach (an ax's or mace's free 6 could ignore armor instead of adding slots); the press's second die (fresh roll or from the Referee's pool) isn't written.
- **Pinned (Paul, Oct 25): the Defend half.** A 6 on a Defend with a Trait shield or Parrying weapon adds their slots, stacking. It works point for point (Burners take damage, no ÷5), and it makes a 6 a strong chance to nullify the blow. Heroic.
- **Open: the attack half.** Slots added to damage don't survive the ÷5 conversion: a lone 6 plus 1–4 is still 2 cards, so one-handers gain nothing and two-handers little. Tried and set aside the same day: slots as whole cards (too swingy), round to nearest or down (steps still 5 wide), counting by 3s (works, but rewrites every monster). Saxon's rule, as recorded: gear may add free dice or change what a die is worth, never make you pay more dice. Whole dice survive ÷5; small value bumps don't.

Decided (Paul, Oct 26): **enchanted kit gives one free die a round, rolled as you use it.** A weapon's die goes on a blow; a shield's or armor's on a Defend. Burn your Fuel, then roll the free die and add it. It is not Fuel: no Initiative, can't go elsewhere, gone at the next Roll Initiative if unused. On top of the dice you burn, past any limit on the blow or Defend. A 6 on it is a 6 like any other. Why: rolled live it is chaotic, which suits magic, and nothing in the player's plan depends on it, so the old objection to live dice (you can't plan around faces you haven't seen) doesn't bite. Settles the contradiction where the extra die went into the "Initiative pool" while weapons give no dice. Armor still gives no Fuel; the free Defend die is the enchantment, not the harness.

- Under discussion (Oct 26), not decided: the Trait's own combat benefit. Leading option: the Trait lets a blow take one more die than usual (trained one-hander 2, trained two-hander 3), with the magic free die on top. Also on the table: Paul's first-instinct Fuel model (each held item gives 1 die, or its slots with the Trait; armor gives nothing; weapons in round 1, shields and empty slots in the refresh), which answers the Lothian 12-of-12 problem (every sheet rolls a pool of 1 under level + empty slots).

Decided (Paul, Nov 4): **monster armor is public, and blows compare weapon slots to it.** Every monster has an armor equivalent (AC 0–5, natural armor included: wolf as gambeson, troll as mail), told to the players. Against a monster: slots higher than the AC, +2 damage; equal, nothing; lower, −2; then ⌈÷5⌉, zero or less bounces. Replaces the closed −1, the face mix, face-down cards, Cracked, and the right-tool claim. Resistances and Bane go on the stat line (see below). Written into the Referee Guide's monster section.

- Why: Paul wants monsters visible (players engaged when they can read the stats) and slots to matter. The old −1 was AC 5 for every armored foe in card terms (an orc in leather as hard as a knight in full plate), though rounding up made it feel like 1–5 points depending on the blow.
- Path: subtracting the AC before ÷5 (Saxon's Resistance idea, with the player doing the math) graded armor gently; the Legends ladder (weapon vs armor, ±1 card) was steep, a sword against a troll bouncing five times in six. Paul brought the Legends comparison back as points before ÷5. ±3 was about half a card; Paul chose ±2.
- Per blow, cards: one die 1.50 / 1.17 / 0.67 (better / equal / worse); two dice 2.19 / 1.81 / 1.39.
- Keep rounding up: round to nearest would slow fights 25–75% and make bare flesh shrug 1s and 2s. (Later the same day: round up only with the weapon's Trait; see below.)
- Still to update: Adventure Game monster glossary and Aldric example, OSE Conversions (AC mapping, right tool), Principles, FAQ, Examples of Play, Lothian briefs (Resistance numbers).
- Decided later the same day: keep the ±2 comparison; the weapon's Trait decides the rounding. With the Trait, round up; without, round down. Cards per one-die sword blow, AC 0–5, trained/untrained: 1.50/0.67, 1.50/0.67, 1.17/0.33, 0.67/0, 0.67/0, 0.67/0. Greatsword (two dice): 2.19/1.39 through AC 3, 1.81/1.00 at 4, 1.39/0.61 at 5. Trained speed is unchanged from the round-up rule; an untrained one-die blow never hurts a foe its weapon ties or loses to. The Trait is worth about four-fifths of a card on most blows. Replaces the brief "one slot bigger" version. Passed over: win ties, untrained always −2, slots − AC added to damage, a once-per-fight Trait claim. Trait-as-dice rejected: Fuel is one pool, so a wizard carrying a sword would burn weapon dice on spells, and it would count slots twice.

Playtest set (Paul, Nov 6): **open HP goes to the table.** HP as in D&D (no formula stated to players), damage = Fuel + Weapon Class − AC, damage track counting up, Your 1s kept as the Trait's combat benefit (Paul, Nov 6: "no Spark without the Trait" reads as a penalty; nobody will love it), and enchanted gear wakes on a Spark: when a 6 Sparks with enchanted gear you're trained in, it does something special, its own power (the Bell Sword's toll) or a free die to fuel the Spark. Replaces the free die each round. Handout: [[burners-playtest-handout]], written against what players actually have. Paul: the only shipped updates were Oct 15 (dice = level + empty slots, max 4, weapons and shields add none; drop and roll back up each round; go first on the Referee's d6 3+; burn a 1 with a trained item to add its slots; Heart weapons are rod, mace, sceptre; Traits ahead of level; more generous XP). Weapon slots on a 6 never shipped.

Proposed (Paul, Nov 4): **open hit points as an alternative to the Monster Stack.** Monsters go on the slide with their HP showing (10 × HD, doubled because players stack many dice on a blow); damage = dice + weapon slots − AC, straight off HP. The weapon Trait gates Sparks: no Spark with a weapon or shield you lack the Trait for. Draft and pacing numbers in [[burners-open-hit-points]]. Not in the rules.

Decided (Paul, Nov 4): **shields and Parrying weapons work through Block, not the 6.** Spend an attack to Block a blow at you or an adjacent ally; Defend as normal, then each shield and Parrying weapon you have the Trait for takes its slots off what's left; armor soaks the rest. One attack, one blow. A Block counts as a melee attack for the Defend cap. Sword and buckler 3, sword and heater 5, sword and tower 7; axe and heater 3. Supersedes the pinned Defend half of *Your 6s* (Oct 25).

Decided (Paul, Nov 4): **resistances are fixed results of the slots-against-AC comparison.** The stat line names weapons, tags, or stuff and pins the step whatever the slots: resistances −2 (or −4), Bane +2. Skeleton: AC 0, Cutty −2, arrows −4; a mace compares as usual (+2). One step covers weapon against armor and resistances alike. Resistances are told to the players when they first show, like the AC. Paul: call them resistances, not "Shrugs"; no Crushy rule.

Decided (Paul, Nov 4): **weapons no longer add their slots on a 6.** The slots-against-AC comparison already makes weapon slots count on every blow, so the 6 adding them again is double-dipping. *Your 6s* now covers Arcana only (a cast or a Ward).

- Why: Paul wants the 6 to carry magic (an enchanted item's power wakes on a 6, as the Bell Sword's toll already does), so shields need a benefit that doesn't depend on a 6. Framing: armor is passive defense (soaks every blow), weapons and shields are active defense (paid for with an attack).
- Every Block costs an attack you could have struck with, which bounds it: sword-and-heater Veteran at Sword 1 strikes once and Blocks once. Against quotes of 2–5 a sword-and-heater Block cancels any unpressed blow; a pressed blow mostly lands in armor. Sword and board holds the line; the big steel kills.
- Still open: the enchanted 6 (swap the free die for "the item's power wakes on a 6"), and Paul's first-instinct Fuel model.

Tried and dropped:

- A 1 counts as the item's slots (not plus). A 1-slot item gained nothing.
- A Defensive weapon parries like a buckler (3). Sidesword and buckler would be no better than the sidesword.
- Shield adds +1 armor when its size is at least your armor. Then: use the better of shield size or armor, +1 if tied, only on blows you spend Fuel to Defend. Interesting (a shield is held into the blow), but it made a 15 gp tower match full plate on the blows you meet.
- Shield return (`burners-shield-return.md`): the top-off made the refill moot.

## Bugs / errata

1. ~~Equipment guide has battle ax listed as 4 slots rather than 3. Ylva has one.~~
2. ~~Small ax and horseman's ax slots.~~ Now: Throwing ax 1 slot (war hatchet, tomahawk), Small ax 2 slots (can be thrown, includes bearded ax), Battle ax 3 slots (two-handed), Long axe 4 slots. The horseman's ax is on the Mace row.
3. ~~Pole arm slots.~~ Now: Poleaxe and Long Axe 4; Halberd, Glaive, Guisarme, Ranseur, Partisan 5; Pike 6. The FAQ says a pike is six.
4. ~~Long spear missing from the equipment list.~~ Added at 4 slots, 5 gp.
5. ~~Two-handed weapons not marked.~~ The equipment list now uses the core rules' notes column ("two-handed", "can be thrown", "includes war hammer").
6. `Crushy` is on the Mace and Maul but never defined. Define it or remove it.
7. `Close` is on the Throwing Ax and Small Ax, but Close is defined as unarmed attacks only. Remove it.
8. ~~The Small Ax text mentions a rear spike for penetrating armor (the horseman's ax), but the horseman's ax wasn't a thrown weapon historically.~~ Now: the Small Ax is the bearded or Viking hand ax (can be thrown); the Horseman's Ax has its own catalog entry (2 slots, not thrown) and sits on the Mace row in the price lists.
9. Ylva's sheet says 7 dice (level 1, ax 3, shield 3) with no empty slots. Paul says 10.
10. Aren's sheet: Saxon's copy shows 32 gp and 8/12 load, which is the state before his Session 7 purchases (oil, torches, lantern, 19 gp). The file shows 13 gp and 12/12. Confirm whether the oil was used in Session 8.
11. ~~The two-handed second die should need the weapon's Trait.~~ Written, then reverted before it was pushed: with the Trait giving a reroll of 1s, the second die doesn't need to be Trait-only.

## General Comments

Saxon: How did you want shields, 1h weapons, and 2h weapons to work? I mean, what situations were they supposed to be good for?
Paul: the larger weapons are intended to be armor breakers. The 1H weapons are fine if the target isn't heavily armored, or to finish off foes whose armor has been broken.

Saxon: And how long did you want fights to go?
Paul: ideally 2-4 rounds. Not 1-2 rounds unless the players got the drop on the foes or simply outclass them. Not much more than 4 rounds since we want to keep moving fast.

Saxon: And how many cards dealt with per player?
Paul: I want the players to feel like heroes and drop monsters right and left. In that last fight, the retainers were often dropping one monster per round, but they were armed with axes or adapted and used spears as staves.

Saxon: And yes, a longsword in 3 slots can be used in 1 hand. This is worse than an arming sword as it takes up an extra slot and costs more.
Paul: the extra slot is one extra die, so it's a trade-off.
Note: that extra die only shows up in round 1 under the current rules, and disappears entirely under option C. The hand-and-a-half rule matters more if we switch.

Saxon: It can be used in 2h, but then you get no shield vs ranged, fewer starting dice, fatigue twice as fast, and only do more damage for 2 rounds at which point you are too tired to use it 2h anymore.
Paul: It's a multi-role weapon. Since it's 2H you can deal more damage. Yes it costs more to do that, but if the target is hardened you might *need* to do that. The larger issue here is the Fuel refresh is too slow currently, but that isn't a statement on this weapon.

Saxon: Your equipment list has no size 3 axe. It has small axe (2) and battle axe 2 handed (4). Your arms & armor guide has a size 3 axe, but no prices and the tags make no sense.
Note: that was the old list. It now has Throwing ax 1, Small ax 2, Battle ax 3 (two-handed). Prices live on the equipment list, not the catalog. Tag fixes are errata 6–8.

Saxon, second round:

- Basing dice on equipment causes problems like the shield one. Base them on things that don't change, and the problem goes away.
- Equipment should change the value of a die, not the number of dice at the start. With a fixed refresh, the difference between gear mostly disappears.
- Have you thought about a hand of cards instead of dice? It fits the rest of the game (Monster Stacks are cards) and opens up hands, peeking at the deck, the suicide king as special, alignment card bonuses.
- On the doc: 1. a pool from level + free slots, no gear; 2. Resistance applied before dividing; 3. can delay an action but not move; 4. the shield exploit is fixed by 1; 5. two-handers are still broken, make them better without spending more dice; 6. if players should drop monsters, either they take the front line and can fight, or NPCs hold the front and players use bows and spears, and right now NPCs get the kills; 7. a two-hander doesn't do more damage today because the cost can't be paid.
- Magic weapons are 2–6× a mundane weapon depending on resistance, he's had many over the years, you can't change gear much in a dungeon, and Traits don't matter in combat.
Paul: pool = level + open slots (up to 4), rolled every round. A free die per action (per attack for Veterans), a free die on a two-handed blow, and a free die on a shield Block, the last two needing the Trait. See *Proposed Fuel model*. (Since replaced by the trained attack rule, below.)
Note: cards are worth a separate experiment once the dice economy works. The magic weapon numbers check out: one extra die is about 1.5× the Hits against an open foe and about 5× against a closed one.

Saxon: Traits don't really matter in combat.
Paul: Traits currently matter in combat when they unlock the item's abilities. For example, the 2H attack with two dice is only possible with the Trait. Also magic items require a Trait for the item type, e.g. an enchanted longsword requires a longsword Trait or it's not magic for you. Also Traits will matter in combat if people take Signatures.
Note: the magic-item gate and Signatures are in the rules as written. The two-handed gate isn't: the core rules call most weapons open kit ("AC, slots, and blows as written" with no Trait), and only kit tagged Trained (greatsword, longbows, plate, firearms) needs one. A battle ax, longsword, spear or halberd throws its second die for anyone today. See errata 11. The proposed models all write the gate in: the free two-handed die and the free Block die need the Trait.
Paul: I'm thinking of saying you get a free die on an attack if you have the weapon Trait. Same for a Block with a shield (which costs an attack). 2H can optionally spend a second die, and allow combining two attacks to get that second die free. See *Trained attack rule*.

## Minimum changes for now

Now bundled as the changes we're applying: `burners-updates-2026-10-13.md`. This section is the earlier working version.

1. **Holding.** Hold your move, your Action, some of your attacks, or any mix of them. You're standing ready to act when something happens, but that doesn't mean you go first. Wait for the spearman to close so you can punch him, and his spear gets you first. (Replaces "a held Action goes off at the same time as its trigger.") Examples:
   - The rank behind holds its move and steps up when the front foe falls, and swings if it held its attack too.
   - A fighter in a doorway holds his attack and lets the enemy come to him, striking the first one that steps into reach.
   - An archer holds her shot until the target comes into view, or until her friend is out of the line.
   - A Veteran with a longsword uses one attack now and holds the other: "my weapon's longer; as he steps up, I stick him."
   - A scout holds her move at the corner and steps out when the guard turns his back.
2. **Your maximum is your level + empty slots (up to 3).** Round 1 you roll your maximum. Each later Roll Initiative, top off: roll new dice until you're back at your maximum. Weapons and shields give no dice. One answer to "how many dice do I get?", no alpha strike, no stockpiling past the maximum, and nothing to gain by dropping gear. The cap of 3 matches the backpack (3 slots).
   - Players will drop their bad dice before topping off, so in effect: keep the faces you like, reroll the rest. Say so in the rule rather than leave it as a trick.
   - What to keep becomes a choice: 6s for Sparks and big blows, 3s and 4s for Initiative, high faces for Defend.
   - The Trait's reroll of 1s still matters for 1s rolled during the top-off, which you're stuck with for that round. (Now: a trained 1 adds the item's slots, so with heavy kit a 1 is worth keeping.)
3. **A Trait rerolls 1s:** with a weapon on a blow, with a shield on a Block. No reroll without the Trait. (Replaced by update 3: a trained 1 adds the item's slots.)
Dropped: the fallen staying put. The rank behind may step up; the real fix is dice (2) and an unused attack meeting a foe as it steps into reach (1). Also dropped: round 1 dice from the weapon in hand. Weapon length plays out through holding: win Initiative as they close, and the longer weapon strikes first.

Not rules: put coin behind fights; stage level 1 fights at about one foe per front-liner.

Decided (Paul, Oct 24): **Line of attack** (first written as *Through a friend*, then widened the same day: an attack hits the first one in its line, friend or foe, so nobody attacks past the enemy front line into its second rank without a 6). Session 9 let Chris attack from the second rank as a one-off. The first written rule (Oct 23: a spear or polearm of 4+ slots thrusts from the rank behind with one die) made it automatic, and it's a trick shot, not an every-round thing; with a 1-minute round, a fixed back rank that always strikes is 5e thinking. Now one simple rule covers back-rank blows and shots with a friend in the line: the attack hits your friend unless you burn a 6 on it. Any weapon; a blow from behind is one die, a shot keeps its dice. The 6 is the opening you wait for across a minute-long round (Paul), and the creative end of the die, so the player says how: over a shoulder, under an arm, a roll between a friend's legs and back out. Tried first and dropped the same day: the foe using your friend as Cover, with the 6 making it clean. Paul wanted it simpler. The old melee-foe Cover rule (a foe using the Burner it fights as Cover vs a missile, with Hit the Cover on a Spark) goes too: Through a friend covers it, and it was always fiddly. Cover is back to walls, raised shields, and creatures. Foes get past the line rarely, on a 6 among the Referee's dice and by the Referee's choice: the player should feel clever for the trick, and that doesn't mean monsters do it as often (Paul).

Decided (Paul, Oct 25): **The Referee's dice**, written down at last (Paul had been rolling about five at the table). The Referee picks how many; the suggestion is the biggest monster's HD or one per player, whichever is greater. They add noise to the outcome, not a mirror of the Burners' Fuel: press a quote, or a rare 6 to get past the line. No Defend with them, no Initiative from them, and no matching the players play for play. The players should feel clever; the monsters are not as clever. One pool for the whole fight, no refill, as Paul has run it: per-round refill would hand the Referee a fresh pool every minute and erode the scarcity of 6s. Foe Initiative stays the 1d6 for each group. Counting 3s and 4s on the Referee's dice was considered and rejected: it would flip the order (a 5-die Burner goes first about 28% of the time against a 1d6, about 63% against 5 Referee dice), turn the pool size into a speed dial, and give every foe group one shared number.

Notes on 2:

- Packs stay behind (Paul): players should drop their packs in a room that feels safe and advance without them, not walk around 12 of 12. A party at 9 of 12 rolls level + 3 every round: 4 dice at level 1.
- Caught with the pack on (ambush, or never dropped it), a full-kit level 1 PC rolls 1 die a round and goes first about 6% of the time. Dropping the pack mid-fight takes your Action (Paul: picture getting out of a 40 L trekking rucksack, hip belt and sternum strap and all, with your weapon set down to do it).
- Cap of 3, not 4 (Paul): 4 dice at level 1 is enough for one two-handed blow and two Defends, two big blows and no Defend, or one attack and three Defends. Level adds a die each level (5 at level 2, 6 at level 3), so the cap only has to carry level 1. (Now 4, Oct 14: the extra die pays for going first. Briefly back to 3 that night, then 4 for good (Paul): four empty slots is hard to get, but possible. With packs left behind, 3 empty is the norm, so the 4th die rewards the few who really travel light, and mail still costs a die against leather.)
- A level 1 Veteran with a one-hander spends about 3–4 dice a round and tops back up to 4 with the pack off, so he holds steady; a cap of 2 would leave him slowly running down.
- Dropping a shield mid-fight frees slots for more dice next round, but dropping to free a slot costs an Action.
- Sorcerers lose their Arcana dice, and Sorcerie slots never count as empty. They can still cast: spell level ≤ Sorcerie ≤ level, so level dice always cover the minimum. What they lose is the burst that made a cast total beat a Defend.
- **Sorcerers (Paul): keep the current casting cost** (at least spell-level dice). Level advances enough to pay it, and the cost itself keeps Sorcerers short of dice, poor at defending or fighting otherwise. Every card of hand size is a Sorcerie slot that adds no dice, so re-splitting for a bigger hand trades away staying power.
  - Considered and set aside: one die per cast, with the spell's level added to the cast total. It would make Sorcerers more reliable but needs a pass on Ward and area spells.
  - The school's Trait rerolling 1s, like weapons, also cuts fumbles; schools are trained-only, so every Sorcerer has it.
  - Open: Arcana's job in a fight (+1 to the cast total, reroll 2s as well, or costume only).
  - Later (Paul): a Trait rerolls a 1 burned with any item, Arcana included. Paul finds rerolling 1s fun, and it stays even though it nearly removes cast fumbles for a trained caster (one-die cast 17% → 3%). Open: does the Trait have to name the Arcana (*staff*, *wand*) as weapon Traits name the weapon, and do fumbles, Fragile and cursed Traits read the face after the reroll?
  - Replaced (update 3): a trained Arcana's 1 adds its slots on a cast, and casts don't fumble in combat. Fragile and cursed Traits are open in the updates file.

## Next steps

1. Before next session (rulings, no rewrite):
   - Reply to Saxon: agree the doorway fight was a grind and level 1 has too few dice; hold that weapon choice should matter against skeletons; tell him the Fuel model is being reworked.
   - Holding ruling: change 1 above.
   - Put coin behind the next fight.
   - Stage for level 1: one attacker per front-liner, archers as a separate problem.
2. Quick errata: items 6–9 above, and put the one-handed rule for two-handed weapons in the core rules.
3. Fuel model: simulate the current rules against the proposed Fuel model (with options A and C for comparison). Test fights: a level 1 longsword fighter against two skeletons with archers, sword and board against an orc knot, a two-hander against a crab. Measure rounds to finish (target 2–4), monsters per PC per round (target about 1), and HP lost.
4. After choosing a model: pick the Initiative band, decide on hand-and-a-half, then rewrite the combat chapter, FAQ, examples of play and Referee guide, and redo every character sheet's Initiative pool in one pass.

Playtest set, revised (Paul, Nov 6): **Weapon Class needs the weapon's Trait.** Untrained, a blow is just Fuel − AC (one die one-handed, two dice two-handed). Trained, add the weapon's slots. This gives the Trait the same job on a blow that it has on a Block, and replaces Your 1s on the handout: with slots on every trained blow and Block, burning a 1 for slots counted them twice (a sword-and-heater 1 cut 4 + 5 = 9 on a Block, against 11 for a 6). The handout section on Blocks is now called Blocking. Revised again (Paul, Nov 6): damage is Fuel − AC, plus the hands you use (1 or 2) untrained, or the weapon's slots with the Trait. Weapon Class gets its own handout section: hands used untrained, slots trained, and a two-handed weapon used in one hand is Weapon Class 2 at most (proposed cap; Paul asked only that it be lower).

Playtest set (Paul, Nov 6, 15:09): **reach past a friend.** A weapon of 4+ slots (hewing spear, long spear, polearm) attacks past a friend by discarding one Fuel instead of burning a 6. Shorter weapons and shots still need the 6, and getting past the enemy front line still takes a 6 for everyone. Gives long weapons the second-rank job without making it free (the Oct 23 rule made it automatic). A blow past someone is still one die. Reversed the same afternoon (Paul, 15:22): getting past anyone in the line takes the 6, long weapons included; a block of pikemen drilled to fight in ranks is the exception, its second rank striking past the first without the 6. Then (Paul, 15:22): striking past a friend with a spear or polearm is drilled, not improvised, so it is a Trait: *pike drill* (Sword) lets you do it without the 6. A block of pikemen has it. Renamed (Paul, 15:24): it is formation fighting. Veterans trained in *formation fighting* (a Sword Trait) can burn any die to strike past a friend. Then (Paul, 15:37): formation fighting is teamwork. Veterans who share the Trait strike past each other by burning any die; a long spear alone does not do it. Any weapon; the shared drill is the gate. Then (Paul, 17:08): the formation Trait is gone from the handout; the note reads "a wild melee, not a phalanx." The ready answer to "can I take a Signature to fight from the back rank?" is yes: a Signature on your spear Trait lets any die get you past, not just a 6. Signatures emerge in play (likely the Instinct shape), so it is earned by doing it, not picked.

Revised (Paul, 17:17): "any die instead of a 6" goes too easy. The Signature now reads: once per fight you can strike from the back rank without the 6. Wider principle for suggested Signatures: players haven't taken one yet and need examples, but each should be a small, limited edge (once per fight, one situation), not a standing rule change. Then (17:18): it must be a Sword Signature, not just any Signature, and it covers shooting past the front line as well as spearing past it. Once per fight stays; a Signature is one pick per level, so if a player spends it here, so be it. Side effect: the longbow is a Craft Trait, so a longbowman can't take it on that bow; the warbow (Sword) can.

Handout cleanup (Paul, 17:32): Damage now says "tally" to match Monster cards. Room to swing adds "Either way you lose the second die," so the discard buys one die, not a full two-hander swing. The touch rule reads: if your Fuel cancels all the damage, the blow never touches you and its special attack fails (no poison, no level drain, no grab); armor only stops damage. Dropped rules: the Handguard line now says a Handguard no longer takes its slots off a Block (Parrying weapons do), which matches Gear's Handguard-as-armor. Left open: Impale slots on a Spark, ally-only Block, the Arcana bonus to cast totals.

Trained bonus needs an exact weapon Trait (Paul, 19:15): "arming sword", "longsword", "greatsword"; not "swords" or "pointy things". "Peasant weapons" is a category of Craft weapon Traits (spear, hatchet, sickle), like the Sword arms list, not a Trait itself; the published wording is fine.

Handguard folded into Parrying (Paul, 19:48): every Handguard weapon was already Parrying (only the messer is Parrying without one), so the two tags marked the same swords. Now one tag, two triggers: a trained Parrying weapon takes its slots off a blow when you Block, or off a blow aimed at your sword hand with no Block needed. Handguard AC 1 to 4 and center-grip shields adding to the hand are dropped. Local Arms and Armor still carries Handguard tags and the Handguard and Grip paragraphs; strip at the next publish.

One die each way (Paul, 20:16): an attack burns one Fuel die whatever the weapon (the two-hander's second die is gone), and every Defend burns one die, whatever is coming (the open Defend after a melee, two dice with Cover, and no limit against magic are gone). With the Trait: an attack adds the weapon's slots, a Defend with a shield adds the shield's slots, a cast adds the Arcana's slots. Parrying weapons still add on a Block or a blow at the sword hand. An enchanted weapon or shield you're trained in lets you burn a second die (your own Fuel) on the attack or Defend. A Spark with enchanted gear may wake a power but never gives a free die. Open: Cover has no effect left; does Ward stay up to Sorcerie level; enchanted armor; does a shield add against a spell.

Room to swing becomes a bid (Paul, 20:28 to 20:31): you bid one Fuel die to make an awkward attack (no room, or a two-hander in one hand). A foe can counter with a higher die; then the bid and the attack are both lost. Faces compete, so it is a bid, not an ante: you choose how hard your move is to stop. Paul sees the same pattern for drawing or picking up a weapon when a foe doesn't want you to. Open: what a monster counters with (the Referee's dice are local only), and whether a Burner can counter a foe's bid.

Bids are one round (Paul, 20:36): you bid once, the foe may counter once with a higher die, and a higher counter wins outright. No counter to a counter. Drawing or picking up a weapon with a foe in reach is the same bid.

Fuel maximum, five (Paul, 22:59 to 23:00): roll your level plus one die for each slot that is empty or holds a weapon, shield, or Arcana, 5 at most. Armor and gear give no dice. Was: level plus empty slots, 4 at most, with weapons, shields, and Arcana giving none. Not called "hand" (a Sorcerer's hand is their spell cards). Effect: only armor and baggage cost Fuel; weapons and Arcana are symmetric; most Burners sit at the cap. Revised (23:01): back to 4 at most. A level 1 Burner then rolls 5 dice, so the five lands on the starting total.

Fuel maximum is level + 4 (Paul, 23:04): slots no longer matter for Initiative, and the pack-on penalty goes too. Items already pay for themselves in slots: a pack crowds out armor, a two-hander, a shield, a torch. Armor no longer costs Fuel; its prices are gold, slots, and the plate Trait.

Your wind (Paul, 23:06): the 4 in level + 4 is your wind. In a long fight the Referee drops it by one at a time as you tire; a day without food or a night without sleep takes one too. Kept to one line on purpose: fatigue should stay simple and fast. Open: how it comes back (a rest? a meal and a sleep?), and how it sits beside Heat, which already prices hunger, cold, and exhaustion.

Shields add on a Block only (Paul, Nov 7 14:35): a trained shield no longer adds its slots to every Defend. When you Block, a trained shield and trained Parrying weapons take their slots off the blow. Reverses the 20:16 "a Defend with a shield adds its slots."

Defend matches your Action (Paul, Nov 7 15:13): a Defend burns one Fuel die, and you may burn extra Fuel when your Action this round matches the threat. Melee attacking: extra on blows. Spellcasting: extra on spells. Loosing arrows: extra on shots. Other matches count, like a trap that springs while you disarm it ("playing with fire"). No cap is set on the extra. This is Option A from the 14:39 discussion, without the cap of two. It replaces "one die each way" for Defends; "Defending with more than one die" is off the Dropped rules list.

Block and Parry (Paul, Nov 7 15:14): Block is its own section, apart from Defend. The trained bonus on a Block is now a named move, Parry: "When you Block with a weapon or shield you're trained in, you Parry: it takes its slots off the blow." This replaces the Parrying tag; the list of what Parries (shields, swords, the parrying dagger) stays. Open: the ancestry Trait *parry* now collides with the move.

Trained Arcana (Paul, Nov 7 15:17): the Arcana rule is a trained bonus, not a casting rule. A trained Arcana (a staff, wand, or orb Trait) adds its slots to the cast total, whether the spell does damage or not. One Arcana per cast. A trained Arcana adds to a Ward too (Paul, 15:17). One Arcana per cast or Ward. This supersedes the local rulebook's "Your 6s" (a 6 burned with a trained Arcana may take your gear instead of the Spark).

Self-Block and early declaring (Paul, Nov 7 15:26): the handout now says you can Block a blow aimed at you, not just one aimed at an adjacent ally (the local draft had it; Oct 15 did not). It still spends an attack. For matching, if the threat comes before your turn, you declare your Action early.

One Approach per use (Paul, Nov 7 15:28–15:29): a Trait belongs to one Approach, and its use goes with it. A Heart *rod* is a weapon Trait and never counts as Arcana training. A Sorcerie *staff* covers only its use as Arcana; fighting with a staff is a Craft Trait (the quarterstaff joins the peasant weapons). On the handout under Weapon Traits.

Approach Traits and Crossovers (Paul, Nov 7 15:30–15:31): the handout gets a second page. "Weapon Traits" is renamed Approach Traits and moved there, with *staff* added under Craft. A new Crossovers section: an item with a Trait under two Approaches, one per use, for characters with levels in both. Examples: staff (Sorcerie Arcana, Craft weapon), rod (Sorcerie Arcana, Heart weapon), mask (Sorcerie Arcana, Craft disguise), signet ring (Sorcerie Arcana, Heart seal for trading, bargaining, and pulling rank). A mace under Sword and Heart is the same use, so it is not a crossover.

Untrained Parry (Paul, Nov 7 15:36): when you Block you Parry, and each shield, sword, or parrying dagger you hold takes 1 off the blow, or its slots if you are trained in it. It is the same shape as damage: untrained gets the base, training brings in the slots. This makes Block worth taking for non-Veterans, while sword and board at full slots stays the trained fighter's art. Paul's framing was "the number of hands"; the handout counts items, which differs only for an untrained two-hander (an untrained longsword: 1 by items, 2 by hands). The table header now reads "Trained, you Parry with."

No "Parry" (Paul, Nov 7 23:40): the term is dropped. A Block always reduces the blow, so the handout just says so: each shield, sword, or parrying dagger you hold takes 1 off, or its slots if trained. A trained sword still takes its slots off a blow aimed at the sword hand without a Block. The table header is "Trained, you Block with." This also clears the collision with the ancestry Trait *parry*.

Block and Parry split (Paul, Nov 7 23:49–23:50): two moves, each spending an attack, one attack per blow.
- Block is back to the October 15 bodyguard move. You step in front of a blow aimed at an adjacent ally and Defend it as normal. One shield or sword you hold takes 1 off, or its slots if trained. It started as the shield only, but bodyguards also used two-handed swords, so any one item counts.
- Parry is new. You meet a blow aimed at you, and each shield, sword, or parrying dagger you hold takes 1 off, or its slots if trained, and they stack.
- The difference: one item between your friend and the blow, everything you have for yourself.
- The sword-hand rule now reads "with no Parry needed." The table header is "Trained, you Parry with."
- Open: the ancestry Trait *parry* collides again, and both moves should count as fighting in melee for matching.

Split reverted (Paul, Nov 7 23:53): back to the single Block. You can Block a blow aimed at you or step in front of one aimed at an adjacent ally. Each shield, sword, or parrying dagger takes 1 off, or its slots if trained. The split into Block and Parry was more confusing: two near-identical moves, with two counting rules. The fiction (bodyguard vs fencer) is narrated under one name. No "Parry" term, so there is no ancestry collision.

No untrained Block bonus (Paul, Nov 7 23:55): the "1 off per item" for untrained gear is dropped. When you Block, each shield, sword, or parrying dagger you are trained in takes its slots off; without the Trait you Defend with your Fuel alone. One principle now runs through damage, Block, Arcana, and enchanted gear: without the Trait, you are just using your Fuel. An untrained Block is still worth it to step in front of an ally (the October 15 use).

Hand blows dropped (Paul, Nov 7 23:59): the rule that a trained item takes its slots off a blow aimed at your hand, without a Block, is cut. It was realistic, but an extra detail that will hardly ever matter. Block is now the only way gear takes slots off a blow.

Empty slots back; fatigue fills slots (Paul, Nov 8 20:23).
- Fuel is level plus empty slots (up to 4) again, as on October 15. This reverses the Nov 7 flat level + 4, because empty slots give players a loadout to optimize.
- "Your wind" becomes Fatigue. In a long fight, fatigue fills an empty slot, then another. A day without food or a night without sleep fills one too. With no empty slot, you drop something to make room. Rest, food, and sleep clear it.
- "Empty slots for Fuel and the pack-on penalty" is off the Dropped rules list.
- Open: which rest clears how much (Hour Rest vs night), the overlap with Heat, and whether to keep the cap at 4.
- The slot tax falls harder on sword and heater (5 slots) than on a greatsword (4).

Monster initiative (Paul, Nov 8 20:29): the single d6 is replaced. The Referee rolls the monsters' highest Hit Die plus 4 in d6s (fewer for slow ones), counts the 3s and 4s, and sets the dice aside; monsters keep no Fuel. Players match or beat that count to go before them. This mirrors level plus empty slots, and the +4 reads as an unburdened monster. Odds for 5 player dice going first: 63% vs HD 1, 39% vs HD 4, 11% vs HD 10. On the handout, the players' paragraph says "the Referee does the same for the monsters", with a bold **Monsters.** paragraph for the Referee's procedure.

Monster Fuel (Paul, Nov 8 20:30): monsters do use Fuel, one pool for the whole group. The initiative dice (highest HD plus 4, fewer if slow) are the pool, topped up each round like the players'. This answers what a foe counters a bid with. Open: what the group burns it on (Defends against Burner blows, bid counters, Sparks, anything beyond quoted attacks), and whether the pool tops up to the full count after members fall. The Referee spends the pool to bolster any monster's attack or Defend (Paul, 20:31). It adds a little variability, and lets the Referee emphasize the monster that has the advantage or is the more interesting one. On the handout as "so the boss, or the one with the upper hand, hits harder."

**Free die for your Action; monster Weapon Class (2026-11-08 20:54).** Paul: one free die for your Action, much as monsters get today. A monster with several attacks gets one die per attack. Rolling extra dice for a monster's big attack was breaking scale, since more dice means more chances at a 6; instead each monster card gets a Weapon Class (WC), on the same scale as weapon slots, added to its attack the way training adds slots. Handout: the free die goes on your blow or shot, or adds to your cast total; you can burn a Fuel die in its place to pick the face; a Veteran's extra attacks burn Fuel (the burn-instead clause is the agent's proposal, not yet confirmed). Sample WCs: zombie 1, wolf 1, orc 2, ogre 4, wyvern 3, red dragon 5. Follow-on, discussed not decided: with the free die, the per-round refresh matters less (options in paul-questions.md, 20:42). WC is by weapon type (Paul, 20:55): it is the slots of the weapon the monster carries, so a skeleton with a longsword is WC 3. With no weapon (teeth, claws, stings), the Referee guesses on the same scale. Enchanted weapon with the free die (Paul, 20:58): the expected play is the free die on the attack plus one extra Fuel die for the enchantment. Handout wording changed from "a second Fuel die" to "one extra Fuel die on the attack (on top of your free die) or the Defend." Reversed a minute later (Paul, 20:59): the enchanted item rolls its die again, as on Oct 15, so the magic feels swingy. It is not Fuel and its face can't be picked; once a round, on top of the blow or the Defend. "Enchanted gear's free die" came off the Dropped rules list.

**Trained attacks do their slots (2026-11-08 21:01).** Replaces the free die for players. Paul: trained in your weapon, an attack does its slots without burning Fuel, and you can still burn one Fuel die on top. Untrained, the only way to do damage is to burn Fuel. Training becomes the line between a fighter and someone holding a weapon, and matches Block (training takes slots off a blow). Randomness moves to the Fuel face you choose and the enchanted die. Enchanted weapon or shield (Paul): either burn a second Fuel die or take one free die; on the handout as the player's choice, once a round, on the attack or the Defend. Casting loses the free die and stays all Fuel, plus Arcana slots. Monsters keep a free die per attack plus WC. Open: Veterans' extra attacks (free slots on each multiplies fast; option: each extra attack needs a Fuel die); armor as a hard wall for small weapons (slots at or below AC do nothing without Fuel). Veterans settled (Paul, 21:01): each extra attack also does its slots for free, and an attack spent on a Block takes the trained items' slots off the blow for free.

**Untrained Block (2026-11-09 09:08).** Paul: someone untrained in defense can't defend, and is better off flailing and attacking. So no untrained Block bonus, and a Block does not count as fighting in melee for Matching your Action. Attacking in melee already unlocks extra Fuel on melee Defends, so the untrained fighter's best defense is to attack. An untrained Block stays the bodyguard move (your body in the way of a blow meant for an ally). Handout unchanged.

**Untrained attacks bid (2026-11-09 18:07).** Paul: you always add the weapon's slots. Untrained, improvised, or unarmed, you must bid one Fuel to make the attack, so someone who knows what they're doing can easily stop you (a counter with a higher die loses the bid and the attack). Replaces Paul's draft penalty table (untrained Veteran -1, untrained non-Veteran -2, improvised -3, unarmed -4). Untrained costs reliability and Fuel, not damage. Fists have no slots; the Referee sets an improvised weapon's. Open: whether any foe can counter or only one trained in its weapon; whether this bid and Room to swing stack into two bids. Revised (Paul, 18:07): training stays in the main Damage rule. Trained, you do the weapon's slots; untrained, none (burn a Fuel die for damage). The bid is only for improvised or unarmed attacks, and sits in Combat details. Dropped the line giving fists no slots and letting the Referee set an improvised weapon's slots, since with no Trait they do none anyway. Revised again (Paul, 18:25): untrained goes back with improvised and unarmed. Any of the three must bid one Fuel to make the attack; once through, a weapon still adds its slots (fists none, the Referee sets an improvised weapon's). A weapon's edge over bare hands is its slots; training's edge is not needing the bid. Who must bid (Paul, 18:37): only against foes who know what they're doing. Against foes as untrained as you, all just flailing, skip the bid. This answers the earlier open question of who can counter. Cut the line on fists and improvised weapons (Paul, 18:38): the Damage rule already says you do your weapon's slots, so unarmed plainly does none. A broken bottle at 1 slot is arguably generous, but it's an edge case the player will raise if they want to push it.

**Monster damage: one d6, a 6 backs up (2026-11-09 21:00).** Replaces Weapon Class on monster cards. Paul's table practice: one free d6 per monster attack; on a 6, roll once more and add (not open-ended). It has approximated D&D damage well (average about 4.1). Players don't need to know which monsters carry bigger weapons; for one the Referee wants to emphasize (a huge polearm, a giant crab), roll 2d6. Stay with d6s rather than other dice. Bolstering from the group pool is the other way to make one monster hit harder. Through-armor averages (AC 0 / 3 / 5): d6 with backup 4.1 / 1.6 / 0.8; 2d6 7.0 / 4.0 / 2.3; d6 + WC 3 6.5 / 3.5 / 1.7. Cards back to AC and HP only.

**Monster damage: WC, and a 6 Sparks (2026-11-09 22:15).** Replaces the d6-with-backup entry above. Paul: a monster hits for its WC. The Referee rolls a d6 with each attack; a 6 is a Spark that adds 6 to the damage, or, for a monster with a special attack, triggers that instead. Giants and other high-damage monsters roll their damage dice, often 2d6, so they Spark more often; that suits freakishly scary giants, and it keeps giant WC in the 5 to 7 range rather than 7 to 10. WC is named in the Monster cards paragraph but kept off the sample cards, since players don't need each monster's weapon size. Confirmed (Paul, 22:27): WC stays off the monster cards; a giant can roll two Sparks on 2d6 (+12, or +6 and its special attack), which is meant to be scary.

**Monster damage base: Hit Dice or weapon (2026-11-10 14:33).** Paul: the base is the monster's HD or its weapon's slots, whichever feels right in the moment; roll a d6, and on a 6 Spark (trigger its special) or add 6. Chosen over HD + d6 for the heroic feel: once a character's armor reaches a monster's HD, only its 6s get through (17%, near old D&D's to-hit against good armor), monsters above your armor always land, and orcs are dangerous in numbers (at least one Spark in a round: 42% with 3, 60% with 5, 77% with 8). Faster too: no addition. A monster with several attacks splits its HD across them. Not modeling orc weapon differences (halberd vs falchion); it's an approximation. Giants and other freakishly strong monsters still roll 2d6. Example (Paul, 14:33): a troll at WC 3/3/5 for claw/claw/bite, about 14 a round against no armor (B/X 12.5), 5 against AC 3, 2.3 against AC 5, with a 42% chance of at least one Spark a round.

**Skip the line is a Bid (2026-11-10 15:22).** Replaces Line of attack (burn a 6 on the attack; Sword Signature once per fight without the 6). Paul: an attack still hits the first one in its line, friend or foe. Bid one Fuel to skip past one target: a spear thrust, an arrow, or a spell past an ally. The bid must be a 6 unless the weapon is over 10 feet long (5 slots). As a Bid it can be countered once by a higher die, so a 6 is safe; the handout doesn't say to bid high, since that holds for every bid. The phalanx note and the Sword Signature exception are dropped. Revised (Paul, 15:23): no 6 requirement and no long-weapon exception; any bid works, and if you're out-bid the attack hits your ally.

**Standing up is a Bid (2026-11-10 15:24).** Paul: rising from the dirt with a foe pressing you in melee is a bid. Added to the handout's Bidding list. The published rules word it as a die re-rolled 3+ (fail and you stay down; the die is burned either way); the handout states it as a bid, which a foe can counter once with a higher die.

**Bids become Hard moves: burn and counter (2026-11-10 15:54).** Paul: it isn't a bid or a bet, since you lose the die either way and the foe pays for the counter too. The handout section is now Hard moves: burn one Fuel to try; a foe can counter by burning a higher die; you can't burn again; if countered, the move fails (for Skip the line, the attack hits your ally). Each entry reads "Burn one Fuel to…". The counter die is burned, so the Referee pays for counters from the monster pool. "Bid" was never in the published rules. Renamed (Paul, 16:20): the section is Friction, Clausewitz's word for everything that makes simple things hard in a fight. Chosen over Obstacles, Disadvantages (clashes with 5e), Bad position, Openings, Closed lines, and the fire-word candidates.
