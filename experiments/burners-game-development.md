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

1. **Rerolls.** The Trait improves the dice you burn instead of adding dice.
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

## Bugs / errata

1. ~~Equipment guide has battle ax listed as 4 slots rather than 3. Ylva has one.~~
2. ~~Small ax and horseman's ax slots.~~ Now: Throwing ax 1 slot (war hatchet, tomahawk), Small ax 2 slots (can be thrown, includes horseman's ax), Battle ax 3 slots (two-handed), Long axe 4 slots.
3. ~~Pole arm slots.~~ Now: Poleaxe and Long Axe 4; Halberd, Glaive, Guisarme, Ranseur, Partisan 5; Pike 6. The FAQ says a pike is six.
4. ~~Long spear missing from the equipment list.~~ Added at 4 slots, 5 gp.
5. ~~Two-handed weapons not marked.~~ The equipment list now uses the core rules' notes column ("two-handed", "can be thrown", "includes war hammer").
6. `Crushy` is on the Mace and Maul but never defined. Define it or remove it.
7. `Close` is on the Throwing Ax and Small Ax, but Close is defined as unarmed attacks only. Remove it.
8. The Small Ax text mentions a rear spike for penetrating armor (the horseman's ax), but the horseman's ax wasn't a thrown weapon historically. Either describe the Small Ax as a bearded or Viking hand ax, split the horseman's ax back out (2 slots, not thrown), or move it under the Mace.
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
   - The Trait's reroll of 1s still matters for 1s rolled during the top-off, which you're stuck with for that round.
3. **A Trait rerolls 1s:** with a weapon on a blow, with a shield on a Block. No reroll without the Trait.
Dropped: the fallen staying put. The rank behind may step up; the real fix is dice (2) and an unused attack meeting a foe as it steps into reach (1). Also dropped: round 1 dice from the weapon in hand. Weapon length plays out through holding: win Initiative as they close, and the longer weapon strikes first.

Not rules: put coin behind fights; stage level 1 fights at about one foe per front-liner.

Notes on 2:

- Packs stay behind (Paul): players should drop their packs in a room that feels safe and advance without them, not walk around 12 of 12. A party at 9 of 12 rolls level + 3 every round: 4 dice at level 1.
- Caught with the pack on (ambush, or never dropped it), a full-kit level 1 PC rolls 1 die a round and goes first about 6% of the time. Dropping the pack mid-fight takes your Action (Paul: picture getting out of a 40 L trekking rucksack, hip belt and sternum strap and all, with your weapon set down to do it).
- Cap of 3, not 4 (Paul): 4 dice at level 1 is enough for one two-handed blow and two Defends, two big blows and no Defend, or one attack and three Defends. Level adds a die each level (5 at level 2, 6 at level 3), so the cap only has to carry level 1.
- A level 1 Veteran with a one-hander spends about 3–4 dice a round and tops back up to 4 with the pack off, so he holds steady; a cap of 2 would leave him slowly running down.
- Dropping a shield mid-fight frees slots for more dice next round, but dropping to free a slot costs an Action.
- Sorcerers lose their Arcana dice, and Sorcerie slots never count as empty. They can still cast: spell level ≤ Sorcerie ≤ level, so level dice always cover the minimum. What they lose is the burst that made a cast total beat a Defend.
- **Sorcerers (Paul): keep the current casting cost** (at least spell-level dice). Level advances enough to pay it, and the cost itself keeps Sorcerers short of dice, poor at defending or fighting otherwise. Every card of hand size is a Sorcerie slot that adds no dice, so re-splitting for a bigger hand trades away staying power.
  - Considered and set aside: one die per cast, with the spell's level added to the cast total. It would make Sorcerers more reliable but needs a pass on Ward and area spells.
  - The school's Trait rerolling 1s, like weapons, also cuts fumbles; schools are trained-only, so every Sorcerer has it.
  - Open: Arcana's job in a fight (+1 to the cast total, reroll 2s as well, or costume only).
  - Later (Paul): a Trait rerolls a 1 burned with any item, Arcana included. Paul finds rerolling 1s fun, and it stays even though it nearly removes cast fumbles for a trained caster (one-die cast 17% → 3%). Open: does the Trait have to name the Arcana (*staff*, *wand*) as weapon Traits name the weapon, and do fumbles, Fragile and cursed Traits read the face after the reroll?

## Next steps

1. Before next session (rulings, no rewrite):
   - Reply to Saxon: agree the doorway fight was a grind and level 1 has too few dice; hold that weapon choice should matter against skeletons; tell him the Fuel model is being reworked.
   - Holding ruling: change 1 above.
   - Put coin behind the next fight.
   - Stage for level 1: one attacker per front-liner, archers as a separate problem.
2. Quick errata: items 6–9 above, and put the one-handed rule for two-handed weapons in the core rules.
3. Fuel model: simulate the current rules against the proposed Fuel model (with options A and C for comparison). Test fights: a level 1 longsword fighter against two skeletons with archers, sword and board against an orc knot, a two-hander against a crab. Measure rounds to finish (target 2–4), monsters per PC per round (target about 1), and HP lost.
4. After choosing a model: pick the Initiative band, decide on hand-and-a-half, then rewrite the combat chapter, FAQ, examples of play and Referee guide, and redo every character sheet's Initiative pool in one pass.
