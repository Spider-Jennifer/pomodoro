# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

**始终使用中文回复。**

## Project overview

番茄钟 (Pomodoro Timer) — a single-file, zero-dependency Pomodoro timer web app.

## Development

- No build step, no package manager, no dependencies. Just open `pomodoro.html` in a browser.
- All state (settings, tasks, stats) is persisted to `localStorage` — no server/backend.

## Architecture

`pomodoro.html` is a self-contained app with inline CSS and JS. Key JS concepts:

- **State machine**: `MODE` (work/shortBreak/longBreak), `STATUS` (idle/running/paused). See `timerEnd()` for transitions.
- **Timer**: `setInterval`-based 1-second tick. Ring progress computed from `RING_CIRCUMFERENCE` and `remainingSeconds / totalSeconds`.
- **Persistence**: `loadFromStorage(key, fallback)` wraps `localStorage.getItem` with JSON parse and error swallowing. Keys: `pomodoro_settings`, `pomodoro_tasks`, `pomodoro_stats`.
- **Audio**: Web Audio API via `getAudioContext()` — beep sequences defined as arrays of `[frequency, duration, offset, gain]`.
- **DOM refs**: `$` object lazily populated in `init()` via `getElementById` for all interactive elements.

`番茄钟/` contains VS Code C/C++ config files that are unrelated to the actual project.
