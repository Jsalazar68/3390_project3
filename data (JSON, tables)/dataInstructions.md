# Data Folder

Stores all JSON and static data used in the game.

## Structure
- config/ → settings.json (game configuration)
- words/ → word_bank.json (typing content)

## What to Build
- Word bank JSON (local fallback content)
- Settings JSON (time limit, difficulty, audio toggles)
- Optional: quote data for quote mode

## Project Requirement Coverage

### ✔ Client-Side Data Handling
- JSON files act as structured data sources
- Used to populate WordSet model

### ✔ 3rd-Party API Integration
- Data here acts as fallback if API fails
- APIManager will load external words/quotes and store/use them

### ✔ Validation
- Ensure JSON format is correct before use
- Validate loaded data before passing to gameplay

### ✔ Persistence (optional)
- Settings.json can be modified and saved locally

## Notes
- Do NOT hardcode words in scripts
- All gameplay text should come from JSON or API