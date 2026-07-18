---
layout: default
title: "Burners OSE Conversions"
hero: /images/lancelot-speed-pd/knight-approaching-distant-castle.png
hero_alt: "A knight rides toward the distant keep — Lancelot Speed"
---

# Burners ↔ OSE Conversions

Every OSE conversion follows [[Burners Principles]]. The routing tables below are the OSE-specific application.

The clocks already match: OSE turns and rounds are Burners turns and rounds. Durations, torches, and wandering-monster checks run as written.

---

## What Ports Unchanged

- **Turns (10 min) and rounds (1 min)** — all durations as written.
- **Morale (2–12, checked on 2d6)** — use the module's score directly. A Boss's arts work on it as usual.
- **Reaction rolls (2d6)** — as written; a character leading the parley adds **Heart**.
- **Number Appearing, Treasure Type, coin values** — as written; prices are already gold-denominated. Treasure Type hoards convert to gp as written; award **1 XP per gp** when the crew **claims** the haul (see [[Burners Experience]]).
- **Movement rates** — read as relative speed and reach; resolve in fiction and zones.
- **XP** — OSE awards for slain monsters (by HD) and treasure when claimed (1 XP per gp). Magic items: no XP. See [[Burners Experience]] and the table below.

---

## XP Awards

Burners uses OSE XP awards layered on its own level table (see [[Burners Experience]]). Port treasure types and coin values as written; award treasure XP when the haul is **claimed**. Shares: [[Burners Experience]].

| Source | Award |
|---|---|
| **Monster slain** | XP by Hit Dice (table below) |
| **Coins, gems, jewelry** | 1 XP per 1 gp when claimed |
| **Magic items** | 0 XP — the item is the reward |
| **Goods & equipment** | Sale value in gp, when sold |
| **Exploration (optional)** | Small crumb — Referee tunes on the monster XP scale; see [[Burners Experience]] |

Spend banked XP to gain a level only in civilization (see [[Burners Experience]]).

### Monster XP by Hit Dice (OSE)

| HD | XP | HD | XP |
|---|---|---|---|
| under 1 | 5 | 7 | 950 |
| 1 | 10 | 8 | 1,900 |
| 2 | 20 | 9–10 | 2,750 |
| 3 | 60 | 11–12 | 4,500 |
| 4 | 125 | 13–16 | 6,000 |
| 5 | 250 | 17–20 | 8,500 |
| 6 | 500 | 21+ | 10,000+ |

For fractional or special HD, **prefer the monster's printed XP** or the full OSE [Awarding XP](http://oldschoolessentials.necroticgnome.com/srd/index.php/Awarding_XP) table (base + bonus per `*` ability). This short chart is a coarse shortcut — e.g. HD 3 reads **60** here, but an OSE [Wight](http://oldschoolessentials.necroticgnome.com/srd/index.php/Wight) (`3*`) is **50 XP**.

**Converting a module hoard.** Roll or place treasure as OSE directs. Coins, gems, and jewelry pay **1 XP per gp** when **claimed** — left behind grants nothing until claimed. Art objects and mundane goods pay at their sale value when sold. Magic items pay **0 XP**; the item is the reward. Delving retainers: full share if Mustering, half if not (see [[Burners Muster]]). Full procedure: [[Burners Experience]].

---

## Monsters

### The Stat Line

| OSE | Burners |
|---|---|
| **HD** | Level, 1:1 — **HD is the monster's level** and the spine of its pool (one die per HD). **HP: use the printed value** (OSE prints 4.5×HD; Burners 5×HD is the same coin). Roll it or nudge it. |
| **XP** | Award when overcome — **XP by HD** from the table in *XP Awards* (a 1 HD skeleton = 10; HD 2 = 20). Use the module's printed award if given. |
| **AC** | Fold into HP, or Resistance vs weapons if famous for armor — per the table below. Monsters never keep PC AC. |
| **Damage die** | Read as the natural weapon's **slots** — the dice it throws on the Initiative roll, per the rubric below. A monster has no fixed Damage number; it rolls a pool and burns dice like a character. |
| **Saves** | Deleted — route the *ability* through the Defend Router |
| **Morale** | As written |
| **THAC0 / attack bonus** | Deleted — there are no to-hit rolls; the pool carries it |

### AC → HP or Resistance

