# Backpacking Meal Plan — Master Prompt

Use this prompt to generate a complete scouting crew backpacking meal plan with spreadsheet, markdown document, and shareable HTML menu.

---

## Prompt

Create a complete backpacking meal plan for a multi-day scouting trip with the following structure, rules, and outputs.

---

### Group structure

- **Total people:** [N] split into [X] patrols of [Y] people each
- **Patrol A:** Scouts, ages 11–16
- **Patrol B:** Scouts, ages 11–16
- **Patrol C:** Adults, ages 28–48
- Each patrol cooks, carries, and packs independently for itself only
- **All patrols follow the same menu** (quantities scale per patrol of [Y])

---

### Trip details

- **Dates:** [Start date] → [End date], [N] days
- **Route:** [Trailhead] → [Exit point]
- **Daily mileage and elevation:** provide per day
- **Campsites:** provide per night
- **Water sources:** note which are reliable, which are dry, which require filtering

---

### Calorie targets

- **Scouts:** ~2,750 kcal/day on full active days
- **Adults:** ~3,750 kcal/day on full active days
- Partial days (first and last) will naturally be lower
- If adults cannot hit their target through the shared menu alone, add a **Patrol C–only supplement bag** of 2–3 items (e.g. Clif Builder's bar + PB squeeze pack) to close the gap. Pre-pack this separately and label it "Patrol C Adults Only"

---

### Meal structure rules

**Breakfasts**
- Day 1: No breakfast food carried — group eats before driving to the trailhead
- All other mornings: grab-and-go bar only (no hot food). Boil water for hot drinks only (scouts = Swiss Miss; adults = Starbucks Via Vanilla Latte). Each morning must use a **different bar brand** across the trip (e.g. MET-Rx Big100 one day, ProBar Meal another)
- Scouts opt out of hot breakfasts — bars enable faster camp departure

**Snacks**
- Individual, distributed at the start of each day
- Must include: 2 bar varieties + beef jerky (Krave Sea Salt) + Gatorade powder (electrolytes)
- No Fritos or chip bags — not practical to carry without crushing
- No Nuun — Gatorade already covers electrolytes (redundant)

**Lunches**
- All days must have a lunch
- All no-cook, eat-on-the-trail format
- **Each day must have a distinctly different lunch** — no repeated formats:
  - Example Day 1: trail charcuterie (salami + crackers + cheese — no wraps)
  - Example Day 2: shredded chicken wraps (tortillas + cheese + Clif Bar + PB squeeze)
  - Example Day 3: PB tortilla wraps (tortillas + PB squeeze only — ultralight)

**Dinners**
- Hot, communal, one-pot meals (freeze-dried pouches)
- Each night must be a **different entrée**
- Served with tortillas and/or a starchy side
- Include hot drink at dinner

**Desserts**
- Only on nights at camp (not the last night if exiting)
- Each night must be a **different dessert**
- At least one should be a hot dessert (e.g. Backpacker's Pantry Crème Brûlée)
- At least one should be no-cook (e.g. Justin's Dark Chocolate PB Cups)

---

### Ingredient and quality rules

- **Clean ingredients only:** no MSG, no artificial preservatives, no corn syrup, no nitrates (except naturally occurring)
- **Lightweight priority:** prefer high kcal/oz items; target ~2.5–3.2 lb dry food per person total
- **No Fritos, no Nuun** (removed for practical and redundancy reasons)
- **Protein pouches:** use shredded chicken (Chicken of the Sea) — not tuna (palate, scent, texture reasons)
- All items should be familiar and acceptable to scouts aged 11–16

---

### Budget rules

- **Target:** under $700 total group (all 3 patrols, all days, including reserve)
- Buy in bulk where possible: Costco or Amazon for bars, jerky, Gatorade, freeze-dried meals
  - Kind bars: Costco 24-pack (~$1.04/bar)
  - Clif Bars: Costco 24-pack (~$1.29/bar)
  - Krave Jerky: Amazon Subscribe & Save (~$2.19/bag)
  - Gatorade: Amazon 32-ct bulk (~$0.38/pack)
  - Peak Refuel: Amazon 6-pack (~$7.49/pouch)
  - MET-Rx Big100: Amazon 4-pack (~$2.19/bar)
  - ProBar Meal: Amazon 4-pack (~$2.99/bar)
  - Starbucks Via: Amazon 10-pack (~$0.99/stick)
  - Justin's PB Squeeze: Amazon 10-pack (~$1.49/pack)
  - Greenbelly Meal2GO: Amazon/REI (~$6.99/bar)

---

### Water and safety notes to include

- Flag all dry ridgelines where water must be carried from camp
- Note which sources require filtering
- Include emergency contacts for the jurisdiction
- Include hazard notes (poison oak, ticks, cattle, sun, permits)

---

### Outputs required

Produce **three files**:

#### 1. Excel spreadsheet (.xlsx) — 4 sheets

**Sheet 1: Overview**
- Patrol structure table (patrol name, members, ages, hot drink, cook-for)
- Trip schedule table (day, date, route, distance, gain, loss, campsite, meals, water, notes)
- Calorie overview table (daily target vs delivered, scouts vs adults, per day + trip total)
- Budget overview (per patrol, group total, with and without reserve)
- Water planning table (each source, reliability, required action)
- Emergency contacts and hazard table

**Sheet 2: Meal Plan (All Patrols)**
- One section per meal, per day, in chronological order
- Columns: Food Item | Qty | kcal/unit | Total kcal | $/unit | Total $ | oz/unit | Total oz | Total lb | Notes
- Blue cells = editable inputs (kcal/unit, $/unit, oz/unit)
- Formula cells = calculated (Total kcal = Qty × kcal/unit, etc.)
- Section header rows (navy) with context notes
- Column header rows (blue) before each data section
- SECTION TOTAL row (light blue) after each section
- Patrol C adult supplement sections highlighted in orange
- Dessert sections highlighted in purple
- PATROL GRAND TOTAL row and PER PERSON (÷ patrol size) row at the bottom
- Zero formula errors

**Sheet 3: Daily Summary**
- Per-person calorie, cost, and weight by meal and day
- Separate rows for scout vs adult totals where they differ
- Patrol totals table (kcal, cost, weight per patrol and group)

**Sheet 4: Shopping List**
- One row per unique item
- Columns: ☐ | Food Item | Qty/Patrol | Patrol Qty (#) | $/unit | Patrol Total $ | Group Total $ | oz/unit | Patrol oz | Patrol lb | Where to Buy
- Yellow highlight = bulk-buy items (Costco/Amazon)
- Orange highlight = Patrol C adults only
- Group Total $ column uses patrol multiplier (×3 for all patrols, ×1 for adult-only items)
- GRAND TOTAL row + per-person and per-patrol breakdown rows
- Footer note listing what was excluded and why (e.g. "No Fritos, No Nuun")
- No duplicate items, no stale/removed items

#### 2. Markdown document (.md)

- Full trip plan with per-meal tables (kcal, cost, oz columns)
- Day-by-day structure with section headers
- Calorie overview, budget overview, per-day totals
- Shopping list with bulk-buy sourcing notes
- Water planning section
- Emergency contacts and safety section

#### 3. Shareable HTML menu (single .html file)

- Clean, printable, one-page menu card
- Earthy color palette (creams, greens, golds, stone)
- Playfair Display + DM Sans typography
- Day sections with meal rows (meal type | name + detail tags | kcal/person)
- Tags for: Hot, No cook, Grab & go, Patrol C adults only
- Day total bar below each day
- Warning strips for water/hazard notes
- Legend at bottom
- Footer with budget and weight summary
- No duplication, no old items, fully self-contained (no external dependencies except Google Fonts)
- Verify: run a content check before finalizing — confirm no items from prior iterations appear, each day appears exactly once, all meal types match the final plan

---

### Verification checklist before delivering files

- [ ] Spreadsheet: zero formula errors (run recalc check)
- [ ] Shopping list: no items that were removed from the plan (Fritos, Nuun, Veggicopia hummus, tuna, Greenbelly if replaced, etc.)
- [ ] Shopping list quantities match the meal plan exactly (tortillas, PB squeezes, Gatorade, drinks all reconciled)
- [ ] Hot drinks: Swiss Miss only for scout patrols, Via Latte only for Patrol C — quantities reflect actual number of mornings with breakfast (not all 3 if Day 1 has no breakfast)
- [ ] Adult calorie target met on full active days (within 5%)
- [ ] No repeated breakfasts, lunches, dinners, or desserts
- [ ] HTML: each day section appears exactly once, no old items, budget figure correct
- [ ] Group total ≤ $700

---

### Formatting conventions

- All calorie figures are per person
- All cost figures are per patrol (unless noted as group total or per person)
- All weight figures are dry weight (no added water)
- Blue = editable input cells in the spreadsheet
- Bulk-buy prices assume Costco or Amazon case pricing — note this in the shopping list "Where to Buy" column
