---
title: "Burners — Defend Caps by What You Hold"
status: proposed — not yet in the rules; playtest before folding in
---

# Defend Caps by What You Hold

Melee Defend is capped by kit in hand, not by whether you swung this round. The
fighter stops being the party's only soak: party members are more survivable and
self-reliant, so fighters don't have to Block to save them from everything — and a
fighter can no longer out-spend attacks simply by having meleed. **Juke** rides a
physical blow the way Ward rides magic — not an Action, one extra die past the kit
cap. Proposed alongside the Sorcerer mods in [[burners-sorcerer-casts]]. #needs-playtest

---

## The rule

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
- **Enchanted kit:** only the enchanted shield extends the cap, and you must have the
  Trait — that is the +3 row. The enchanted extra die (Enchanted Arms and Armor) does
  not stack on top of it, and a magic weapon never extends the Defend cap: its extra
  die is for the Initiative pool and the blow.

The fighter with a heater soaks at 3 dice and cannot empty the pool just because he
swung; the mage with a spear soaks at 2 without asking for a Block.

## Juke — a Ward for steel

**Juke** is not your Action. It rides the incoming **physical** blow (melee or missile,
not fire, not a spell), the way **Ward** rides hostile magic.

- Tap the card. Burn at least SL Fuel as they swing. That Defend may burn **one extra
  Fuel die** beyond the kit cap (dirty fighting). You still pay the normal Defend; the
  extra die rides a Defend you were paying for anyway.
- Does **not** cut the incoming number first — that is Ward's math. Juke only raises
  **your** cap by one: weapon 2→3, shield 3→4, Cover 2→3, bare 1→2.
- Canting card, so a Journeyman who cannot Ward still has a ride on the knife. A
  Sorcerer who also Canting may have both.
- Under the hold-based cap this is no longer a trap. Swinging does not open unlimited
  Defend, so the extra die is real — including before you have gone this round.

## Wizard defense under the caps

**Ward Pact** (Sorcerie 1) is the wizard's armor and shield — settled, entry updated
in [[Burners Spells]]. Against the **named source only**: counts as **leather armor**
(soak 1, the better of ward or worn AC, not both) and as a **shield** (Defend those
blows with **two dice**). Flat — it is only a 1st-level spell; no scaling by Sorcerie.
The ready-time naming stays: it is the hedge that makes the spell a pact and not plate.

Note the seam with the cap table: the pact's two dice equal the *weapon* tier, one
under a steel shield in hand (3). Deliberate — decide at playtest whether the Mage
Shield should instead read "counts as a shield in hand" (cap 3).

Rejected along the way: a slot-occupying "Ward Harness" (phantom armor at real armor's
AC and slot cost — the armor spell should not eat Arcana / Sorcerie slots); per-blow
Fuel to apply the soak (armor's identity is free soak; would blur into the **Ward**
combat rule); soak scaling by Sorcerie (half or full — plate-grade mages).

Do **not** expand the Ward combat rule to steel — Ward is magic-only on purpose; a
steel Ward would make the mage the party's soak and reverse this mod's fix.

## Open questions

- Sim re-run required — five-orc knife-edge and front-line numbers all assumed
  unlimited-after-melee.
- ~~Ward Pact damage reduction~~ **Resolved:** flat leather (soak 1) + shield (two
  dice) vs the named source; no scaling, no slot cost, no per-blow Fuel, no stacking
  with worn AC (see *Wizard defense under the caps*). Playtest whether the shield
  benefit should be the full shield-in-hand cap (3) instead of two dice.
- Juke vs a bundle: one extra die on **that** blow, or does one tap cover the
  round? Lean: that blow. The card is the scarcity.
- Does Juke work on Man-handle / Constrict (physical, not HP)? Lean yes — it is a
  Defend. Fire and spells stay out.

---

## Change list — every edit this mod requires

Line numbers are as of 2026-08-16; section names are the durable anchors.

### markdown/burners-adventure-game.md

1. **Glossary — Defend** (line 144): replace the caps clause. New: "Caps: melee 1 die
   +1 melee weapon / +2 shield / +3 magic shield (trained only) in hand, best one;
   missile 1 die (2 with Cover); hostile magic no limit." Delete "(no limit if you
   meleed this round)".
