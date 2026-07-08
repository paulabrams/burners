---
layout: default
title: "Burners Spells"
---

# Wåndyr 2 — Spells (v1.4 Schools, Knave-Style)

*Canonical spell list for **Burners Adventure Game.md** (the *Magic* section). All **252** spells from *Wåndyr v1.4* (7 schools, 6 spell levels × 6 spells each), each with a **fixed effect block** — no "say what you want it to do." Power scales with **Sorcerie** (your Sorcerie Approach level), replacing Knave's INT.*

*Companion: [[Burners Adventure Game]] (HP, Wounds, combat) · [[Burners Adventure Game]] (Magic: Arcana, muster, casting). OSE reference list: [[Wandyr2SpellList]] (optional cross-check).*

---

## How to read a spell

| Field | Meaning |
| --- | --- |
| **Code** | `L.n` — the spell's **level** (L, 1–6) and its slot (n, 1–6) within that level |
| **Lv** | **Spell level** (1–6) — prep cost in Arcana capacity; the same as the code's first number |
| **School** | Magic school (must know the school's Secret or spellbook entry) |
| **Tags** | dmg · ctrl · ward · info · util · summon |
| **Roll** | Casting roll if not Plan A — **Sword** in combat, **Sorcerie** out, **Craft** for Canting |
| **Save** | Target contest — usually **`2d6 + Sorcerie`** (or Sword / Heart as noted) |
| **Effect** | **This is the spell.** Do not expand scope beyond the text. |

### Codes and spell level

Each school lists six spells at every spell level, 1 through 6. A code `L.n` is the spell's level L and its slot n within that level — so `1.3` is the third first-level spell, `4.2` the second fourth-level spell. Prep cost is the level, the code's first number.

Levels were assigned by **scope and punch** (OSE / B/X yardstick), then the catalog was balanced to exactly six spells per level in each school.

### Sorcerie scaling

**Sorcerie** in an effect = your **Sorcerie Approach level** (Traits ÷ 4). At **Sorcerie 1**, `Sorcerie creatures` means 1 creature, `Sorcerie × 10'` means 10', etc. Minimum 1 where a count is implied.

You must be a **Sorcerer (Sorcerie 1+)** to cast. See *Magic* in [[Burners Adventure Game]].

### Universal Wandyr adaptations

- **Damage** — **spell level (L)** sets dice (*Spell damage rubric* in [[Burners Adventure Game]]). **Sorcerie** scales utility in the effect text, not direct damage. In combat, a cast spends **L dice from your Fuel** and the target **defends with dice**; the dice you spend do **not** add to the damage.
- **Control** (charm, sleep, fear, command…) → works like damage to HP, ignoring Resistance; if cast **≥ target's current HP**, the control **grabs** (*Burners Adventure Game*).
- **Armor** does not help vs pure magic unless the effect is physically substantive (then AC applies).
- **Forget-on-cast** — spell leaves your Arcana until next muster.
- **Wound work:** *Healing Touch* (Vitae, **level 1**, code 1.4) closes limb wounds; for **open vital wounds**, use a **Wound Check** — campaign name **Stanch** (same level).

### Canting

Canting spells roll **Craft** instead of Sorcerie when a roll is needed. **Journeyman (Craft 1+)** or **Sorcerer** may prep and cast them through Arcana (*Magic* in [[Burners Adventure Game]]).

---


## Vitae

Life force, growth, and harmony. The magic of the Elves, written in living ink that grows and changes like vines.

### 1st level spells

| Code | Spell             | Tags |
| ---- | ----------------- | ---- |
| 1.1  | Animal Bond       | util |
| 1.2  | Animal Friendship | ctrl |
| 1.3  | Beast Speech      | info |
| 1.4  | Healing Touch     | util |
| 1.5  | Joy Song          | util |
| 1.6  | Light Shield      | ward |

#### Animal Bond — level 1 (code 1.1)

*v1.4 tagline: form lasting connection*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Touch one animal; it regards you as a trusted companion for Sorcerie months. It will not obey suicidal orders. Re-casting on the same animal extends the bond.

#### Animal Friendship — level 1 (code 1.2)

*v1.4 tagline: benevolent control*

**Tags:** ctrl · **Roll:** Sorcerie · **Save:** Sorcerie

**Effect:** Animals obey your orders as well as a trained dog for one day.

#### Beast Speech — level 1 (code 1.3)

*v1.4 tagline: talk with animals*

**Tags:** info · **Roll:** Plan A · **Save:** none

**Effect:** You understand and speak with animals for Sorcerie hours. They do not obey unless persuaded (Heart) or befriended.

#### Healing Touch — level 1 (code 1.4)

*v1.4 tagline: cure wounds*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Touch a willing creature — restore **1d6 HP**, or close one **open limb wound** (not vital). Does not auto-close vital wounds. *Campaign alias: **Mend**.*

#### Joy Song — level 1 (code 1.5)

*v1.4 tagline: lift spirits*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Sorcerie listeners shake off fear or despair; each recovers 1 HP if they have at least 1 HP. Lasts one scene.

#### Light Shield — level 1 (code 1.6)

*v1.4 tagline: protect from evil*

**Tags:** ward · **Roll:** Sorcerie · **Save:** none

**Effect:** One creature; evil-aligned attacks against them suffer −1 Damage for Sorcerie turns; charm/possession from evil fails on Sorcerie 1+ targets automatically vs weak evils.

### 2nd level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 2.1 | Balance Weave | util |
| 2.2 | Beast Bond | util |
| 2.3 | Beast Form | util |
| 2.4 | Divine Grace | ward |
| 2.5 | Growing Script | util |
| 2.6 | Life Bloom | util |

#### Balance Weave — level 2 (code 2.1)

*v1.4 tagline: unite opposites*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** For Sorcerie hours, two opposed forces within 10' (heat/cold, light/dark, poison/antidote) neutralize each other at the midpoint.

#### Beast Bond — level 2 (code 2.2)

*v1.4 tagline: create long-lasting bond*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** As Animal Bond, but permanent until the animal dies or you release it. One bond active at a time per caster.

#### Beast Form — level 2 (code 2.3)

*v1.4 tagline: friendly transformation*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** You and your possessions turn into an animal for up to Sorcerie days.

#### Divine Grace — level 2 (code 2.4)

*v1.4 tagline: channel blessing*

**Tags:** ward · **Roll:** Sorcerie · **Save:** none

**Effect:** One ally gains +1 on their next Sorcerie roll or Wound Check within Sorcerie hours (blessing, not stacking).

#### Growing Script — level 2 (code 2.5)

*v1.4 tagline: living magical writing*

**Tags:** util · **Roll:** Plan A · **Save:** none

**Effect:** Living text grows on a surface for Sorcerie days; only readers of Vitae (or Read Magic) can read it.

#### Life Bloom — level 2 (code 2.6)

*v1.4 tagline: encourage growth*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Plants within Sorcerie × 10' obey you. They move 5' per round.

### 3rd level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 3.1 | Forest Touch | info |
| 3.2 | Pacify | ctrl |
| 3.3 | Star Guide | info |
| 3.4 | Sun Beam | dmg |
| 3.5 | Thicket | util |
| 3.6 | Truth Sight | info |

#### Forest Touch — level 3 (code 3.1)

*v1.4 tagline: speak with plants*

**Tags:** info · **Roll:** Sorcerie · **Save:** none

**Effect:** Plants within Sorcerie × 10' obey you. They move 5' per round.

#### Pacify — level 3 (code 3.2)

*v1.4 tagline: remove violence*

**Tags:** ctrl · **Roll:** Sorcerie · **Save:** Sorcerie

**Effect:** Sorcerie creatures develop an intense hatred of violence unless attacked.

#### Star Guide — level 3 (code 3.3)

*v1.4 tagline: find true path*

**Tags:** info · **Roll:** Plan A · **Save:** none

**Effect:** For Sorcerie hours you know the true direction to one named place you have visited before.

#### Sun Beam — level 3 (code 3.4)

*v1.4 tagline: channel daylight*

**Tags:** dmg · **Roll:** Sorcerie · **Save:** Sword

**Effect:** A beam of daylight (torch-bright, 60' radius) for Sorcerie turns; shadow creatures in it take **1d6** per round to HP (− Resistance). (shadow creatures only).

#### Thicket — level 3 (code 3.5)

*v1.4 tagline: grow healthy plants*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** A thicket of trees and dense brush up to Sorcerie × 40' wide sprouts up over the course of one round.

#### Truth Sight — level 3 (code 3.6)

*v1.4 tagline: see through lies*

**Tags:** info · **Roll:** Sorcerie · **Save:** none

**Effect:** You can detect lies for Sorcerie hours.

### 4th level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 4.1 | Heart Glyph | util |
| 4.2 | Peace Aura | ctrl |
| 4.3 | Purification | util |
| 4.4 | Snail Knight | summon |
| 4.5 | Ward | ward |
| 4.6 | Wild Empathy | info |

#### Heart Glyph — level 4 (code 4.1)

*v1.4 tagline: inscribe emotions*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Inscribe an emotion on a willing creature for Sorcerie days; those who read the glyph feel it (not control).

#### Peace Aura — level 4 (code 4.2)

*v1.4 tagline: calm violence*

**Tags:** ctrl · **Roll:** Sorcerie · **Save:** Sorcerie

**Effect:** Sorcerie creatures develop an intense hatred of violence unless attacked.

#### Purification — level 4 (code 4.3)

*v1.4 tagline: remove toxins*

**Tags:** util · **Roll:** Plan A · **Save:** none

**Effect:** Purify Sorcerie × 10' of food, water, or air of mundane toxins.

#### Snail Knight — level 4 (code 4.4)

*v1.4 tagline: summon noble mount*

**Tags:** summon · **Roll:** Sorcerie · **Save:** none

**Effect:** In 10 minutes, a knight atop a giant snail rides into view. He may aid you for Sorcerie days if he finds you worthy. The snail cannot move faster than a walk.

#### Ward — level 4 (code 4.5)

*v1.4 tagline: create protective barrier*

**Tags:** ward · **Roll:** Sorcerie · **Save:** none

**Effect:** A silver circle 40' across appears on the ground around you. Until you leave the circle, Sorcerie types of things that you name cannot cross it.

#### Wild Empathy — level 4 (code 4.6)

*v1.4 tagline: share animal feelings*

**Tags:** info · **Roll:** Plan A · **Save:** none

**Effect:** For Sorcerie hours, sense the surface feelings of animals within 120'.

### 5th level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 5.1 | Cure Disease | util |
| 5.2 | Nature's Blessing | ward |
| 5.3 | Nature's Rhythm | util |
| 5.4 | Pack Call | summon |
| 5.5 | Regeneration | util |
| 5.6 | Vital Surge | ward |

#### Cure Disease — level 5 (code 5.1)

*v1.4 tagline: remove ailments*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Touch one creature; one mundane disease or poison cycle ends. Magical afflictions need Sorcerie vs Guide DC.

#### Nature's Blessing — level 5 (code 5.2)

*v1.4 tagline: enhance vitality*

**Tags:** ward · **Roll:** Sorcerie · **Save:** none

**Effect:** One creature gains +Sorcerie max HP until next muster (cannot exceed HP + Sorcerie).

#### Nature's Rhythm — level 5 (code 5.3)

*v1.4 tagline: align with cycles*

**Tags:** util · **Roll:** Plan A · **Save:** none

**Effect:** For Sorcerie hours, party ignores mundane travel fatigue Costs (Journeyman effects still stack).

#### Pack Call — level 5 (code 5.4)

*v1.4 tagline: summon animal allies*

**Tags:** summon · **Roll:** Sorcerie · **Save:** none

**Effect:** Summon Sorcerie loyal beasts (HD 1 each) from the wild; they serve for one day then leave.

#### Regeneration — level 5 (code 5.5)

*v1.4 tagline: speed natural healing*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** One creature heals 1 HP at the end of each World Turn for Sorcerie hours (does not close wounds).

#### Vital Surge — level 5 (code 5.6)

*v1.4 tagline: boost life force*

**Tags:** ward · **Roll:** Sorcerie · **Save:** none

**Effect:** Touch one creature — they gain Sorcerie temporary HP (lost first); fades at next muster.

### 6th level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 6.1 | Life Transfer | util |
| 6.2 | Nature's Bounty | util |
| 6.3 | Perfect Unity | ward |
| 6.4 | Season's Call | util |
| 6.5 | Tranquil Heart | ctrl |
| 6.6 | Vital Harmony | util |

#### Life Transfer — level 6 (code 6.1)

*v1.4 tagline: share vital force*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** You and one willing creature split HP pools evenly (round down); excess HP you had is lost as fatigue.

#### Nature's Bounty — level 6 (code 6.2)

*v1.4 tagline: create food/water*

**Tags:** util · **Roll:** Plan A · **Save:** none

**Effect:** Create enough wholesome food and water for Sorcerie × 4 people for one day.

#### Perfect Unity — level 6 (code 6.3)

*v1.4 tagline: complete balance*

**Tags:** ward · **Roll:** Sorcerie · **Save:** Sorcerie

**Effect:** For Sorcerie turns, hostile emotions cannot escalate in Sorcerie × 10' — no new fights start; existing fights continue.

#### Season's Call — level 6 (code 6.4)

*v1.4 tagline: control growth cycle*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Accelerate or slow plant growth in Sorcerie × 40' — harvest, bloom, or wilt over Sorcerie hours.

#### Tranquil Heart — level 6 (code 6.5)

*v1.4 tagline: create inner peace*

**Tags:** ctrl · **Roll:** Sorcerie · **Save:** Sorcerie

**Effect:** Sorcerie creatures cannot take violent actions for Sorcerie turns unless attacked first (control — save Sorcerie).

#### Vital Harmony — level 6 (code 6.6)

*v1.4 tagline: balance life forces*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** All willing creatures in Sorcerie × 10' set their HP to the average (round down) of the group.


## Elementale

Primal forces, elements, and weather. The Baal inscribe dragon magic in burning runes carved in stone.

### 1st level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 1.1 | Crystal Growth | util |
| 1.2 | Dragon's Breath | dmg |
| 1.3 | Fog Cloud | util |
| 1.4 | Heat Metal | dmg |
| 1.5 | Icy Touch | util |
| 1.6 | Web Weave | util |

#### Crystal Growth — level 1 (code 1.1)

*v1.4 tagline: form gems*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Grow Sorcerie fist-sized crystals from stone over Sorcerie hours; worth little but hard as stone.

#### Dragon's Breath — level 1 (code 1.2)

*v1.4 tagline: channel flame*

**Tags:** dmg · **Roll:** Sword · **Save:** Sword

**Effect:** Cone 60'. Cone: **1d6** to HP per creature (− Resistance). Each target — **Sword** save for half.

#### Fog Cloud — level 1 (code 1.3)

*v1.4 tagline: create mist*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Fog spreads out in a Sorcerie × 10' radius from you. Fades in one turn.

#### Heat Metal — level 1 (code 1.4)

*v1.4 tagline: make objects burning*

**Tags:** dmg · **Roll:** Sorcerie · **Save:** Sword

**Effect:** One metal object glows hot for Sorcerie turns; holder takes **1d6** per round to HP (− Resistance). Unless dropped.

#### Icy Touch — level 1 (code 1.5)

*v1.4 tagline: spread ice*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** An ice layer spreads across a surface, up to Sorcerie × 10' in radius.

#### Web Weave — level 1 (code 1.6)

*v1.4 tagline: spin natural nets*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** You can shoot Sorcerie × 40' of strong, sticky web. Lasts until burned.

### 2nd level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 2.1 | Earth Shape | util |
| 2.2 | Elemental Wall | ward |
| 2.3 | Fire Shield | ward |
| 2.4 | Force Wall | ward |
| 2.5 | Gravity Shift | util |
| 2.6 | Increase Gravity | util |

#### Earth Shape — level 2 (code 2.1)

*v1.4 tagline: mold stone*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Inanimate material acts like clay in your hands for Sorcerie turns.

#### Elemental Wall — level 2 (code 2.2)

*v1.4 tagline: create barrier*

**Tags:** ward · **Roll:** Sorcerie · **Save:** none

**Effect:** Creates a wall of ice or fire Sorcerie × 40' long, 5' wide and 10' tall. The wall can curve however you want.

#### Fire Shield — level 2 (code 2.3)

*v1.4 tagline: protective flames*

**Tags:** ward · **Roll:** Sorcerie · **Save:** none

**Effect:** Flames wreath you for Sorcerie turns; melee attackers take **1d6** per round to HP (− Resistance). On a hit.

#### Force Wall — level 2 (code 2.4)

*v1.4 tagline: energy barrier*

**Tags:** ward · **Roll:** Sorcerie · **Save:** none

**Effect:** Invisible barrier Sorcerie × 20' long, 10' high; blocks physical passage until it takes Sorcerie × 5 damage.

#### Gravity Shift — level 2 (code 2.5)

*v1.4 tagline: change gravity*

**Tags:** util · **Roll:** Sorcerie · **Save:** Sorcerie

**Effect:** Sorcerie creatures can alter their 'down' direction at will.

#### Increase Gravity — level 2 (code 2.6)

*v1.4 tagline: triple weight*

**Tags:** util · **Roll:** Sorcerie · **Save:** Sword

**Effect:** The gravity within Sorcerie × 10' of you triples.

### 3rd level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 3.1 | Lightning Strike | dmg |
| 3.2 | Liquid Air | util |
| 3.3 | Mist Form | util |
| 3.4 | Mountain's Strength | util |
| 3.5 | Rain Make | util |
| 3.6 | Steam Form | util |

#### Lightning Strike — level 3 (code 3.1)

*v1.4 tagline: call electricity*

**Tags:** dmg · **Roll:** Sword · **Save:** Sword

**Effect:** **1d6+2** to HP (− scoped Resistance). **Sword** save for half (round down, min 0).

#### Liquid Air — level 3 (code 3.2)

*v1.4 tagline: make air swimmable*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** The air within Sorcerie × 10' of you becomes swimmable.

#### Mist Form — level 3 (code 3.3)

*v1.4 tagline: become vapor*

**Tags:** util · **Roll:** Sorcerie · **Save:** Sword

**Effect:** Your body and gear become living smoke for Sorcerie turns.

#### Mountain's Strength — level 3 (code 3.4)

*v1.4 tagline: earth power*

**Tags:** util · **Roll:** Sword · **Save:** none

**Effect:** You gain +Sorcerie Damage on shove/break attempts for Sorcerie turns.

#### Rain Make — level 3 (code 3.5)

*v1.4 tagline: create downpour*

**Tags:** util · **Roll:** Plan A · **Save:** none

**Effect:** Rain falls in Sorcerie × 40' for Sorcerie hours.

#### Steam Form — level 3 (code 3.6)

*v1.4 tagline: become vapor*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Your body and gear become living smoke for Sorcerie turns.

### 4th level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 4.1 | Earthquake | dmg |
| 4.2 | Sculpt Elements | util |
| 4.3 | Stone Tell | info |
| 4.4 | Water Breathing | util |
| 4.5 | Whirlwind | ward |
| 4.6 | Wind Shield | ward |

#### Earthquake — level 4 (code 4.1)

*v1.4 tagline: shake ground*

**Tags:** dmg · **Roll:** Sword · **Save:** none

**Effect:** The ground shakes violently for Sorcerie rounds. Area: **2d6** to HP per creature (− Resistance). Each target — **Sword** save for half.

#### Sculpt Elements — level 4 (code 4.2)

*v1.4 tagline: shape materials*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Inanimate material acts like clay in your hands for Sorcerie turns.

#### Stone Tell — level 4 (code 4.3)

*v1.4 tagline: read earth memories*

**Tags:** info · **Roll:** Sorcerie · **Save:** none

**Effect:** The Guide answers Sorcerie yes or no questions about an object.

#### Water Breathing — level 4 (code 4.4)

*v1.4 tagline: breathe liquid*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Sorcerie creatures breathe water for Sorcerie hours.

#### Whirlwind — level 4 (code 4.5)

*v1.4 tagline: create vortex*

**Tags:** ward · **Roll:** Sorcerie · **Save:** none

**Effect:** You create a vortex of air Sorcerie × 10' wide that can deflect missiles.

#### Wind Shield — level 4 (code 4.6)

*v1.4 tagline: air protection*

**Tags:** ward · **Roll:** Sorcerie · **Save:** none

**Effect:** Missiles at you suffer −Sorcerie Damage for Sorcerie turns.

### 5th level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 5.1 | Stone Skin | ward |
| 5.2 | Storm Call | dmg |
| 5.3 | Summon Cube | util |
| 5.4 | Summon Idol | summon |
| 5.5 | Thunder Call | dmg |
| 5.6 | Upwell | util |

#### Stone Skin — level 5 (code 5.1)

*v1.4 tagline: harden flesh*

**Tags:** ward · **Roll:** Sorcerie · **Save:** none

**Effect:** Your skin counts as AC +Sorcerie (max +4) for Sorcerie turns; movement halved.

#### Storm Call — level 5 (code 5.2)

*v1.4 tagline: summon thunder*

**Tags:** dmg · **Roll:** Sorcerie · **Save:** none

**Effect:** Thunderstorm in Sorcerie × 40' for Sorcerie hours; each round one random target in the storm: **1d6** per round to HP (− Resistance).

#### Summon Cube — level 5 (code 5.3)

*v1.4 tagline: control earth*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** You may summon or banish a 5' cube of earth 5 times per round for Sorcerie rounds. Cubes must be affixed to the earth or to other cubes.

#### Summon Idol — level 5 (code 5.4)

*v1.4 tagline: create statue*

**Tags:** summon · **Roll:** Sorcerie · **Save:** none

**Effect:** A carved stone statue up to Sorcerie × 10' tall rises from the ground.

#### Thunder Call — level 5 (code 5.5)

*v1.4 tagline: create sonic boom*

**Tags:** dmg · **Roll:** Sword · **Save:** Sword

**Effect:** Burst in lore × 10': **2d6** to HP per creature (− Resistance). Deafened 1 turn on failed save. Each target — **Sword** save for half.

#### Upwell — level 5 (code 5.6)

*v1.4 tagline: create spring*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** A spring of seawater erupts, producing a thousand cubic feet of water per turn for Sorcerie turns.

### 6th level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 6.1 | Control Weather | util |
| 6.2 | Element Master | util |
| 6.3 | Tide Control | util |
| 6.4 | Water Shape | util |
| 6.5 | Wind Walk | util |
| 6.6 | Zephyr | util |

#### Control Weather — level 6 (code 6.1)

*v1.4 tagline: command climate*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** You control your hex's weather for Sorcerie hours.

#### Element Master — level 6 (code 6.2)

*v1.4 tagline: complete control*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** For Sorcerie turns, choose one element (fire/ice/lightning/water/earth/air); shape it within Sorcerie × 10' — utility only, or **1d6** direct damage per action (ongoing rubric cap).

#### Tide Control — level 6 (code 6.3)

*v1.4 tagline: command waters*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Raise or lower water level in Sorcerie × 40' shoreline over Sorcerie hours.

#### Water Shape — level 6 (code 6.4)

*v1.4 tagline: control liquid*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Shape standing water like clay within Sorcerie × 10' for Sorcerie turns.

#### Wind Walk — level 6 (code 6.5)

*v1.4 tagline: float on breeze*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** You float on wind at walk speed for Sorcerie hours; cannot carry others.

#### Zephyr — level 6 (code 6.6)

*v1.4 tagline: ride the winds*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** You and Sorcerie companions ride a tailwind — double overland speed for Sorcerie hours.


## Thaumaturgy

Physical laws, mechanisms, and force. The engineering magic of the Dwur, written in foundational runes that command reality.

### 1st level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 1.1 | Adhere | util |
| 1.2 | Command | ctrl |
| 1.3 | Thaumaturgic Hand | util |
| 1.4 | Filch | util |
| 1.5 | Force Push | util |
| 1.6 | Leap | util |

#### Adhere — level 1 (code 1.1)

*v1.4 tagline: make sticky*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Objects become sticky enough to hold a person to a ceiling. Lasts until washed.

#### Command — level 1 (code 1.2)

*v1.4 tagline: force obedience*

**Tags:** ctrl · **Roll:** Sorcerie · **Save:** Sorcerie

**Effect:** A creature obeys a single, Sorcerie-word command that doesn't harm it.

#### Thaumaturgic Hand — level 1 (code 1.3)

*v1.4 tagline: spectral hand*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** A spectral hand appears within Sorcerie × 10' and carries or manipulates light objects at your command for Sorcerie turns. It cannot attack or exert real force.

#### Filch — level 1 (code 1.4)

*v1.4 tagline: teleport items*

**Tags:** util · **Roll:** Sword · **Save:** none

**Effect:** Sorcerie visible items teleport to your hands.

#### Force Push — level 1 (code 1.5)

*v1.4 tagline: directional power*

**Tags:** util · **Roll:** Sword · **Save:** none

**Effect:** An object of any size is pushed directly away from you with the force of Sorcerie men for one round.

#### Leap — level 1 (code 1.6)

*v1.4 tagline: control jumping*

**Tags:** util · **Roll:** Sword · **Save:** none

**Effect:** You can jump up to Sorcerie × 10'.

### 2nd level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 2.1 | Animate Object | util |
| 2.2 | Hover | util |
| 2.3 | Invisible Tether | util |
| 2.4 | Knock | util |
| 2.5 | Lock | util |
| 2.6 | Sort | util |

#### Animate Object — level 2 (code 2.1)

*v1.4 tagline: objects obey*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Objects obey your orders. They move 15' per round.

#### Hover — level 2 (code 2.2)

*v1.4 tagline: control levitation*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Make Sorcerie objects hover 2' above the ground, frictionless. They can support the weight of up to Sorcerie people.

#### Invisible Tether — level 2 (code 2.3)

*v1.4 tagline: bind objects*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Sorcerie objects within 10' of each other cannot be moved more than 10' apart from each other.

#### Knock — level 2 (code 2.4)

*v1.4 tagline: open locks*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Sorcerie locks unlock.

#### Lock — level 2 (code 2.5)

*v1.4 tagline: seal door*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** A door cannot be opened by mundane means for Sorcerie turns.

#### Sort — level 2 (code 2.6)

*v1.4 tagline: organize items*

**Tags:** util · **Roll:** Plan A · **Save:** none

**Effect:** Inanimate items sort themselves according to Sorcerie categories you set. The categories must be visually verifiable.

### 3rd level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 3.1 | Control Device | util |
| 3.2 | Mend | util |
| 3.3 | Object Memory | info |
| 3.4 | Shrink Item | util |
| 3.5 | Spider Climb | util |
| 3.6 | Strengthen | util |

#### Control Device — level 3 (code 3.1)

*v1.4 tagline: command mechanisms*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Mechanisms (locks, traps, clockwork) obey simple commands for Sorcerie turns within 30'.

#### Mend — level 3 (code 3.2)

*v1.4 tagline: repair objects*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Repair one broken mundane object up to chair-size; magical items need Sorcerie vs Guide DC. *Objects only — not flesh.*

#### Object Memory — level 3 (code 3.3)

*v1.4 tagline: read item history*

**Tags:** info · **Roll:** Sorcerie · **Save:** none

**Effect:** The Guide answers Sorcerie yes or no questions about an object.

#### Shrink Item — level 3 (code 3.4)

*v1.4 tagline: reduce size*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** You and Sorcerie other touched creatures become mouse-sized.

#### Spider Climb — level 3 (code 3.5)

*v1.4 tagline: control climbing*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** You can climb surfaces like a spider for Sorcerie turns.

#### Strengthen — level 3 (code 3.6)

*v1.4 tagline: reinforce material*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** One object gains Sorcerie × 5 structural HP; breaks only under deliberate force.

### 4th level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 4.1 | Astral Prison | ward |
| 4.2 | Augment Object | util |
| 4.3 | Haste | util |
| 4.4 | Masterscript | ctrl |
| 4.5 | Teleport | util |
| 4.6 | Unravel | ward |

#### Astral Prison — level 4 (code 4.1)

*v1.4 tagline: crystal stasis*

**Tags:** ward · **Roll:** Sorcerie · **Save:** none

**Effect:** An object is frozen in time and space within an invulnerable crystal shell for Sorcerie turns.

#### Augment Object — level 4 (code 4.2)

*v1.4 tagline: enhance item*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** One weapon or tool gains +1 effective slot class or +1 util bonus for Sorcerie days.

#### Haste — level 4 (code 4.3)

*v1.4 tagline: control speed*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Sorcerie creatures have their movement speed tripled.

#### Masterscript — level 4 (code 4.4)

*v1.4 tagline: write command runes*

**Tags:** ctrl · **Roll:** Sorcerie · **Save:** Sorcerie

**Effect:** Inscribe a command rune; the next Sorcerie readers who touch it obey one Sorcerie-word command (save Sorcerie).

#### Teleport — level 4 (code 4.5)

*v1.4 tagline: move objects*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** An object teleports to a clear patch of ground up to Sorcerie × 40' away from its origin point.

#### Unravel — level 4 (code 4.6)

*v1.4 tagline: counter spells*

**Tags:** ward · **Roll:** Sorcerie · **Save:** none

**Effect:** Cast this as a reaction to another spell of level Sorcerie or less going off to nullify it.

### 5th level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 5.1 | Animate Tool | util |
| 5.2 | Binding Circle | ward |
| 5.3 | Density Control | util |
| 5.4 | Enhance Power | util |
| 5.5 | Magic Suppressor | ward |
| 5.6 | Time Slip | util |

#### Animate Tool — level 5 (code 5.1)

*v1.4 tagline: give purpose*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Objects obey your orders. They move 15' per round.

#### Binding Circle — level 5 (code 5.2)

*v1.4 tagline: contain force*

**Tags:** ward · **Roll:** Sorcerie · **Save:** none

**Effect:** A silver circle 40' across appears on the ground around you. Until you leave the circle, Sorcerie types of things that you name cannot cross it.

#### Density Control — level 5 (code 5.3)

*v1.4 tagline: alter mass*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** The gravity within Sorcerie × 10' of you triples.

#### Enhance Power — level 5 (code 5.4)

*v1.4 tagline: boost magic*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Next spell cast from this Arcana within Sorcerie hours gains +1 effective Sorcerie for scaling only.

#### Magic Suppressor — level 5 (code 5.5)

*v1.4 tagline: null magic*

**Tags:** ward · **Roll:** Sorcerie · **Save:** none

**Effect:** All magic is nullified while within Sorcerie × 10' of you.

#### Time Slip — level 5 (code 5.6)

*v1.4 tagline: control time*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Time within Sorcerie × 10' of you goes 10 times slower than the rest of the world. Lasts 10 rounds (for you).

### 6th level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 6.1 | Magic Circle | ward |
| 6.2 | Perfect Control | util |
| 6.3 | Reality Anchor | ward |
| 6.4 | Rune Lock | util |
| 6.5 | Shape Material | util |
| 6.6 | Thaumaturgic Seal | ward |

#### Magic Circle — level 6 (code 6.1)

*v1.4 tagline: create workspace*

**Tags:** ward · **Roll:** Sorcerie · **Save:** none

**Effect:** A 10' circle safe for casting for Sorcerie hours; hostile magic entering saves vs your Sorcerie.

#### Perfect Control — level 6 (code 6.2)

*v1.4 tagline: complete mastery*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** For Sorcerie turns, telekinesis on items within 30' with fine control (no combat damage above 1d6).

#### Reality Anchor — level 6 (code 6.3)

*v1.4 tagline: stabilize space*

**Tags:** ward · **Roll:** Sorcerie · **Save:** none

**Effect:** An object becomes the target of every spell cast within 120' of it for Sorcerie turns.

#### Rune Lock — level 6 (code 6.4)

*v1.4 tagline: seal with power*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** A door cannot be opened by mundane means for Sorcerie turns.

#### Shape Material — level 6 (code 6.5)

*v1.4 tagline: change form*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Inanimate material acts like clay in your hands for Sorcerie turns.

#### Thaumaturgic Seal — level 6 (code 6.6)

*v1.4 tagline: master rune*

**Tags:** ward · **Roll:** Sorcerie · **Save:** none

**Effect:** A door cannot be opened by mundane means for Sorcerie turns.


## Illusione

Perception, thought, and dreams. The subtle magic of the Belerions, woven from phantasmal scripts that deceive the senses.

### 1st level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 1.1 | Arcane Eye | info |
| 1.2 | Auditory Illusion | util |
| 1.3 | Bewitch | ctrl |
| 1.4 | Blur | ward |
| 1.5 | Visual Illusion | util |
| 1.6 | Detect Magic | info |

#### Arcane Eye — level 1 (code 1.1)

*v1.4 tagline: flying sensor*

**Tags:** info · **Roll:** Sorcerie · **Save:** none

**Effect:** You create a magic eye that flies around under your control for Sorcerie turns. You can see through it as well as your normal eyes.

#### Auditory Illusion — level 1 (code 1.2)

*v1.4 tagline: create sounds*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** You can create illusory sounds that seem to come from Sorcerie directions of your choice.

#### Bewitch — level 1 (code 1.3)

*v1.4 tagline: enchant mind*

**Tags:** ctrl · **Roll:** Sorcerie · **Save:** Sorcerie

**Effect:** Sorcerie humanoids believe they are close friends with you until proven otherwise.

#### Blur — level 1 (code 1.4)

*v1.4 tagline: distort appearance*

**Tags:** ward · **Roll:** Sword · **Save:** none

**Effect:** Attacks against you suffer −Sorcerie Damage while you move for Sorcerie turns.

#### Visual Illusion — level 1 (code 1.5)

*v1.4 tagline: create images*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** You create a silent, motionless illusory image about the size of a creature or object within Sorcerie × 10', lasting Sorcerie turns. It casts no sound, light, or smell, and touching it or studying it closely reveals the illusion.

#### Detect Magic — level 1 (code 1.6)

*v1.4 tagline: see magic*

**Tags:** info · **Roll:** Plan A · **Save:** none

**Effect:** Anything magical within line of sight glows and reveals its properties on request. Lasts 1 day or until you make Sorcerie requests.

### 2nd level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 2.1 | Disguise | util |
| 2.2 | Dream Message | info |
| 2.3 | Duplicate | util |
| 2.4 | Emotional Aura | ctrl |
| 2.5 | Feign Death | util |
| 2.6 | Greed | ctrl |

#### Disguise — level 2 (code 2.1)

*v1.4 tagline: alter appearance*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** You may alter the look of Sorcerie humanoids as long as they remain humanoid. Lasts until the subjects speak.

#### Dream Message — level 2 (code 2.2)

*v1.4 tagline: send sleeping visions*

**Tags:** info · **Roll:** Sorcerie · **Save:** none

**Effect:** Send a Sorcerie-word message to a sleeping person you know; they remember it as a dream.

#### Duplicate — level 2 (code 2.3)

*v1.4 tagline: create copies*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Create Sorcerie fragile, porcelain copies of items you can see.

#### Emotional Aura — level 2 (code 2.4)

*v1.4 tagline: project feeling*

**Tags:** ctrl · **Roll:** Sorcerie · **Save:** Sorcerie

**Effect:** Project one emotion in Sorcerie × 10'; creatures feel it but save Sorcerie to act against it.

#### Feign Death — level 2 (code 2.5)

*v1.4 tagline: appear dead*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** You appear dead for Sorcerie hours; vital signs absent. Wound checks do not worsen you while feigning.

#### Greed — level 2 (code 2.6)

*v1.4 tagline: create obsession*

**Tags:** ctrl · **Roll:** Sorcerie · **Save:** Sorcerie

**Effect:** Sorcerie creatures become obsessed with possessing a visible item.

### 3rd level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 3.1 | Hypnotize | ctrl |
| 3.2 | Illusory Spray | util |
| 3.3 | Invisibility | util |
| 3.4 | Mirror Image | ward |
| 3.5 | Phantasmal Force | dmg |
| 3.6 | Phantom Sound | util |

#### Hypnotize — level 3 (code 3.1)

*v1.4 tagline: question trance*

**Tags:** ctrl · **Roll:** Sorcerie · **Save:** Sorcerie

**Effect:** A creature enters a trance and will answer Sorcerie yes or no questions.

#### Illusory Spray — level 3 (code 3.2)

*v1.4 tagline: disorient with light*

**Tags:** util · **Roll:** Sword · **Save:** Sword

**Effect:** Flash blinds Sorcerie foes for 1 round (Sword save or −3 Damage next defend).

#### Invisibility — level 3 (code 3.3)

*v1.4 tagline: become unseen*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Sorcerie creatures are invisible for as long as they can hold their breath.

#### Mirror Image — level 3 (code 3.4)

*v1.4 tagline: create duplicates*

**Tags:** ward · **Roll:** Sword · **Save:** none

**Effect:** Sorcerie illusory copies of you, under your control, appear.

#### Phantasmal Force — level 3 (code 3.5)

*v1.4 tagline: moving illusion*

**Tags:** dmg · **Roll:** Sorcerie · **Save:** none

**Effect:** Moving illusion. If believed: **1d6+1** to HP (− scoped Resistance). Psychic — ignores AC. **Sorcerie** save for half (round down, min 0).

#### Phantom Sound — level 3 (code 3.6)

*v1.4 tagline: distant noise*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** You can create illusory sounds that seem to come from Sorcerie directions of your choice.

### 4th level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 4.1 | Dream Walking | info |
| 4.2 | False Memory | ctrl |
| 4.3 | Mass Suggestion | ctrl |
| 4.4 | Mind Shield | ward |
| 4.5 | Read Mind | info |
| 4.6 | Visual Illusion | util |

#### Dream Walking — level 4 (code 4.1)

*v1.4 tagline: enter dreams*

**Tags:** info · **Roll:** Sorcerie · **Save:** none

**Effect:** Enter the dream of one sleeping creature within touch for Sorcerie hours (your body helpless).

#### False Memory — level 4 (code 4.2)

*v1.4 tagline: plant fake memory*

**Tags:** ctrl · **Roll:** Sorcerie · **Save:** Sorcerie

**Effect:** A creature is unable to form short-term memories for Sorcerie turns.

#### Mass Suggestion — level 4 (code 4.3)

*v1.4 tagline: group command*

**Tags:** ctrl · **Roll:** Sorcerie · **Save:** Sorcerie

**Effect:** A creature obeys a single, Sorcerie-word command that doesn't harm it.

#### Mind Shield — level 4 (code 4.4)

*v1.4 tagline: protect thoughts*

**Tags:** ward · **Roll:** Sorcerie · **Save:** none

**Effect:** One creature immune to read-mind and charm for Sorcerie hours.

#### Read Mind — level 4 (code 4.5)

*v1.4 tagline: hear thoughts*

**Tags:** info · **Roll:** Sorcerie · **Save:** Sorcerie

**Effect:** You can hear the surface thoughts of creatures for Sorcerie turns.

#### Visual Illusion — level 4 (code 4.6)

*v1.4 tagline: static images*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** You create Sorcerie silent, immobile, illusory objects that last until they are touched.

### 5th level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 5.1 | Major Image | util |
| 5.2 | Mind Maze | ctrl |
| 5.3 | Scry | info |
| 5.4 | Silent Image | util |
| 5.5 | Vision | util |
| 5.6 | X-Ray Vision | info |

#### Major Image — level 5 (code 5.1)

*v1.4 tagline: perfect illusion*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** A clearly unreal illusion appears under your control for Sorcerie days. It may be up to the size of a palace and has full motion and sound.

#### Mind Maze — level 5 (code 5.2)

*v1.4 tagline: trap thoughts*

**Tags:** ctrl · **Roll:** Sorcerie · **Save:** Sorcerie

**Effect:** One creature is lost in a mental maze for Sorcerie turns (control if cast ≥ HP).

#### Scry — level 5 (code 5.3)

*v1.4 tagline: share vision*

**Tags:** info · **Roll:** Sorcerie · **Save:** Sorcerie

**Effect:** You can share the vision of a creature you touched today for Sorcerie turns.

#### Silent Image — level 5 (code 5.4)

*v1.4 tagline: create scene*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** You create Sorcerie silent, immobile, illusory objects that last until they are touched.

#### Vision — level 5 (code 5.5)

*v1.4 tagline: personal illusion*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** You create an illusory object with full motion and sound that only one creature can sense. Lasts Sorcerie turns.

#### X-Ray Vision — level 5 (code 5.6)

*v1.4 tagline: see through matter*

**Tags:** info · **Roll:** Sorcerie · **Save:** none

**Effect:** You can see through Sorcerie feet of material.

### 6th level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 6.1 | Mirror Walk | util |
| 6.2 | Perfect Illusion | util |
| 6.3 | Programmed Illusion | util |
| 6.4 | Spectacle | util |
| 6.5 | Telepathy | info |
| 6.6 | True Seeing | info |

#### Mirror Walk — level 6 (code 6.1)

*v1.4 tagline: step through glass*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** A mirror becomes a gate to another mirror you touched today.

#### Perfect Illusion — level 6 (code 6.2)

*v1.4 tagline: undetectable fake*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** A clearly unreal illusion appears under your control for Sorcerie days. It may be up to the size of a palace and has full motion and sound.

#### Programmed Illusion — level 6 (code 6.3)

*v1.4 tagline: triggered effect*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** An illusion triggers on a condition you set; lasts Sorcerie days.

#### Spectacle — level 6 (code 6.4)

*v1.4 tagline: create grand illusion*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** A clearly unreal illusion appears under your control for Sorcerie days. It may be up to the size of a palace and has full motion and sound.

#### Telepathy — level 6 (code 6.5)

*v1.4 tagline: project thoughts*

**Tags:** info · **Roll:** Sorcerie · **Save:** none

**Effect:** You can project your thoughts into a mind within Sorcerie hexes.

#### True Seeing — level 6 (code 6.6)

*v1.4 tagline: pierce deception*

**Tags:** info · **Roll:** Sorcerie · **Save:** none

**Effect:** See through illusions and invisibility for Sorcerie hours.


## Umbrakala

Shadows, thresholds, and dimensional paths. The secret magic of the Alu, written in darkness and void.

### 1st level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 1.1 | Befuddle | ctrl |
| 1.2 | Cloak of Shadows | ward |
| 1.3 | Darksight | info |
| 1.4 | Deep Shadow | util |
| 1.5 | Gate Sense | info |
| 1.6 | Hatred | ctrl |

#### Befuddle — level 1 (code 1.1)

*v1.4 tagline: shadow memories*

**Tags:** ctrl · **Roll:** Sorcerie · **Save:** Sorcerie

**Effect:** A creature is unable to form short-term memories for Sorcerie turns.

#### Cloak of Shadows — level 1 (code 1.2)

*v1.4 tagline: dark protection*

**Tags:** ward · **Roll:** Sorcerie · **Save:** none

**Effect:** +Sorcerie AC in dim light or darkness for Sorcerie turns.

#### Darksight — level 1 (code 1.3)

*v1.4 tagline: see in darkness*

**Tags:** info · **Roll:** Plan A · **Save:** none

**Effect:** See in total darkness for Sorcerie hours.

#### Deep Shadow — level 1 (code 1.4)

*v1.4 tagline: create pure darkness*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** A Sorcerie × 40' wide sphere of total darkness appears.

#### Gate Sense — level 1 (code 1.5)

*v1.4 tagline: detect portals*

**Tags:** info · **Roll:** Sorcerie · **Save:** none

**Effect:** Sense gates, portals, and thin places within Sorcerie × 100' for Sorcerie turns.

#### Hatred — level 1 (code 1.6)

*v1.4 tagline: dark emotion*

**Tags:** ctrl · **Roll:** Sorcerie · **Save:** Sorcerie

**Effect:** Sorcerie creatures start attacking each other for one turn or until one dies.

### 2nd level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 2.1 | Dark Anchor | ward |
| 2.2 | Disassemble | util |
| 2.3 | Ice Heart | dmg |
| 2.4 | Kallascript | util |
| 2.5 | Masquerade | ctrl |
| 2.6 | Miniaturize | util |

#### Dark Anchor — level 2 (code 2.1)

*v1.4 tagline: fix dimensional point*

**Tags:** ward · **Roll:** Sorcerie · **Save:** none

**Effect:** Fix one point in space; teleportation and gates within Sorcerie × 10' fail unless Sorcerie beats your cast.

#### Disassemble — level 2 (code 2.2)

*v1.4 tagline: shadow-split form*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Sorcerie body parts may be detached at will. You can still control them. Lasts until they are reattached.

#### Ice Heart — level 2 (code 2.3)

*v1.4 tagline: freeze with shadow*

**Tags:** dmg · **Roll:** Sorcerie · **Save:** Sorcerie

**Effect:** An ice layer spreads across a surface, up to Sorcerie × 10' in radius; creatures touched take **1d6+2** to HP (− scoped Resistance). **Sorcerie** save for half (round down, min 0).

#### Kallascript — level 2 (code 2.4)

*v1.4 tagline: write gate runes*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Write gate-runes; opens a shadow door to a marked location you visited. Lasts Sorcerie days or one use.

#### Masquerade — level 2 (code 2.5)

*v1.4 tagline: shadow dance*

**Tags:** ctrl · **Roll:** Sorcerie · **Save:** Sorcerie

**Effect:** All creatures within Sorcerie × 10' of you are compelled to dance.

#### Miniaturize — level 2 (code 2.6)

*v1.4 tagline: shrink into shadows*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** You and Sorcerie other touched creatures become mouse-sized.

### 3rd level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 3.1 | Mind Shatter | dmg |
| 3.2 | Night Sphere | util |
| 3.3 | Nightmare Seed | ctrl |
| 3.4 | Ooze Form | util |
| 3.5 | Shadow Bind | ctrl |
| 3.6 | Shadow Clone | ward |

#### Mind Shatter — level 3 (code 3.1)

*v1.4 tagline: shadow thoughts*

**Tags:** dmg · **Roll:** Sorcerie · **Save:** Sorcerie

**Effect:** **1d6+2** to HP (− scoped Resistance). Psychic — ignores Resistance. **Sorcerie** save for half (round down, min 0). On failed save: stunned 1 turn.

#### Night Sphere — level 3 (code 3.2)

*v1.4 tagline: create darkness*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** A Sorcerie × 40' wide sphere of total darkness appears.

#### Nightmare Seed — level 3 (code 3.3)

*v1.4 tagline: dark dreams*

**Tags:** ctrl · **Roll:** Sorcerie · **Save:** Sorcerie

**Effect:** Plant a nightmare in one sleeper; they wake at 0 HP from fear (save Sorcerie).

#### Ooze Form — level 3 (code 3.4)

*v1.4 tagline: shadow substance*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Your body and gear become living slime for Sorcerie turns.

#### Shadow Bind — level 3 (code 3.5)

*v1.4 tagline: trap in darkness*

**Tags:** ctrl · **Roll:** Sword · **Save:** Sword

**Effect:** Sorcerie creatures entangled in shadow; Sword save each turn or cannot act.

#### Shadow Clone — level 3 (code 3.6)

*v1.4 tagline: create dark duplicate*

**Tags:** ward · **Roll:** Sorcerie · **Save:** none

**Effect:** Sorcerie illusory copies of you, under your control, appear.

### 4th level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 4.1 | Body Swap | ctrl |
| 4.2 | Shadow Meld | util |
| 4.3 | Shadow Step | util |
| 4.4 | Shuffle | util |
| 4.5 | Smoke Form | util |
| 4.6 | Void Step | util |

#### Body Swap — level 4 (code 4.1)

*v1.4 tagline: shadow exchange*

**Tags:** ctrl · **Roll:** Sorcerie · **Save:** Sorcerie

**Effect:** You switch bodies with a creature you touch for Sorcerie turns. If one body dies, the other dies as well.

#### Shadow Meld — level 4 (code 4.2)

*v1.4 tagline: merge with darkness*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Merge with shadow; invisible while still for Sorcerie turns.

#### Shadow Step — level 4 (code 4.3)

*v1.4 tagline: travel through dark*

**Tags:** util · **Roll:** Sword · **Save:** none

**Effect:** Step between shadows within Sorcerie × 40' once per round for Sorcerie turns.

#### Shuffle — level 4 (code 4.4)

*v1.4 tagline: shadow displacement*

**Tags:** util · **Roll:** Sword · **Save:** none

**Effect:** Sorcerie creatures switch places randomly.

#### Smoke Form — level 4 (code 4.5)

*v1.4 tagline: become shadow*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Your body and gear become living smoke for Sorcerie turns.

#### Void Step — level 4 (code 4.6)

*v1.4 tagline: brief teleport*

**Tags:** util · **Roll:** Sword · **Save:** none

**Effect:** An object teleports to a clear patch of ground up to Sorcerie × 40' away from its origin point.

### 5th level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 5.1 | Dimension Door | util |
| 5.2 | Kalla Gate | util |
| 5.3 | Phantom Coach | util |
| 5.4 | Realm Weave | util |
| 5.5 | Shadow Time | util |
| 5.6 | Threshold Walk | util |

#### Dimension Door — level 5 (code 5.1)

*v1.4 tagline: create portal*

**Tags:** util · **Roll:** Sword · **Save:** none

**Effect:** You step through shadow to a spot you see within Sorcerie × 40'.

#### Kalla Gate — level 5 (code 5.2)

*v1.4 tagline: create pocket realm*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Open a pocket realm (Sorcerie × 10' room) for Sorcerie hours; one door in, one door out.

#### Phantom Coach — level 5 (code 5.3)

*v1.4 tagline: shadow transport*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** A coach scoops up Sorcerie creatures (who are outdoors) and deposits them in a random adjacent hex.

#### Realm Weave — level 5 (code 5.4)

*v1.4 tagline: connect spaces*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Link two doorways within Sorcerie miles for Sorcerie days — shadow passage between them.

#### Shadow Time — level 5 (code 5.5)

*v1.4 tagline: pause in darkness*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Time within Sorcerie × 10' of you goes 10 times slower than the rest of the world. Lasts 10 rounds (for you).

#### Threshold Walk — level 5 (code 5.6)

*v1.4 tagline: pass through doors*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Pass through Sorcerie closed doors/windows as if open; no sound.

### 6th level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 6.1 | Perfect Shadow | util |
| 6.2 | Plane Shift | util |
| 6.3 | Space Fold | util |
| 6.4 | Twilight Veil | util |
| 6.5 | Void Gate | util |
| 6.6 | Void Shield | ward |

#### Perfect Shadow — level 6 (code 6.1)

*v1.4 tagline: complete control*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Become living shadow for Sorcerie turns; immune to non-magical weapons, cannot speak.

#### Plane Shift — level 6 (code 6.2)

*v1.4 tagline: change reality*

**Tags:** util · **Roll:** Sorcerie · **Save:** Sorcerie

**Effect:** Shift Sorcerie willing creatures to an adjacent shadow-plane for Sorcerie turns; return to entry point.

#### Space Fold — level 6 (code 6.3)

*v1.4 tagline: bend dimensions*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Fold distance: one door opens where another stands within Sorcerie × 100'. Lasts Sorcerie hours.

#### Twilight Veil — level 6 (code 6.4)

*v1.4 tagline: walk between worlds*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Walk the border between worlds for Sorcerie hours; unseen by either side unless they save Sorcerie.

#### Void Gate — level 6 (code 6.5)

*v1.4 tagline: open dark portal*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Open a portal to a named void for Sorcerie rounds; anything entering is lost unless pulled back.

#### Void Shield — level 6 (code 6.6)

*v1.4 tagline: dark protection*

**Tags:** ward · **Roll:** Sorcerie · **Save:** none

**Effect:** Barrier absorbs Sorcerie × 5 HP of damage; then collapses.


## Necromantia

Death, spirits, and decay. The forbidden magic of the Avathars, inscribed in blood and bone.

### 1st level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 1.1 | Animate Skeleton | summon |
| 1.2 | Black Sacrament | util |
| 1.3 | Blood Curse | info |
| 1.4 | Blood Track | info |
| 1.5 | Marble Madness | util |
| 1.6 | Wizard Mark | info |

#### Animate Skeleton — level 1 (code 1.1)

*v1.4 tagline: raise bones*

**Tags:** summon · **Roll:** Sorcerie · **Save:** none

**Effect:** Sorcerie unarmed skeletons rise from the ground to serve you.

#### Black Sacrament — level 1 (code 1.2)

*v1.4 tagline: death ritual*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Sacrifice 1 HP to bless Sorcerie undead servants for one day (+1 Damage).

#### Blood Curse — level 1 (code 1.3)

*v1.4 tagline: sacrifice life*

**Tags:** info · **Roll:** Sorcerie · **Save:** Sorcerie

**Effect:** Mark one creature; you know direction/distance for Sorcerie days.

#### Blood Track — level 1 (code 1.4)

*v1.4 tagline: follow wounds*

**Tags:** info · **Roll:** Plan A · **Save:** none

**Effect:** Follow a blood trail up to Sorcerie miles; fresh only.

#### Marble Madness — level 1 (code 1.5)

*v1.4 tagline: death's toys*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Your pockets refill with marbles every round for Sorcerie rounds.

#### Wizard Mark — level 1 (code 1.6)

*v1.4 tagline: death runes*

**Tags:** info · **Roll:** Sorcerie · **Save:** none

**Effect:** Your finger produces ulfire-colored paint for Sorcerie hours. This paint is only visible to you, and can be seen at any distance, even through objects.

### 2nd level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 2.1 | Bone Puppet | summon |
| 2.2 | Bone Shield | ward |
| 2.3 | Comprehend Dead | info |
| 2.4 | Dark Blessing | ward |
| 2.5 | Grave Mist | util |
| 2.6 | Life Sense | info |

#### Bone Puppet — level 2 (code 2.1)

*v1.4 tagline: animate dead*

**Tags:** summon · **Roll:** Sorcerie · **Save:** none

**Effect:** Sorcerie unarmed skeletons rise from the ground to serve you.

#### Bone Shield — level 2 (code 2.2)

*v1.4 tagline: skeletal armor*

**Tags:** ward · **Roll:** Sorcerie · **Save:** none

**Effect:** Skeletal armor +Sorcerie AC for Sorcerie turns; looks horrific.

#### Comprehend Dead — level 2 (code 2.3)

*v1.4 tagline: dead languages*

**Tags:** info · **Roll:** Sorcerie · **Save:** none

**Effect:** You are fluent in all languages for Sorcerie hours.

#### Dark Blessing — level 2 (code 2.4)

*v1.4 tagline: death's power*

**Tags:** ward · **Roll:** Sorcerie · **Save:** none

**Effect:** One undead gains Sorcerie temporary HP.

#### Grave Mist — level 2 (code 2.5)

*v1.4 tagline: create death fog*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Fog spreads out in a Sorcerie × 10' radius from you. Fades in one turn.

#### Life Sense — level 2 (code 2.6)

*v1.4 tagline: detect living*

**Tags:** info · **Roll:** Sorcerie · **Save:** none

**Effect:** Sense living creatures within Sorcerie × 60' for Sorcerie turns.

### 3rd level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 3.1 | Command Undead | ctrl |
| 3.2 | Corpse Explosion | dmg |
| 3.3 | Pain Echo | dmg |
| 3.4 | Psychometry | info |
| 3.5 | Sniff | info |
| 3.6 | Undead Sight | info |

#### Command Undead — level 3 (code 3.1)

*v1.4 tagline: control dead*

**Tags:** ctrl · **Roll:** Sorcerie · **Save:** Sorcerie

**Effect:** A creature obeys a single, Sorcerie-word command that doesn't harm it.

#### Corpse Explosion — level 3 (code 3.2)

*v1.4 tagline: detonate dead*

**Tags:** dmg · **Roll:** Sorcerie · **Save:** Sword

**Effect:** 10' burst from one corpse: **1d6** to HP per creature (− Resistance). Each target — **Sword** save for half.

#### Pain Echo — level 3 (code 3.3)

*v1.4 tagline: share suffering*

**Tags:** dmg · **Roll:** Sorcerie · **Save:** Sorcerie

**Effect:** One creature feels your wound pain; if you have an open wound, they take **1d6** HP (ongoing rubric; ignores Resistance).

#### Psychometry — level 3 (code 3.4)

*v1.4 tagline: read death echoes*

**Tags:** info · **Roll:** Sorcerie · **Save:** none

**Effect:** The Guide answers Sorcerie yes or no questions about an object.

#### Sniff — level 3 (code 3.5)

*v1.4 tagline: smell death*

**Tags:** info · **Roll:** Sorcerie · **Save:** none

**Effect:** A creature can smell all scents up to 120' away for Sorcerie turns.

#### Undead Sight — level 3 (code 3.6)

*v1.4 tagline: see spirits*

**Tags:** info · **Roll:** Sorcerie · **Save:** none

**Effect:** See spirits and invisible undead for Sorcerie hours.

### 4th level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 4.1 | Death Touch | dmg |
| 4.2 | Death Ward | ward |
| 4.3 | Doom Mark | ctrl |
| 4.4 | Drain Life | dmg |
| 4.5 | Fear Aura | ctrl |
| 4.6 | Speak with Dead | info |

#### Death Touch — level 4 (code 4.1)

*v1.4 tagline: wither life*

**Tags:** dmg · **Roll:** Sword · **Save:** none

**Effect:** Melee touch. **1d6+2** to HP (− scoped Resistance). Necrotic. **Sorcerie** save for half (round down, min 0).

#### Death Ward — level 4 (code 4.2)

*v1.4 tagline: protect from necrotic*

**Tags:** ward · **Roll:** Sorcerie · **Save:** none

**Effect:** One creature ignores the first Sorcerie necrotic hits.

#### Doom Mark — level 4 (code 4.3)

*v1.4 tagline: mark for death*

**Tags:** ctrl · **Roll:** Sorcerie · **Save:** Sorcerie

**Effect:** Marked creature suffers −Sorcerie on all saves for Sorcerie days.

#### Drain Life — level 4 (code 4.4)

*v1.4 tagline: steal vitality*

**Tags:** dmg · **Roll:** Sword · **Save:** Sorcerie

**Effect:** Touch. **1d6+2** to HP (− scoped Resistance). **Sorcerie** save for half (round down, min 0). You heal half the HP dealt (round down).

#### Fear Aura — level 4 (code 4.5)

*v1.4 tagline: death terror*

**Tags:** ctrl · **Roll:** Sorcerie · **Save:** Sorcerie

**Effect:** Sorcerie creatures become terrified of an object.

#### Speak with Dead — level 4 (code 4.6)

*v1.4 tagline: question spirits*

**Tags:** info · **Roll:** Sorcerie · **Save:** none

**Effect:** The spirit of a touched dead body appears and will answer Sorcerie questions (if it can).

### 5th level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 5.1 | Death Gate | summon |
| 5.2 | Ghost Bind | ctrl |
| 5.3 | Spirit Chains | ctrl |
| 5.4 | Spirit Form | util |
| 5.5 | Truth Sense | info |
| 5.6 | Vampiric Touch | dmg |

#### Death Gate — level 5 (code 5.1)

*v1.4 tagline: portal to underworld*

**Tags:** summon · **Roll:** Sorcerie · **Save:** none

**Effect:** Open a chill gate to the underworld for Sorcerie rounds; undead step through; living save Sorcerie or **1d6** cold (ongoing rubric).

#### Ghost Bind — level 5 (code 5.2)

*v1.4 tagline: trap spirits*

**Tags:** ctrl · **Roll:** Sorcerie · **Save:** Sorcerie

**Effect:** Trap one spirit in an object for Sorcerie years.

#### Spirit Chains — level 5 (code 5.3)

*v1.4 tagline: bind ghost*

**Tags:** ctrl · **Roll:** Sorcerie · **Save:** Sorcerie

**Effect:** Bind one ghost to service for Sorcerie days.

#### Spirit Form — level 5 (code 5.4)

*v1.4 tagline: become ghostly*

**Tags:** util · **Roll:** Sorcerie · **Save:** none

**Effect:** Your body and gear become living smoke for Sorcerie turns.

#### Truth Sense — level 5 (code 5.5)

*v1.4 tagline: death's truth*

**Tags:** info · **Roll:** Sorcerie · **Save:** none

**Effect:** You can detect lies for Sorcerie hours.

#### Vampiric Touch — level 5 (code 5.6)

*v1.4 tagline: drain energy*

**Tags:** dmg · **Roll:** Sword · **Save:** Sorcerie

**Effect:** Touch. **1d6+2** to HP (− scoped Resistance). **Sorcerie** save for half (round down, min 0). You heal the HP dealt (cannot exceed max HP).

### 6th level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 6.1 | Mass Animation | summon |
| 6.2 | Perfect Death | dmg |
| 6.3 | Plague Wind | dmg |
| 6.4 | Raise Dead | summon |
| 6.5 | Soul Cage | ctrl |
| 6.6 | Soul Rend | dmg |

#### Mass Animation — level 6 (code 6.1)

*v1.4 tagline: raise army*

**Tags:** summon · **Roll:** Sorcerie · **Save:** none

**Effect:** Sorcerie unarmed skeletons rise from the ground to serve you.

#### Perfect Death — level 6 (code 6.2)

*v1.4 tagline: ultimate end*

**Tags:** dmg · **Roll:** Sorcerie · **Save:** Sorcerie

**Effect:** One living creature at 0 HP or below fails one Wound Check automatically (coup magic). Moral weight.

#### Plague Wind — level 6 (code 6.3)

*v1.4 tagline: spread death*

**Tags:** dmg · **Roll:** Sorcerie · **Save:** Sorcerie

**Effect:** Sorcerie × 10' cloud of rot: living creatures save Sorcerie daily or lose **1 HP** until cured (attrition, not burst damage).

#### Raise Dead — level 6 (code 6.4)

*v1.4 tagline: create undead*

**Tags:** summon · **Roll:** Sorcerie · **Save:** none

**Effect:** Sorcerie unarmed skeletons rise from the ground to serve you.

#### Soul Cage — level 6 (code 6.5)

*v1.4 tagline: trap essence*

**Tags:** ctrl · **Roll:** Sorcerie · **Save:** Sorcerie

**Effect:** Trap a dying soul in a gem for Sorcerie days; speak with it.

#### Soul Rend — level 6 (code 6.6)

*v1.4 tagline: tear spirit*

**Tags:** dmg · **Roll:** Sorcerie · **Save:** Sorcerie

**Effect:** **1d6+4** to HP (− scoped Resistance). **Sorcerie** save for half (round down, min 0). If brought to 0 HP, soul is shunted out for Sorcerie hours (recoverable).


## Canting

Deception and manipulation in Thieves' Cant — flash papers and brotherhood marks. If you can't flash the patter, stay out of the Darkmans.

### 1st level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 1.1 | Budge | util |
| 1.2 | Cony-Catch | info |
| 1.3 | Flash Paper | info |
| 1.4 | Juke | ward |
| 1.5 | Mark the Gull | info |
| 1.6 | Mort's Mask | util |

#### Budge — level 1 (code 1.1)

*v1.4 tagline: distance unlock*

**Tags:** util · **Roll:** Craft · **Save:** none

**Effect:** Sorcerie locks unlock.

#### Cony-Catch — level 1 (code 1.2)

*v1.4 tagline: sense fears/vices*

**Tags:** info · **Roll:** Sorcerie · **Save:** Sorcerie

**Effect:** Read one target's vice or fear (one sentence truth).

#### Flash Paper — level 1 (code 1.3)

*v1.4 tagline: hidden messages*

**Tags:** info · **Roll:** Plan A · **Save:** none

**Effect:** Messages on flash paper visible only to Canting-literate readers; burns after Sorcerie readings.

#### Juke — level 1 (code 1.4)

*v1.4 tagline: dodge attack*

**Tags:** ward · **Roll:** Sword · **Save:** none

**Effect:** Your next defend this round gains +Sorcerie (dirty fighting).

#### Mark the Gull — level 1 (code 1.5)

*v1.4 tagline: spot easy marks*

**Tags:** info · **Roll:** Plan A · **Save:** none

**Effect:** For Sorcerie hours, spot the most gullible or greedy mark in a crowd (Heart contests against you fail).

#### Mort's Mask — level 1 (code 1.6)

*v1.4 tagline: change face*

**Tags:** util · **Roll:** Craft · **Save:** none

**Effect:** You may alter the look of Sorcerie humanoids as long as they remain humanoid. Lasts until the subjects speak.

### 2nd level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 2.1 | Brotherhood Mark | info |
| 2.2 | Fleet Pad | util |
| 2.3 | Foist | util |
| 2.4 | Nip | util |
| 2.5 | Second-Story Man | util |
| 2.6 | Spring | util |

#### Brotherhood Mark — level 2 (code 2.1)

*v1.4 tagline: sense guild members*

**Tags:** info · **Roll:** Plan A · **Save:** none

**Effect:** Sense guild-brothers within Sorcerie × 100' for Sorcerie hours.

#### Fleet Pad — level 2 (code 2.2)

*v1.4 tagline: quickened step*

**Tags:** util · **Roll:** Craft · **Save:** none

**Effect:** Sorcerie creatures have their movement speed tripled.

#### Foist — level 2 (code 2.3)

*v1.4 tagline: pickpocket from afar*

**Tags:** util · **Roll:** Craft · **Save:** none

**Effect:** Sorcerie visible items teleport to your hands.

#### Nip — level 2 (code 2.4)

*v1.4 tagline: summon loose object*

**Tags:** util · **Roll:** Craft · **Save:** none

**Effect:** Sorcerie visible items teleport to your hands.

#### Second-Story Man — level 2 (code 2.5)

*v1.4 tagline: sure climb*

**Tags:** util · **Roll:** Craft · **Save:** none

**Effect:** You can climb surfaces like a spider for Sorcerie turns.

#### Spring — level 2 (code 2.6)

*v1.4 tagline: enhanced leap*

**Tags:** util · **Roll:** Craft · **Save:** none

**Effect:** You can jump up to Sorcerie × 10'.

### 3rd level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 3.1 | Budge Barrel | util |
| 3.2 | Darkmans Cloak | util |
| 3.3 | Dog's Leg | util |
| 3.4 | Rearward Glim | info |
| 3.5 | Rum Dubber | util |
| 3.6 | Upright Man's Word | ctrl |

#### Budge Barrel — level 3 (code 3.1)

*v1.4 tagline: conceal goods*

**Tags:** util · **Roll:** Craft · **Save:** none

**Effect:** Hide Sorcerie slot-worth of goods in plain sight for Sorcerie hours.

#### Darkmans Cloak — level 3 (code 3.2)

*v1.4 tagline: shadow invisibility*

**Tags:** util · **Roll:** Craft · **Save:** none

**Effect:** Sorcerie creatures are invisible for as long as they can hold their breath.

#### Dog's Leg — level 3 (code 3.3)

*v1.4 tagline: tail undetected*

**Tags:** util · **Roll:** Craft · **Save:** none

**Effect:** Tail one target undetected for Sorcerie hours (Craft vs their passive notice).

#### Rearward Glim — level 3 (code 3.4)

*v1.4 tagline: spot followers*

**Tags:** info · **Roll:** Craft · **Save:** none

**Effect:** You create a magic eye that flies around under your control for Sorcerie turns. You can see through it as well as your normal eyes.

#### Rum Dubber — level 3 (code 3.5)

*v1.4 tagline: master lockpick*

**Tags:** util · **Roll:** Craft · **Save:** none

**Effect:** Sorcerie locks unlock.

#### Upright Man's Word — level 3 (code 3.6)

*v1.4 tagline: command street folk*

**Tags:** ctrl · **Roll:** Heart · **Save:** Heart

**Effect:** A creature obeys a single, Sorcerie-word command that doesn't harm it.

### 4th level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 4.1 | Dimber Damber's Web | info |
| 4.2 | Maze Whispers | info |
| 4.3 | Perfect Mort | util |
| 4.4 | Rum Ken | info |
| 4.5 | Sharper's Nose | info |
| 4.6 | Topping Cove | util |

#### Dimber Damber's Web — level 4 (code 4.1)

*v1.4 tagline: silent signals*

**Tags:** info · **Roll:** Plan A · **Save:** none

**Effect:** Silent hand-signals to Sorcerie allies within line of sight for Sorcerie hours.

#### Maze Whispers — level 4 (code 4.2)

*v1.4 tagline: distant eavesdrop*

**Tags:** info · **Roll:** Craft · **Save:** none

**Effect:** A creature can hear all sounds up to 120' away for Sorcerie turns.

#### Perfect Mort — level 4 (code 4.3)

*v1.4 tagline: full impersonation*

**Tags:** util · **Roll:** Craft · **Save:** none

**Effect:** You may alter the look of Sorcerie humanoids as long as they remain humanoid. Lasts until the subjects speak.

#### Rum Ken — level 4 (code 4.4)

*v1.4 tagline: find safehouse*

**Tags:** info · **Roll:** Plan A · **Save:** none

**Effect:** Locate the nearest safehouse or fence in a settlement.

#### Sharper's Nose — level 4 (code 4.5)

*v1.4 tagline: sniff out weakness*

**Tags:** info · **Roll:** Craft · **Save:** none

**Effect:** A creature can smell all scents up to 120' away for Sorcerie turns.

#### Topping Cove — level 4 (code 4.6)

*v1.4 tagline: cross rooftops*

**Tags:** util · **Roll:** Craft · **Save:** none

**Effect:** You can climb surfaces like a spider for Sorcerie turns.

### 5th level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 5.1 | Bulk the Watch | util |
| 5.2 | Darkmans Veil | util |
| 5.3 | Ken Miller | util |
| 5.4 | Mill the Watch | util |
| 5.5 | Mizzle | util |
| 5.6 | Rum Mort | util |

#### Bulk the Watch — level 5 (code 5.1)

*v1.4 tagline: distract guards*

**Tags:** util · **Roll:** Craft · **Save:** none

**Effect:** Sorcerie guards rush to a false alarm you trigger.

#### Darkmans Veil — level 5 (code 5.2)

*v1.4 tagline: unseen in crowds*

**Tags:** util · **Roll:** Craft · **Save:** none

**Effect:** Sorcerie creatures are invisible for as long as they can hold their breath.

#### Ken Miller — level 5 (code 5.3)

*v1.4 tagline: break into any building*

**Tags:** util · **Roll:** Craft · **Save:** none

**Effect:** Sorcerie locks unlock.

#### Mill the Watch — level 5 (code 5.4)

*v1.4 tagline: silence sentry*

**Tags:** util · **Roll:** Craft · **Save:** none

**Effect:** One sentry distracted Sorcerie × 10 minutes.

#### Mizzle — level 5 (code 5.5)

*v1.4 tagline: vanish when spotted*

**Tags:** util · **Roll:** Craft · **Save:** none

**Effect:** When spotted, vanish into crowd or shadow — one automatic escape if a plausible hide exists.

#### Rum Mort — level 5 (code 5.6)

*v1.4 tagline: false identity*

**Tags:** util · **Roll:** Craft · **Save:** none

**Effect:** Forge papers and bearing for a false identity; passes casual scrutiny Sorcerie days.

### 6th level spells

| Code | Spell | Tags |
| --- | --- | --- |
| 6.1 | Blood Brotherhood | ctrl |
| 6.2 | Darkmans Twin | ward |
| 6.3 | Deathless Brotherhood | info |
| 6.4 | Jarkman's Gift | util |
| 6.5 | Many Faces | util |
| 6.6 | Prince of Thieves | ctrl |

#### Blood Brotherhood — level 6 (code 6.1)

*v1.4 tagline: compel loyalty for job*

**Tags:** ctrl · **Roll:** Heart · **Save:** Heart

**Effect:** Sorcerie street folk swear a one-job loyalty (Heart save to break).

#### Darkmans Twin — level 6 (code 6.2)

*v1.4 tagline: shadow twin*

**Tags:** ward · **Roll:** Craft · **Save:** none

**Effect:** Sorcerie illusory copies of you, under your control, appear.

#### Deathless Brotherhood — level 6 (code 6.3)

*v1.4 tagline: speak with dead thieves*

**Tags:** info · **Roll:** Craft · **Save:** none

**Effect:** The spirit of a touched dead body appears and will answer Sorcerie questions (if it can).

#### Jarkman's Gift — level 6 (code 6.4)

*v1.4 tagline: living forgeries*

**Tags:** util · **Roll:** Craft · **Save:** none

**Effect:** Create Sorcerie fragile, porcelain copies of items you can see.

#### Many Faces — level 6 (code 6.5)

*v1.4 tagline: shift personas*

**Tags:** util · **Roll:** Craft · **Save:** none

**Effect:** You may alter the look of Sorcerie humanoids as long as they remain humanoid. Lasts until the subjects speak.

#### Prince of Thieves — level 6 (code 6.6)

*v1.4 tagline: inspire loyalty*

**Tags:** ctrl · **Roll:** Heart · **Save:** Heart

**Effect:** Sorcerie thieves in earshot will not betray you for Sorcerie days unless offered more gold than you name.
