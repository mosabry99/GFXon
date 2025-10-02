# AGENTS.md

Agents use this file as the “briefing packet” to understand how to build, test, run, and reason about Flutter projects.

---

## Build & Test

- Get dependencies:
  ```bash
  flutter pub get
  ```
- Analyze code (lint):
  ```bash
  flutter analyze
  ```
- Run all tests:
  ```bash
  flutter test
  ```
- Run integration tests (if any):
  ```bash
  flutter test integration_test
  ```

---

## Run Locally / Dev Setup

- Start the app on an emulator or device:
  ```bash
  flutter run
  ```
- Build for Android:
  ```bash
  flutter build apk --release
  ```
- Build for iOS:
  ```bash
  flutter build ios --release
  ```
- Build for web:
  ```bash
  flutter build web
  ```

---

## Architecture Overview

This project is a Flutter application following clean architecture principles:
- `lib/` → main app code
  - `ui/` → screens, widgets
  - `data/` → repositories, API calls, models
  - `domain/` → business logic, entities, use cases
- `test/` → unit and widget tests
- `integration_test/` → integration tests

---

## External Services & Config

- APIs & backend integrations (add details here)  
- Environment variables handled via `.env` or `flutter_dotenv`  
- Example env variables:
  ```text
  API_URL=https://api.example.com
  API_KEY=your_api_key
  ```

---

## Git Workflows

- Branch naming:
  - `feature/<slug>` for new features
  - `bugfix/<slug>` for fixes
- Commit message style:
  - `feat:` for features
  - `fix:` for bug fixes
  - `chore:` for maintenance
- PR rules:
  1. All tests pass
  2. Lint passes (`flutter analyze`)
  3. PR includes screenshots if UI changes
  4. Clear description of changes

---

## Conventions & Patterns

- Use `provider` / `bloc` / `riverpod` (choose one) for state management  
- Follow Dart/Flutter style guide  
- Organize widgets by feature/module  
- Keep business logic outside UI  

---

## Gotchas & Known Limitations

- iOS builds require macOS + Xcode  
- Web builds may need additional configuration for service workers  
- Always run `flutter clean` if facing build cache issues  

---

## Domain Vocabulary (Optional)

- Screen → A top-level page in the app  
- Widget → Reusable UI component  
- Bloc / Provider → State management unit  

---

## Summary

1. Place `AGENTS.md` at repo root  
2. Document commands, workflows, and conventions  
3. Agents and contributors will use it for consistency  
