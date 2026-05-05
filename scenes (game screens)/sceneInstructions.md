# Scenes Folder

Contains all game screens.

## Structure

### main_menu/
Build:
- Start game
- Mode selection
- Leaderboard button
- Settings button

### game/
Build:
- Typing interface
- Timer
- Score/WPM display
- Input handling

### results/
Build:
- Final score
- Accuracy and WPM
- Submit score button

### leaderboard/
Build:
- Display top scores from API

---

## Project Requirement Coverage

### ✔ UI/UX Requirement
- Multiple screens (menu, game, results, leaderboard)
- Clean navigation between scenes

### ✔ API Integration
- Leaderboard scene fetches data from backend

### ✔ Architecture Pattern
- Scene-based structure (Godot best practice)

### ✔ State Handling
- Game state transitions between scenes
