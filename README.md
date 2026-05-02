# Typing Game (Godot)

A typing speed game with API integration, leaderboard, and persistent stats.

## Project Requirements Covered

### Main Features
- Version control (GitHub)
- Server-side controller (score/leaderboard API)
- 2+ HTTP API calls:
  - GET words/quotes
  - POST score
  - GET leaderboard
- Client-side data model classes
- Well-designed UI/UX (multiple scenes)

### Additional Features
- Architecture pattern (scene + managers)
- Persistent storage (settings + scores)
- Async/concurrency (HTTP + audio)
- Validation (usernames, scores)
- 3rd-party API (words/quotes)
- API testing (Postman/curl)

## Core Features to Build
- Typing gameplay system
- Score/WPM/accuracy system
- Leaderboard system
- Settings (audio, difficulty)
- Optional modes (quote mode, daily challenge)

## Team Responsibilities
- Person 1: UI + scenes
- Person 2: Backend + API
- Person 3: Gameplay + integration

## Done When
- Player can complete a typing round
- Score is calculated and displayed
- Score can be saved
- Leaderboard loads from API
- UI is polished for presentation