2. **Defending** (line 679): rewrite the caps sentence; delete "or no limit if you
   made a melee attack this round (any foe)"; delete the closing sentence "If you're
   the archer or mage caught in reach without having meleed, you cut each melee blow
   with a single die" (obsolete — the cap no longer keys off having meleed). Keep the
   in-the-dirt, Spark-Counterattack, and hostile-magic clauses. After **Ward**, add a
   sibling one-liner: Juke rides a physical blow (pointer to the spell).
3. **Ogre example** (lines 630–631): rewrite. "He has meleed this round, so… Defends
   without limit" becomes sword-and-shield = 3 dice; redo the arithmetic of both
   paragraphs (the war-of-attrition coda also leans on unlimited Defend).
4. **Dirty-fighting example** (line 681): rewrite. "already meleed, so he may Defend
   without limit… dumps three dice" — with arming sword + rotella he caps at 3, which
   still fits, but the stated justification must change from "meleed" to "shield in
   hand."
5. **Enchanted Arms and Armor** (line ~490): "one extra die when that item is the
   thing in play (Initiative pool and on the blow, Defend, or Block)" — narrow it: the
   extra die rides the Initiative pool and the blow; on Defend, only an enchanted
   **shield** (with its Trait) extends the cap, as the +3 row. A magic weapon never
   extends the Defend cap.

### markdown/burners-examples-of-play.md

1. **Skirmish sidebar** (line 124): defense-caps summary line — same rewrite as the
   glossary.
2. **Brand defends** (line 93) and **Sefa defends** (line 171): "has not meleed → one
   die" becomes hold-based (Brand's spear = 2 dice; Sefa's knife = 2 dice) — redo the
   arithmetic and the HP outcomes.
3. **Kragg** (line 95): "having meleed, he Defends without limit" — two-handed axe
   caps at 2 dice; redo.

### markdown/burners-referee-guide.md

1. **Mobs / focus fire** (line 311): "Once Aldric has meleed this round he Defends
   without limit against all of them; until then each blow is one die" — rewrite to
   the hold-based cap (each blow Defended separately under the same cap; a shield
   matters, swinging first does not).
2. **Cover, Sparks, and shooting into the press** (lines 335–341): unchanged —
   confirm no melee-cap language leaks in.

### markdown/burners-ose-conversions.md

1. **The Defend Router / saves table** (lines ~187–190): confirm no melee-cap
   language; "Save vs. spell — Fuel Defend vs cast total" is unchanged.
2. **Watchpoints** (line 220): "Large mobs can spike past any defend" — still true,
   truer now; optionally note the caps make chokepoints and shields matter more.

### markdown/burners-principles.md

1. **Granular defense, not binary save** (lines 26–36): no rule text change, but the
   in-combat bullet may deserve one clause naming the hold-based cap so the principle
   page matches the procedure it cites.

### markdown/burners-spells.md

1. **Juke** (line 635): rewrite. "Not your Action — rides the incoming physical blow,
   like Ward. Burn at least SL Fuel as they swing; that Defend may burn one extra Fuel
   die beyond the kit cap." Keep #needs-playtest until play.

### markdown/burners-magic-examples.md

1. **Juke** (lines 393–397): Combat bullet — not your Action; spend it as the bravo's
   knife comes in; extra die past the kit cap, riding a Defend you were paying for
   anyway.

### markdown/burners-arms-and-armor.md

1. **Shields section**: add the Defend bonus (+2, +3 magic trained-only) beside the
   existing slots/Cover text. **Cutty / Stabbity** Spark riders (lines 160, 170) are
   attack Sparks — unchanged.

### markdown/burners-referee-magic-items.md

1. **Enchanted shields**: state the ruling — the enchantment (with its Trait) is what
   makes a shield "magic" for the +3 cap; no extra die stacks on top of it, and
   enchanted weapons never extend the Defend cap.

### sims/

1. **sims/sim.py**: defend logic implements "without limit after any melee this
   round" — reimplement hold-based caps (weapon/shield per PC loadout); Senna/Pip
   loadouts now matter to their soak. Re-run baselines.
2. **sims/combat-sim.md**: header (line 4) and rules-summary (line 102) name the old
   cap; every table regenerates. Watch the five-orc knife-edge and the front-line
   margin — Block economy changes when the Blocker caps at 3.

### No changes needed

- **burners-muster.md, burners-equipment.md, burners-experience.md,
  burners-ancestry.md, burners-invocations.md, burners-burn-undead.md** — no
  Defend-cap text found. **burners-sorcerie.md** Ward short form stays; Juke lives
  on the spell card.
- **experiments/burners-monster-stacks.md, burners-turn-tracker.md,
  burners-cracked.md** — monster-side only.
