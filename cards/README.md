# Burners printable spell cards

How to make physical spell cards for a Sorcerer’s hand. First worked example:
Lothian Campaign → Bellemy Wrenfeather
(`gm/campaigns/Lothian Campaign/Characters/bellemy-spell-cards/`).

This folder is **not** part of the published Jekyll site (excluded in `_config.yml`).
It is a toolkit for table printouts.

## Why cards

Burners already treats spells as cards (`markdown/burners-sorcerie.md`):

| Zone | Table move |
| --- | --- |
| **Ready** | Face-up, upright |
| **Tapped** | Rotate 90° after cast (discard, or leave out if lasting) |
| **In play** | Lasting effect still running |
| **Burned** | Face-down / exile — fuel for recast or copy; still fills hand size |

Known spells live in the **spellbook** (deck). **Hand size** = Arcana slot count.
You may know more spells than you can hold ready.

## Files here

| File | Role |
| --- | --- |
| `spell-cards.css` | Shared print CSS — copy into a character card kit |
| `spell-card-template.html` | Minimal starter sheet (one sample face + back + zones) |
| `README.md` | This brief |

For a real PC kit, put a folder next to their character note (as with Bellemy), copy
these two files in, and fill faces from `markdown/burners-spells.md`.

## Workflow (next time)

1. List the character’s **known spells** (and optionally a shared back + zones reminder).
2. Copy `spell-cards.css` + `spell-card-template.html` into the campaign character folder
   (rename template → `index.html`).
3. For each spell, pull the exact line from `markdown/burners-spells.md`
   (`School N: effect`). Tighten only if text overflows the box.
4. Draw a small **B&W SVG** glyph in the art frame (stroke-only; no fills except tiny
   pupils/centers). Leave the art box sized so a sketch can be taped over later.
5. Open `index.html` in Chrome → Print → Letter → **Actual size / 100%** → cardstock.
6. Cut on the outer black border.

## Card anatomy

```
┌─────────────────────────┐
│ NAME              [L:N] │  spell level = min Fuel dice in combat
│ School · Instant/Lasting│  type line (+ Control, Free-known, …)
├─────────────────────────┤
│      [SVG line art]     │  ~1.15" art frame
├─────────────────────────┤
│ Rules text              │  Burners wording; plain table language
│                         │
│ Cost · Tap · Tags       │  footer
└─────────────────────────┘
```

### Tags that earn a footer/type callout

- **Instant** vs **Lasting** (lasting → “Tap → In play”)
- **Control** — Defend vs cast total, not HP (e.g. Bewitch)
- **Free-known** — Read Magic (always known, no slot to know)

## Sizing

True **MTG / poker: 2.5" × 3.5"**. Do not shrink to fit — print at **Actual size / 100%**.

Letter holds a **3×2** grid (six cards) cleanly. Larger kits use page 2+; cards break
between pages (`break-inside: avoid`). CSS variables in `spell-cards.css`:

```css
--card-w: 2.5in;
--card-h: 3.5in;
--gap: 0;   /* abut edges — one shared cut line between cards */
```

A 3×3 of full-size cards overflows Letter at 100% — that is why smaller decks still
paginate rather than shrink.
## Ink / print rules

- **No page or card background fills** — `background: none` on body and `.card`.
- Black hairline frames and stroke SVG only.
- Screen decorative washes and card shadows: avoid (they sneak ink or confuse preview).
- Hide the sheet header with `.no-print` when printing.

## Prose on the cards

Match Burners / vault style: sparse bolding, no design jargon (“DC”, “scoped”,
“effect-only”), no corporate fillers. Prefer the game’s words — Fuel, cast total,
Defend, Sorcerie, tap, burn.

## MTG glossary (players who know Magic)

| Magic | Burners |
| --- | --- |
| Hand | Ready spells |
| Mana cost | Spell level (pay ≥ L Fuel in combat) |
| Tap | Rotate after cast |
| Permanent / duration | Lasting — leave in play |
| Exile | Burn (face-down) |
| Graveyard | Discard (tapped, not burned) |
| Library | Spellbook |

## Optional extras per kit

- One **card back** (“Name · Sorcerie · Spell”) so face-down burns look deliberate.
- One **Table Zones** reminder card for first sessions.
- Character sheet update when adding a known spell (hand size may still be 5).

## Do not

- Publish these kits through the Burners GitHub Pages site (keep under `cards/` or in
  campaign folders).
- Invent spell text — always copy from `burners-spells.md`.
- Use color fills or photographic art for the default B&W cardstock path.
