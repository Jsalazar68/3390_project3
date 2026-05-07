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

## How to Setup
- Need to install sqlite
- npm install sqlite3 for windows powershell cmd
- this was needed for usage of npm 
- Enable usage of npm for single session
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

-Download CLI commands for sqlite
SQLite Download Page 
Sqlite-tools-win-x64-3530000.zip

- head to where your sqlite database is stored
- .\sqlite3.exe test.db

- Download Node.js
- Make sure Node.js is running when using leaderboard features
- CODE FOR node.js
- const express = require('express');
const Database = require('better-sqlite3');
const path = require('path');
console.log(__dirname);
const app = express();
app.use(express.json());

// connect to SQLite file
const db = new Database(path.join(__dirname, 'test.db'));

// create dummy table
db.prepare(`
  CREATE TABLE IF NOT EXISTS logs (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    message TEXT
  )
`).run();

db.prepare(`
  CREATE TABLE IF NOT EXISTS words (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    word TEXT NOT NULL
  )
`).run();

db.prepare(`
  CREATE TABLE IF NOT EXISTS scores (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL, score INT NOT NULL
  )
`).run();


app.post('/score', (req, res) => {  
  console.log("BODY:", req.body);
  const { name, score } = req.body;
  console.log("NAME:", name);
  console.log("SCORE:", score);
  const scoreNum = Number(score);
  db.prepare('INSERT INTO scores (name, score) VALUES (?,?)').run(name, scoreNum);
//console.log(info);

  res.json({ status: "saved" });
});

app.get('/scores', (req, res) => {
console.log("SCORES ROUTE HIT");  
const rows = db.prepare('SELECT * FROM scores ORDER BY score DESC').all();
  res.json(rows);
});


// test route (to confirm Godot can reach server)
app.get('/ping', (req, res) => {
  res.json({ status: "ok", message: "server reached" });
});

// route Godot will call
app.listen(3000, () => {
  console.log("Server running on http://localhost:3000");
});



- LASTLY install godot and pull repo
  





