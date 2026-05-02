# Scripts Folder

Contains all game logic and core systems.

## Structure

### gameplay/
Build:
- Typing input system
- Word/quote handling
- Timer system
- Score, WPM, accuracy calculations

### managers/
Build:
- GameManager.gd → controls game state and scene flow
- ScoreManager.gd → tracks scores and stats
- APIManager.gd → handles HTTP requests

### ui_logic/
Build:
- Menu buttons
- Results screen logic
- Leaderboard display logic
- Settings toggles

---

## Project Requirement Coverage

### ✔ Architecture Pattern
- Scene-based architecture
- Manager/controller pattern (GameManager, APIManager)

### ✔ Client-Side Data Model Classes
Create classes for:
- PlayerProfile
- ScoreEntry
- WordSet
- GameSession

### ✔ HTTP API Calls
Handled in APIManager:
- GET words/quotes
- POST score
- GET leaderboard

### ✔ Concurrency / Async
- HTTP requests are asynchronous
- Game continues while data loads

### ✔ Validation
- Validate input (typed words, usernames)
- Validate score before sending to backend