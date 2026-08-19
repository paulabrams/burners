---
title: "Burners — Sorcerer Casts, Defend Caps, Double Down, Targets"
status: proposed — not yet in the rules; playtest before folding in
---

# Sorcerer Casts, Defend Caps, Double Down, Targets

Four linked rules mods. The fighter stops being the party's only soak, and the mage
stops waiting on a 6 to do anything interesting. Spark stays an opening in the steel;
a working's width is something you buy. #needs-playtest

---

## The rules

### 1. Sorcerer Casts

As a Sorcerer you may work more than once: **one extra spell per Sorcerie level**. At
Sorcerie 1 you cast two. At Sorcerie 3 you cast four. Each is its own working of its
own Fuel, all inside your single Cast action.

- The count is workings, not a sum of levels — the exact mirror of Veteran Attacks.
- Each working still burns at least its level (SL) in Fuel dice — and still **taps its
  card from your hand**. The hand is the real limitation: Fuel refills every round, but
  a multi-cast round taps cards you will not have ready again without burns or sleep.
  The count keeps a fat pool from dumping six 1sts; the hand keeps every round from
  being a multi-cast.
- Recasts and copies from Burning each take a slot in the count.
- **Canting:** Journeymen stay at one working per Cast unless ruled otherwise.

### 2. Defend caps by what you hold

**Melee:** one die, **plus the best one of**:

| In hand | Extra dice | Total |
| --- | --- | --- |
| melee weapon | +1 | 2 |
| shield | +2 | 3 |
| magic shield (trained only) | +3 | 4 |

- **Best of, never stacked.** Sword-and-board Defends as the shield (3). A two-hander
  Defends as the weapon (2) — it hits with two dice but no longer dumps the pool.
- **Replaces** "no limit if you made a melee attack this round." Whether you swung is
  irrelevant; what you hold is the gate.
- A dagger in the mage's hand is +1 even on a round they Cast.
- **Missile:** unchanged — 1 die, or 2 with Cover.
- **Hostile magic:** unchanged — **no limit**. This is the save system; there is no AC
  against a charm. (Considered and rejected: 1 die +1 Arcana +2 school — caster kit
  should not gate a fighter's resistance. If a cap is ever wanted, tie it to character
  level, not kit.)
- **In the dirt:** same caps, all Fuel burned re-rolls, as ever.
- Block still redirects one blow onto the Blocker, who Defends under their own cap.

### 3. Double Down

You may pour **two of your castings into one card**: burn **double the spell's level**
in Fuel, and the working exceeds its text — **one step wider**, not the next spell up
the list. Still the same card, the same level. **Once per working.**

What the double buys:

- **A spell that targets no one** (a placed web, an ice sheet, a fog) may now affect
  **one creature directly** — the first target rides the double.
- **A spell that already targets** goes one step wider — more of what it already does
  (Referee's call on what "wider" is).

Notes:

- Replaces Spark-to-broaden. A 6 on a cast just counts on the total; the Spark options
  are the steel ones (Flurry, Impale, Sever, Man-handle, Counterattack).
- The level never changes: Ward Pact still sees a 1st-level working, dispel-by-level
  unchanged, fumbles read the dice as ever (more dice = more 1s = the price of ambition).
- Sibling of **Copy** in Burning: Copy pays a card for a second working; Double Down
  pays a second casting for one wider working.
- At Sorcerie 1 a doubled-down working is the whole Cast action — the apprentice going
  for the pin is all-in (same shape as a Sword 1 Veteran putting both attacks into one
  two-handed swing).
- **Term:** *double down* — gambling register matches the game's voice ("what will you
  burn?") and the name carries the price. Runner-up: *stoke* (fire family with Burn /
  Fuel / Spark, but hides the cost). Rejected: *mirror* (collides with Copy and with
  Illusione), *twin* (D&D metamagic baggage, implies exactly two targets).

### 4. Targets: unnamed is none