See [[Burners Principles#Armor and Resistance soak; they never roll]] and [[Burners Referee Guide#Building and Running Monsters]]. **Monsters do not use PC Armor Class.**

Look up the magnitude below (former soak), then pick one lane — do not double-count:

| Lane | When | What you write |
|---|---|---|
| **Fold into HP** (default) | Ordinary hide, leather kit, unclear natural AC | Add **+2 × soak × HD** to HP; no AC, no weapon-Resistance from this AC |
| **Resistance vs weapons** | Famous for armor (knight in plate, dragon scales) | **Resistance** equal to the soak vs weapons; HP stays printed / 5×HD |

Never fold a separate **Resistance** (undead vs blades, magic-to-hit) into HP — that stays as soak with a named weakness.

**Magnitude** (worn kit or odd hide — same bands):

| OSE armor / feel | Soak |
|---|---|
| Unarmored / AC 9–8 [10–11] | 0 |
| Leather / AC 7–6 [12–13] | 1 |
| Gambeson (Burners rung) | 2 |
| Chainmail / AC 5–4 [14–15] | 3 |
| Plate mail / AC 3–2 [16–17] | 4 |
| Field/full plate / AC 1–0 [18–19] | 5 |
| Better than 0 [20+] | 5; excess is usually already **Resistance** |

| OSE AC (descending) | Ascending AC | Soak |
|---|---|---|
| 9–8 | 10–11 | 0 |
| 7–6 | 12–13 | 1 |
| 5–4 | 14–15 | 3 |
| 3–2 | 16–17 | 4 |
| 1–0 | 18–19 | 5 |
| Better than 0 | 20+ | 5+, ask whether the rest is Resistance |

Worked reads: **orc** AC 6 [13] → soak 1, HD 1 → HP = printed (or 5) **+2**. **Skeleton** leather AC → +2 HP; keep blade Resistance separate. **Knight** in plate → Resistance **4** vs weapons, no HP fold. **Dragon** scales → Resistance vs weapons at the soak band.

When a PC **loots** a suit of armor off a foe, that kit becomes ordinary Burners AC for the wearer — the monster never wore it as AC on its block.

### The Damage Die → the Pool

See [[Burners Principles#Pools, not fixed numbers]]. A monster's pool comes from three sources:

- **one die per Hit Die** — HD is the creature's level and the spine of its pool;
- **dice for its weapon's slots** — a held weapon or a natural attack, read from the damage die below;
- **the scene's Heat as dice** — added to the enemy side once, so a swarm does not multiply it.

A monster spends its pool exactly as a character does: each blow is one die, plus one if the weapon is 3+ slots wielded in two hands, and a fierce or many-limbed foe makes extra attacks by its nature — a wolf bites once, a bear claws twice, a hydra strikes per head — the Referee setting how many, not the HD. It defends as anyone does: one die by default, freely once it has made a melee attack this round (see [[Burners Adventure Game]]).

**The damage die sets the weapon's slots** — the dice it throws on the Initiative roll (see [[Burners Arms and Armor]]; Class and Slots are not always the same on that catalog):

| OSE damage die | Weapon slots |
|---|---|
| 1d4 | 1 |
| 1d6 | 2 |
| 1d8 | 3 |
| 1d10 | 4 |
| 1d12, 2d6+ | 5 |

*Check: an orc (HD 1, sword d8) rolls 1 (HD) + 3 (sword) + Heat dice. An ogre (HD 4+2, d10 club) rolls 4–5 (HD) + 4 (club) + Heat — the deep pool that lets it act first and hit hard.*

**Natural attacks are weapons.** The damage die sets the slots exactly as a blade's does, and those dice go into the pool: a wolf's d6 jaws throw 2, a bear's d8 paw 3, an ogre's swat 4. Natural weapons fill no *inventory* slots (a bite can't be dropped or looted) — the slot count is only its dice on the Initiative roll.

**Initiative comes from the pool, not a Class.** Initiative is the count of the creature's dice showing 3 or 4 after each round's Roll Initiative; the Referee locks order for that round — so a bigger pool (more HD, a heavier weapon, hotter Heat) tends to act earlier on its own, and there is no Weapon-Class order to track. The exceptions the old stat blocks flagged still hold, set by fiction:

- **Shambling** *(the sluggish dead, oozes, rooted things)*: **acts last, regardless of its pool.** It still rolls and burns dice normally — a zombie's d8 hands hit like mauls — but its tempo is weather, not speed.
- **A living spear** *(cobra, ambush-hunter)*: acts at the **top of the order regardless of its dice count** — speed and force part ways in a few bodies, and the stat block says so.

**Charge** *(a beast closing at a run — where OSE pounce/leap riders convert)*: a situational bump the Referee adds to the blow — extra dice for the rush, as any situation can add to a blow (see [[Burners Adventure Game]]). This is why the unburdened panther beats the sword line to the strike; **Shambling** things never get it.

**Receive a Charge** *(maneuver — a braced longer weapon, and you must see it coming)*: your thrust strikes **first**, before the rush lands, and the charger's rush-dice add to *your* blow instead — its force arrives through your point. If it survives and presses in, its attack resolves as normal. This is why the boar spear exists; ambush still beats the unwary, because you cannot brace against what you never saw.

**Multi-attack routines** (claw/claw/bite): this *is* the core's "extra attacks by its nature" — the Referee sets how many blows the creature throws (a wolf bites once, a bear claws twice, a hydra strikes per head), each its own blow of its own dice that the target defends against separately. Spread them across several characters, or land them all on one; save the full spread for a foe meant to threaten the whole line.

**Spellcasting monsters:** convert their list through the Spells section, or skip the list and quote each casting as a blow or a telegraph. A dragon does not need a spellbook; it needs a Breath telegraph and two good tricks.

### The Defend Router

An OSE save is a pointer to a Burners subsystem — see [[Burners Principles#Route, don't reinvent]] and [[Burners Principles#Granular defense, not binary save]]. **`2d6 +` the fitting Approach** against the Referee's Cost handles most hazards (see *Approach Roll* in [[Burners Adventure Game]]). Hostile magic uses Fuel Defend against the caster's cast total (see [[Burners Sorcerie]]). Ask what the save protects, then route it:

| OSE says | Burners does |
|---|---|
| **Save vs. Breath** | **Area effect** — see [[Burners Principles#Telegraph the unwinnable]]. |
| **Save vs. Poison (or die)** | **Defend** (Craft) to avoid; **lingering Cost** once it lands. See [[Burners Principles#No instant death]]. |
| **Save vs. Paralysis** | **Defend** (Craft or Sword) at the touch; fall short and you **stiffen** for a stated clock (ghoul-chill, 2d6 rounds) — recoverable, not permanent. |
| **Save vs. Petrify** | **Counting doom**: repeated **Defends** (Craft or Sword), each miss a step toward stone; it recovers. Averting your eyes is the counterplay, at the price of fighting blind. |
| **Save vs. Spells / Wands / Rods / Staves** | Fuel **Defend** vs **cast total**; roll initiative OOC. See [[Burners Principles#Granular defense, not binary save]] and [[Burners Principles#Harm and effect are separate lanes]]. **Ward:** adjacent Sorcerer burns ≤ Sorcerie Level Fuel to cut the attack, then each ally Defends. |
| **Save vs. Death effects** | **Shock Check** and **Wounds**, then post-fight help + Craft survival — see [[Burners Principles#No instant death]] and [[Burners Adventure Game#Wounds]]. |

**Which Approach?** Craft to dodge a dart, pit, or poison; Sword to force a door, hold your feet, or stay conscious; Heart against fear and horror; Sorcerie to dredge up what you know against the uncanny. The player may argue for another Approach if the fiction fits. When in doubt: Craft to avoid, Sword to endure.

### Deriving a Score (when a module needs a raw number)

Burners has no ability scores on the sheet. On the rare occasion a module wants an actual number — an opposed feat of might, a stat-keyed gate — derive one on the fly as **10 + the fitting Approach level**:

| Old score | Approach |
|---|---|
| STR | Sword |
| DEX, CON | Craft |
| WIS, CHA | Heart |
| INT | Sorcerie |

So a Sword 3 stands at an effective 13, a Craft 2 at 12. This is a fallback for the odd direct comparison, not a number to track — most endurance routes through a **Defend (`2d6 +` Approach)** and most contests are a **Pay** or **Deal** roll the same way.

### "Magic Weapons to Hit" → Resistance

See [[Burners Principles#Armor and Resistance soak; they never roll]].

| OSE says | Burners Resistance | The feel |
|---|---|---|
| Silver or magic to hit | **Resistance ~3–4** vs mundane arms; silver (or the named weakness) **bypasses it entirely** | *Resistant.* Soldiers grind it down slowly; a mob still drags it under; the smart play is the weakness. |
| +1 or better to hit | **High Resistance** vs mundane arms — enough that ordinary blows barely tell — bypassed by a legendary/named blade or the stated weakness | *Unearthly.* Mortal steel is folklore against it; the right edge makes it mortal. |
| +2/+3 or better to hit | **Not a bigger number** — the same high Resistance plus a weakness that must be *discovered*, or a fiction gate (*it cannot fall while the phylactery stands*) | *A puzzle wearing a stat.* |

Every Resistance above a point or two **names its cause** — see [[Burners Principles#Armor and Resistance soak; they never roll]]. A named weakness **ignores** Resistance, the way a Bane-forged weapon ignores its quarry's soak (see [[Burners Arms and Armor]]).

**Undead & energy drain** (OSE): **no levels lost.** Any of the Fallen that **wounds** you opens a **Fallen Wound**. Midnight / Purge: husks deepen by **1**; drainers by `1d6` + `1d6` per OSE drain level (wight `2d6`). Immediate Craft survival; die unclean → spawn; die from purge → no spawn. See [[Burners Burn Undead#Fallen Wounds]] and [[Burners Principles#No instant death]].

**Mobs vs. the unearthly:** see [[Burners Principles#Armor and Resistance soak; they never roll]].

---

## Checks, Doors, and Skills

A module check splits two ways. A trained or skilled attempt — thief skills, foraging, listening at doors — becomes **`2d6 +` fitting Approach vs. Heat**, quoted as a **Pay** (the world acts on you — shortfall is the cost) or a **Deal** (you act on it — shortfall is no purchase). A raw attribute check with no skill behind it — bend bars, leap a chasm, stare down a horror — is the same: `2d6 +` Sword, Craft, or Heart vs the Referee's Cost.

| OSE chance | Heat |
|---|---|
| 5-in-6 | 6 |
| 4-in-6 | 7 |
| 3-in-6 | 8 |
| 2-in-6 | 9 |
| 1-in-6 | 10 |

Stuck doors, thief skills, foraging, listening at doors — all this table. A trained Approach shifts the odds; that is the point of being a Burner.

**Traps and environmental damage** — see [[Burners Principles#Pools, not fixed numbers]] (*Traps*). Average the module die to flat Damage; detect or eat.

**Worked in the margin — the OSE zombie** (AC 8 [11] · HD 2 (9hp) · 1 × weapon, 1d8 · Morale 12):

> **Zombie.** HP 9 (as printed; soak 0, no fold) · pool = 2 (HD) + 3 (d8 fists) + Heat dice · **Shambling** — acts last · Morale 12 as written · **XP 20** (HD 2).

Read straight off the printed block — HP (folded if the AC had soak), the two numbers that build its pool, Resistance-if-any, its tempo, its Morale.

---

## Spells

Port OSE spells onto [[Burners Spells]] when a match exists; otherwise write a one-line effect in the same format (`School L: …`).

- **Spell level = cast level SL.** Hand holds prepared cards; Arcana slot count sets hand size; drip rides in Arcana slots at full item cost. Sleep recovers up to caster Level cards (untap/burn/lasting); redraw or one-hour swap needs a readable source.
- **Durations and ranges as written** — the clocks match.
- **Casting (combat):** one Action; burn at least SL Fuel dice, roll them — cast total = sum of faces. Tap the card. On a Spark, Fuel it with one or more additional Fuel dice, up to SL, for extra effect; unfueled, it fades. May burn ready cards in the same Action to recast or copy.
- **Casting (NPC / module caster):** roll at least **SL Fuel dice** for the cast total the same way. A hostile cast **rolls initiative** if no fight is underway.
- **Defense and damage:** see [[Burners Principles#Granular defense, not binary save]] and [[Burners Principles#Harm and effect are separate lanes]]. Ignore OSE per-caster-level dice and fixed damage lines; overrun to HP 1:1. *Save for half* does not port.
- **Scrolls** require a **Sorcerer** (or Journeyman + Canting for Canting) — single-use items, any form; not cards (see [[Burners Sorcerie]]).

---

## Magic Items

Potions, rings, cursed items, and wondrous items port **as written** — they are fiction plus a rule, and the fiction is the value. **Magic items grant no XP**; the item is the reward (see *XP Awards*). Wands and staves that fit **Wizard Drip** ride in Arcana slots at full slot cost (finds, not shop goods — see [[Burners Sorcerie]]); they do not add hand cards. Item powers run as magic items, or for a one-off keep charges as a simple budget.

### +n Arms, Shields, and Armor → Enchanted + Powers

Convert *+1 sword*, *+2 shield*, *+1 plate*, and so on per [[Burners Referee Magic Items]] — extra die, +n powers, Tuned / Bane / relic ladders, and the OSE power menus all live there. Trait for the extra die: [[Burners Adventure Game#Enchanted Arms and Armor]]. Keep Slots, AC, and size as the mundane piece.

Potions, rings, and wondrous items stay as written above. Do not raise AC or size for a plus.

---

## Watchpoints

- **Lethality is comparable** — B/X at low levels is brutal and Burners characters are lean. Large mobs can spike past any defend; use swarm splitting and chokepoints.
- **Foreshadowing is mechanical** — see [[Burners Principles#Heat is scene pressure]].
- **Solo bosses** need HP enough to survive the party's first-round burst, or they die before their first telegraph.
- **Don't double-count dread** — see [[Burners Principles#Heat is scene pressure]].

---

> *Read the stat block once, write it in the margin — HP (folded AC if any), the pool (HD + weapon slots), Resistance-if-any, XP by HD — route the saves through Defend, and run it.*
