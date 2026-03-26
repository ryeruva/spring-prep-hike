# Meal Plan Master Prompt — Spring Prep Hike

This prompt can be reused to generate a complete backpacking meal plan for future trips. Copy and fill in the bracketed sections.

---

## How to Use

Paste the following into a new Claude conversation and fill in the `[BRACKETS]`:

---

## Master Prompt

```
I'm planning a backpacking trip and need a complete meal plan. Here are the details:

TRIP
- Name: [Trip name]
- Dates: [Start date] to [End date]
- Duration: [N] days, [N] nights
- Route: [Description or trailhead → exit]
- Daily mileage: [e.g. Day 1: 10 mi, Day 2: 6 mi, Day 3: 9 mi]
- Elevation gain/loss per day: [e.g. +3,400 ft / −2,200 ft]

GROUP
- Total participants: [N]
- Bear can structure: [e.g. 4 scout cans × 3 people + 2 adult cans × 4 people]
- Ages: [e.g. 11–16 year old scouts + adults]
- Dietary restrictions / allergies: [e.g. 1 scout has tree nut allergy]

FOOD REQUIREMENTS
- Calories per person per active day (scouts): [e.g. ~2,800 kcal]
- Calories per person per active day (adults): [e.g. ~3,500 kcal]
- Max food weight per person: [e.g. ~3.5 lb/day or just "minimize"]
- No-cook meals preferred: [Yes/No/Mix]
- Hot breakfast: [Yes/No — grab & go preferred]
- Budget per person: [e.g. ~$60]
- Preferred brands/stores: [e.g. REI, Amazon, Costco, Trader Joe's]

CONSTRAINTS
- Bear canister required: [Yes/No — if yes, specify model e.g. BV500]
- Water sources: [e.g. reliable at camp, dry ridgelines — carry 2L+]
- Stoves available: [e.g. 2 JetBoil per patrol]
- Repeat meals OK: [Yes/No]

OUTPUT FORMAT
Please generate:
1. Day-by-day meal plan with quantities per bear can (adult qty / scout qty)
2. MyPlate food group analysis per meal
3. Shopping list grouped by store with bulk pricing
4. Per-can packing guide with zip-lock bag nesting (big=day, medium=meal, small=person)
5. Bear can weight estimate (food + empty can)
6. Nut allergy swap table (if applicable)
7. Separate HTML menus: one for crew, one for allergy scout
8. Excel workbook with: Overview, Meal Plan, Shopping List, Packing List, Nut Allergy tabs
```

---

## Key Decisions From Spring Prep Hike (April 2026)

These decisions worked well and are worth reusing:

| Decision | Rationale |
|---|---|
| No hot breakfast — grab & go bars | Faster camp breakdown, no fuel for food |
| Same menu all cans, qty differs by can size | Simplifies packing, reduces confusion |
| Reverse-stack packing (SAT on top) | First meal always accessible without digging |
| Nested zip-lock bags (big=day, medium=meal, small=person) | 11-year-olds can pack independently |
| Vacuum seal medium meal bags | Saves ~40% can volume vs regular zip-lock |
| Adults bring own coffee | Eliminates one SKU, adults prefer their own |
| No group reserve | Keeps weight down; adults carry protein bars anyway |
| Freeze-dried dinners (Peak Refuel) | Best flavor-to-weight ratio; 1.5 svgs/pouch |
| Allergy scout: personal labeled swap bag | Main plan unchanged for 19 others |

---

## Lessons Learned

- **Honey Stinger contingency**: Always confirm Crème Brûlée label for cashews before trip
- **Bulk Gatorade**: 40-ct packs at Walmart are significantly cheaper per pack than Amazon
- **Peak Refuel member discount**: ~10% off if ordering enough — worth joining
- **Sports Basement Basementeer**: ~10% off jerky — worth using for bulk jerky orders
- **GoMacro vs No Nuts!**: GoMacro has better flavor/macros for allergy breakfast swap at similar price
- **Tortilla count**: 8 adult / 6 scout per dinner appearance — confirm against total before ordering
- **StarKist white chicken**: Order the 12-pack, not 8 × individual; significant unit price difference

---

## File Naming Convention

| File | Purpose |
|---|---|
| `[TripName]_Crew_Meal_Plan.md` | This document — master reference |
| `[TripName]_Meal_Plan_Final.xlsx` | Full spreadsheet with all tabs |
| `[TripName]_Menu.html` | Shareable crew menu with MyPlate diagrams |
| `[TripName]_Menu_Allergy_Scout.html` | Personal menu for allergy scout |
| `[TripName]_Expenses.html` | Itemized expense report with receipt scans |
| `[TripName]_Menu.pdf` | Print-ready PDF version of crew menu |
| `sync.sh` | Auto-sync Downloads → GitHub Pages |

---

*Template created from Spring Prep Hike, April 4–6, 2026*
*Last updated: March 26, 2026*