If a spell does not name a creature — or a count of them — it is **placed in the
world and catches no one**. To affect a creature directly you must **Double Down**;
that buys the first target. **Each additional creature is one extra Fuel die**; those
dice land in the **cast total**. The Referee may grant **free Defend dice** when the
target is a poor match for the working (an ogre against a web; bronze in the water —
same move as Man-handle's free dice).

- "Names a creature" includes *a creature*, *the target*, *Sorcerie creatures* — not
  only a numeral. Command, Healing Touch, Wizard Light on eyes are unaffected.
- Web Weave as written does not pin a sword-arm — that is a Double Down, and at
  Sorcerie 1 it is the caster's whole Action.
- Extra-target dice ride the same cast total — and raise the fumble odds. Targets
  Defend as ever.

### How they spend together

Sorcerie 1, budget two castings: two 1sts, or one doubled-down 1st. Web Weave doubled
down pins one sword-arm — 2 castings, 2 Fuel; a second body is +1 die (3 Fuel), whole
Action. The fighter with a heater soaks at 3 dice and cannot empty the pool just
because he swung; the mage with a spear soaks at 2 without asking for a Block.

## Open questions

- Does a caster get any Spark option at all now, or is a 6 on a cast just a 6?
- Does the enchanted-item extra die (Enchanted Arms and Armor) stack on top of the
  Defend cap? Lean yes — that is what the Trait bought. A magic weapon does not count
  as a magic shield.
- Should Canting Journeymen ever multi-cast (Craft mirroring Sorcerie)?
- Sim re-run required — five-orc knife-edge and front-line numbers all assumed
  unlimited-after-melee.

---

## Change list — every edit these mods require

Line numbers are as of 2026-08-16; section names are the durable anchors.

### markdown/burners-adventure-game.md

1. **Glossary — Defend** (line 144): replace the caps clause. New: "Caps: melee 1 die
   +1 melee weapon / +2 shield / +3 magic shield (trained only) in hand, best one;
   missile 1 die (2 with Cover); hostile magic no limit." Delete "(no limit if you
   meleed this round)".
2. **Glossary — Cast / Ward (Sorcerer)** (line 148): add the casts-per-Action count
   ("one extra spell per Sorcerie level"), the Double Down one-liner, and the targets
   rule pointer. Keep Ward as written.
3. **Glossary — Attack** (line 138): unchanged, but add a sibling sentence or entry
   for Sorcerer casts if the glossary should mirror ("With Sorcerie, you cast an extra
   spell per Sorcerie level, all burning Fuel").
4. **Veteran Attacks** (line 677): add the parallel **Sorcerer Casts** paragraph
   directly after it (or in the Magic section, line ~721, with a cross-reference).
5. **Defending** (line 679): rewrite the caps sentence; delete "or no limit if you
   made a melee attack this round (any foe)"; delete the closing sentence "If you're
   the archer or mage caught in reach without having meleed, you cut each melee blow
   with a single die" (obsolete — the cap no longer keys off having meleed). Keep the
   in-the-dirt, Spark-Counterattack, and hostile-magic clauses.
6. **Ogre example** (lines 630–631): rewrite. "He has meleed this round, so… Defends
   without limit" becomes sword-and-shield = 3 dice; redo the arithmetic of both
   paragraphs (the war-of-attrition coda also leans on unlimited Defend).
7. **Dirty-fighting example** (line 681): rewrite. "already meleed, so he may Defend
   without limit… dumps three dice" — with arming sword + rotella he caps at 3, which
   still fits, but the stated justification must change from "meleed" to "shield in
   hand."
8. **Magic summary** (line ~721): add casts-per-Action and Double Down to the two-line
   summary that points at Burners Sorcerie.

### markdown/burners-sorcerie.md

1. **Intro** (lines 22–24): "a combat cast is one Action that burns at least SL Fuel"
   — extend: one Action may hold up to 1 + Sorcerie workings.
2. **The cast** (lines 224–236): add the count of workings per Action; add the
    extra-target die to step 2 (those dice join the cast total); note that direct
    effect from a placement working requires a Double Down.
3. **When a cast Sparks** (lines 238–240): **retire**. Replace with **Double Down** as
    a deliberate purchase (double SL Fuel + two castings, once per working; buys direct
    effect on one creature, or one step wider). State plainly: a 6 on a cast counts on
    the total and nothing more (pending the open question).
4. **Burning** (lines 249+): note Double Down beside Recast/Copy — all three live in
    the same Cast action and each takes slots in the casting count.
5. **Defending against a spell** (lines 571–598): cast total definition (line 577)
    gains "plus one die per additional target"; area workings line 598 ("each target
    Defends separately") needs the placement-vs-direct-target distinction (placement
    catches no one without a Double Down).
6. **Sorcerie level table** (lines 602–606): row 1+ / Higher — add "castings per
    Action = 1 + Sorcerie."

### markdown/burners-spells.md

 1. **Reading the catalog** (lines 33–43): add a **Targets** bullet — unnamed = placed,
    catches no one; direct effect is a Double Down (first target included); each
    additional creature +1 die; Referee free Defend dice for poor matches. The existing
    scope line ("the text is the scope") already carries half of this.
 2. Spell entries themselves: no text changes — Web Weave, Adhere, Grease-alikes stay
    placement wordings on purpose; spells that already name counts (*Sorcerie
    creatures*, *one animal*, *a creature's eyes*) are already priced.

### markdown/burners-magic-examples.md

 1. **Header — Combat engine bullet** (lines 20–23): "extra Fuel past SL buys nothing
    there" now has two named exceptions: Double Down and extra-target dice.
 2. **Web Weave** (lines 180–187): rewrite the Combat bullet. "Shooting the web at a
    creature is hostile — it Defends" becomes: placement is 1 Fuel and catches no one;
    catching a body is a Double Down (2 castings, 2 Fuel at SL 1); a second body +1
    die; the ogre gets free Defend dice.
 3. **Adhere** (lines 191–196): Combat bullet — sticking a foe's boots to the
    flagstones is direct effect on a creature: a Double Down. Same pattern anywhere
    else an example casts a placement working on a body (sweep the whole file:
    Ice/Grease-alikes at lines ~170–178, Force Push, Filch are contested-object casts
    and likely fine).
 4. **Sleeping Fog** (line ~315): already says "targets nobody and allows no Defend" —
    confirm it reads as the general rule now, not a special case.

### markdown/burners-examples-of-play.md

 1. **Skirmish sidebar** (line 124): defense-caps summary line — same rewrite as the
    glossary.
 2. **Brand defends** (line 93) and **Sefa defends** (line 171): "has not meleed → one
    die" becomes hold-based (Brand's spear = 2 dice; Sefa's knife = 2 dice) — redo the
    arithmetic and the HP outcomes.
 3. **Kragg** (line 95): "having meleed, he Defends without limit" — two-handed axe
    caps at 2 dice; redo.
 4. **Ilsa casts Adhere on the wight / sharper** (lines 99, 173): each is direct effect
    on a creature — a **Double Down** (2 castings, 2 Fuel at Sorcerie 1: her whole
    Action). Her Fuel ledger and turn structure change. Line 173's Spark-Fuel ("glue
    catches the other wrist too") is the retired Spark-broaden — it becomes the +1-die
    second target on that doubled-down cast.
 5. **Round summary** (line 126): "one Fuel die for the cast total" — update for
    Double Down and the extra-target die.

### markdown/burners-referee-guide.md

 1. **Mobs / focus fire** (line 311): "Once Aldric has meleed this round he Defends
    without limit against all of them; until then each blow is one die" — rewrite to
    the hold-based cap (each blow Defended separately under the same cap; a shield
    matters, swinging first does not).
 2. **Cover, Sparks, and shooting into the press** (lines 335–341): unchanged —
    confirm no melee-cap language leaks in.

### markdown/burners-ose-conversions.md

 1. **Casting (combat)** (line 199): delete "On a Spark, Fuel it with one or more
    additional Fuel dice, up to SL, for extra effect; unfueled, it fades." Replace
    with the Double Down one-liner and the extra-target die; add casts-per-Action.
 2. **The Defend Router / saves table** (lines ~187–190): confirm no melee-cap
    language; "Save vs. spell — Fuel Defend vs cast total" is unchanged.
 3. **Watchpoints** (line 220): "Large mobs can spike past any defend" — still true,
    truer now; optionally note the caps make chokepoints and shields matter more.

### markdown/burners-principles.md

 1. **Granular defense, not binary save** (lines 26–36): no rule text change, but the
    in-combat bullet may deserve one clause naming the hold-based cap so the principle
    page matches the procedure it cites.
 2. **Sweet and Spicy vs Spark** (lines 93–97): "Combat cast fumbles… key off Fuel
    faces (1s / Sparks)" — drop the Spark half for casts once Spark-broaden is
    retired; fumbles still key off 1s.

### markdown/burners-arms-and-armor.md

 1. **Shields section**: add the Defend bonus (+2, +3 magic trained-only) beside the
    existing slots/Cover text. **Cutty / Stabbity** Spark riders (lines 160, 170) are
    attack Sparks — unchanged.

### markdown/burners-referee-magic-items.md

 1. **Enchanted shields**: state whether the enchanted extra die stacks on the +3
    magic-shield cap or is the thing that makes a shield "magic" for the cap (open
    question above — resolve before folding in).

### sims/

 1. **sims/sim.py**: defend logic implements "without limit after any melee this
    round" — reimplement hold-based caps (weapon/shield per PC loadout); Senna/Pip
    loadouts now matter to their soak. Re-run baselines.
 2. **sims/combat-sim.md**: header (line 4) and rules-summary (line 102) name the old
    cap; every table regenerates. Watch the five-orc knife-edge and the front-line
    margin — Block economy changes when the Blocker caps at 3.

### No changes needed

- **burners-muster.md, burners-equipment.md, burners-experience.md,
  burners-ancestry.md, burners-invocations.md, burners-burn-undead.md** — no Defend-cap
  or cast-procedure text found.
- **experiments/burners-monster-stacks.md, burners-turn-tracker.md,
  burners-cracked.md** — monster-side only.
