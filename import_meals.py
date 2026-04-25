#!/usr/bin/env python3
"""Import meals from TheMealDB into Mealie, skipping fried recipes."""
import json, time, urllib.request, urllib.error

MEALIE   = "https://mealie-deployment-production.up.railway.app"
TOKEN    = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsb25nX3Rva2VuIjp0cnVlLCJpZCI6IjY3NmNlYTk2LWZkMjMtNGM0Ni05ZDdkLTNkY2UxZDk0ZDBkOCIsIm5hbWUiOiJ0MjIyIiwiaW50ZWdyYXRpb25faWQiOiJnZW5lcmljIiwiZXhwIjoxOTM0NzM1Mzg3fQ.VHI-2IGAbNRleNiYNIFpX9XrzcC9xK_MEXoQvyDXqLQ"
MEALDB   = "https://www.themealdb.com/api/json/v1/1"
FRY_WORDS = {"fry","fried","frying","stir-fry","stir fry","deep-fry","pan-fry","pan fry"}

PLAN = {
    "breakfast": ("Breakfast", 10),
    "lunch":     ("Pasta",     10),   # pasta + seafood makes varied lunches
    "dinner":    ("Chicken",   10),
}
EXTRA = [
    ("Seafood",     8),
    ("Vegetarian",  7),
    ("Lamb",        7),
    ("Beef",        8),
]

def fetch(url):
    req = urllib.request.Request(url, headers={"Accept": "application/json"})
    with urllib.request.urlopen(req, timeout=10) as r:
        return json.loads(r.read())

def mealie_post(path, body):
    data = json.dumps(body).encode()
    req = urllib.request.Request(
        f"{MEALIE}{path}", data=data, method="POST",
        headers={"Authorization": f"Bearer {TOKEN}",
                 "Content-Type": "application/json",
                 "Accept": "application/json"})
    try:
        with urllib.request.urlopen(req, timeout=30) as r:
            return json.loads(r.read()), r.status
    except urllib.error.HTTPError as e:
        return json.loads(e.read() or b"{}"), e.code

def is_fried(meal):
    text = (meal.get("strMeal","") + " " + (meal.get("strInstructions") or "")).lower()
    return any(w in text for w in FRY_WORDS)

def meal_url(meal):
    slug = meal["strMeal"].lower().replace(" ", "-")
    return f"https://www.themealdb.com/meal/{meal['idMeal']}-{slug}"

def get_category_meals(category):
    data = fetch(f"{MEALDB}/filter.php?c={category}")
    return data.get("meals") or []

def get_full_meal(meal_id):
    data = fetch(f"{MEALDB}/lookup.php?i={meal_id}")
    meals = data.get("meals") or []
    return meals[0] if meals else None

def import_meal(meal):
    url = meal_url(meal)
    result, status = mealie_post("/api/recipes/create/url", {"url": url})
    return status in (200, 201), status

imported = 0
skipped  = 0
failed   = 0

def process_category(label, category, target):
    global imported, skipped, failed
    meals = get_category_meals(category)
    count = 0
    for m in meals:
        if count >= target:
            break
        full = get_full_meal(m["idMeal"])
        if not full:
            continue
        if is_fried(full):
            print(f"  skip (fried): {full['strMeal']}")
            skipped += 1
            continue
        ok, status = import_meal(full)
        if ok:
            print(f"  + [{label}] {full['strMeal']}")
            imported += 1
            count += 1
        elif status == 422:
            print(f"  ~ already exists: {full['strMeal']}")
            count += 1  # counts toward target, already in Mealie
        else:
            print(f"  ! failed ({status}): {full['strMeal']}")
            failed += 1
        time.sleep(0.3)
    return count

print("=== Importing from TheMealDB ===\n")

print("[Breakfast — 10 target]")
process_category("breakfast", "Breakfast", 10)

print("\n[Lunch via Pasta — 10 target]")
process_category("lunch", "Pasta", 10)

print("\n[Dinner via Chicken — 10 target]")
process_category("dinner", "Chicken", 10)

print("\n[Extra: Seafood]")
process_category("dinner", "Seafood", 8)

print("\n[Extra: Vegetarian]")
process_category("lunch/dinner", "Vegetarian", 7)

print("\n[Extra: Lamb]")
process_category("dinner", "Lamb", 7)

print("\n[Extra: Beef]")
process_category("dinner", "Beef", 8)

print(f"\n=== Done: {imported} imported, {skipped} skipped (fried), {failed} failed ===")
