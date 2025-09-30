# PUBG GFX Tool - Professional Flutter Application

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-3.0%2B-02569B?style=for-the-badge&logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.0%2B-0175C2?style=for-the-badge&logo=dart)
![License](https://img.shields.io/badge/License-Commercial-green?style=for-the-badge)

**A production-ready PUBG Mobile GFX optimization tool with modern UI/UX and clean architecture**

[Features](#-features) • [Screenshots](#-screenshots) • [Setup](#-quick-setup) • [Documentation](#-documentation) • [Architecture](#-architecture)

</div>

---

## 📱 Overview

**PUBG GFX Tool** is a professional Flutter mobile application designed to optimize PUBG Mobile graphics settings. Built with modern architecture patterns, beautiful gamer-style UI, and production-ready code quality.

### ✨ Perfect For

- 📦 **Source Code Resale** - Clean, documented, ready-to-rebrand
- 🎓 **Learning Flutter** - Industry-standard patterns and best practices
- 🚀 **Quick Launch** - Deploy to stores with minimal customization
- 💼 **Client Projects** - Professional foundation for gaming utility apps

---

## 🎯 Features

### Core Functionality

- ✅ **Quick GFX Presets**
  - Balanced, Smooth, HD, Ultra HD, Extreme FPS
  - One-tap application
  - Device-optimized settings

- ✅ **Custom Profile Creator**
  - Fine-tune resolution, FPS, graphics quality
  - Save unlimited custom profiles
  - Export/import profiles (coming soon)

- ✅ **Local Storage**
  - All data stored locally (Hive + SharedPreferences)
  - No backend required
  - Fast and secure

- ✅ **Analytics Integration**
  - Firebase Analytics ready
  - Track user behavior
  - Graceful fallback if not configured

- ✅ **Tips & Tutorials**
  - Performance optimization guides
  - Device-specific recommendations
  - Competitive gaming tips

- ✅ **Settings & Preferences**
  - Dark/Light theme toggle
  - Multi-language ready
  - About & feedback options

### Technical Features

- 🎨 **Gamer-Style UI**
  - Neon colors with glow effects
  - Smooth animations
  - Responsive design

- 🏗️ **Clean Architecture**
  - Feature-based structure
  - Separation of concerns
  - Highly maintainable

- 🔥 **Modern Tech Stack**
  - Hooks Riverpod for state management
  - Freezed for immutable models
  - Go Router for navigation
  - Google Fonts & Lottie

- 📐 **Responsive Design**
  - Flutter ScreenUtil
  - Works on all screen sizes
  - Tablet support ready

- 🧪 **Quality Assurance**
  - Very Good Analysis linting
  - Type-safe code
  - Well-documented

---

## 🖼️ Screenshots

> **Note:** Add your app screenshots here after building the app

```
[Dashboard] [Presets] [Custom Settings] [Tutorials] [Settings]
```

---

## 🚀 Quick Setup

### Prerequisites

- Flutter SDK 3.0.0+
- Dart 3.0.0+
- Android Studio / Xcode
- Git

### Installation

```bash
# Clone repository
git clone https://github.com/mosabry99/GFXon.git
cd GFXon

# Install dependencies
flutter pub get

# Generate code (Freezed models)
flutter pub run build_runner build --delete-conflicting-outputs

# Run the app
flutter run
```

### Optional: Firebase Setup

```bash
# Install Firebase CLI
npm install -g firebase-tools

# Login to Firebase
firebase login

# Configure project
flutterfire configure
```

**Note:** App works without Firebase - analytics is optional.

---

## 📚 Documentation

### For Developers

- 📖 [Setup Guide](docs/setup.md) - Comprehensive setup and customization
- 🏗️ [Architecture Overview](#-architecture) - Code structure and patterns
- 🎨 [Theming Guide](docs/setup.md#customization-guide) - Customize colors and branding
- 🔧 [Build & Deploy](docs/setup.md#building-for-production) - Production builds

### For Buyers

- ✅ Full source code access
- ✅ Easy rebranding (colors, name, icon)
- ✅ Comprehensive documentation
- ✅ Production-ready
- ✅ Clean, commented code
- ✅ Free updates (terms apply)

---

## 🏗️ Architecture

### Project Structure

```
lib/
├── core/                    # Core configuration
│   ├── bootstrap.dart       # App initialization
│   ├── constants/           # App constants & presets
│   └── router/              # Navigation setup
│
├── features/                # Feature modules
│   ├── dashboard/           # Home screen with presets
│   ├── gfx/                 # GFX settings & profiles
│   ├── onboarding/          # Splash & onboarding
│   ├── settings/            # App settings
│   └── tutorials/           # Tips & guides
│
├── models/                  # Data models (Freezed)
│   ├── gfx_profile.dart     # GFX configuration model
│   ├── onboarding_page.dart # Onboarding data
│   └── tutorial.dart        # Tutorial content
│
├── services/                # Business logic services
│   ├── analytics/           # Analytics service
│   └── storage/             # Local storage service
│
├── shared/                  # Reusable components
│   └── widgets/             # Custom widgets
│
├── theme/                   # App theming
│   ├── app_theme.dart       # Theme configuration
│   └── app_colors.dart      # Color palette
│
└── main.dart               # Entry point
```

### Design Patterns

- **Riverpod** - State management
- **Repository Pattern** - Data access
- **Service Layer** - Business logic
- **Feature-First** - Scalable structure

---

## 🛠️ Tech Stack

| Category | Technologies |
|----------|-------------|
| **Framework** | Flutter 3.0+ |
| **Language** | Dart 3.0+ |
| **State Management** | Hooks Riverpod 2.4+ |
| **Navigation** | Go Router 12.0+ |
| **Local Storage** | Hive 2.2+, SharedPreferences |
| **Analytics** | Firebase Analytics |
| **Code Generation** | Freezed, JSON Serializable |
| **UI/UX** | Google Fonts, Lottie, ScreenUtil |
| **Linting** | Very Good Analysis |

---

## 📦 Building

### Android APK

```bash
flutter build apk --release
```

Output: `build/app/outputs/flutter-apk/app-release.apk`

### Android App Bundle

```bash
flutter build appbundle --release
```

Output: `build/app/outputs/bundle/release/app-release.aab`

### iOS

```bash
flutter build ios --release
```

Then archive in Xcode.

---

## 🎨 Customization

### Change App Name

Update `pubspec.yaml`:
```yaml
name: your_app_name
description: Your app description
```

### Change Colors

Edit `lib/theme/app_colors.dart`:
```dart
static const Color neonBlue = Color(0xFF00d4ff);  // Your color
```

### Change App Icon

1. Replace `assets/images/app_icon.png`
2. Run: `flutter pub run flutter_launcher_icons`

### Modify Presets

Edit `lib/core/constants/gfx_presets.dart`

See [Setup Guide](docs/setup.md) for detailed customization.

---

## 🧪 Quality Checks

```bash
# Run linting
flutter analyze

# Format code
dart format .

# Run tests
flutter test

# Code coverage
flutter test --coverage
```

---

## 📈 Roadmap

- [ ] Profile import/export feature
- [ ] Cloud sync (optional)
- [ ] In-app purchases for premium presets
- [ ] AdMob integration
- [ ] Multi-language support
- [ ] Social sharing
- [ ] Advanced analytics dashboard

---

## 🤝 Contributing

This is a commercial product template. For improvements or bug reports:

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Open a Pull Request

---

## 📄 License

**Commercial License**

This source code is provided as a commercial product for resale. 

- ✅ Buyers receive full rights to customize and publish
- ✅ No attribution required in published apps
- ✅ Lifetime updates included
- ❌ Cannot resell source code as-is

---

## 💬 Support

For setup help or questions:

- 📖 Read the [Setup Guide](docs/setup.md)
- 🐛 Report issues on GitHub
- 📧 Email: support@yourcompany.com

---

## 🌟 Key Highlights

### Why Choose This Template?

✅ **Production-Ready** - Deploy to stores immediately  
✅ **Modern Architecture** - Industry best practices  
✅ **Clean Code** - Well-documented and maintainable  
✅ **Beautiful UI** - Gamer-style design that sells  
✅ **No Backend** - Works completely offline  
✅ **Easy Customization** - Rebrand in minutes  
✅ **Analytics Ready** - Track user behavior  
✅ **Responsive** - Works on all screen sizes  

---

## 📞 Contact

- **Developer:** Mosabry99
- **Repository:** https://github.com/mosabry99/GFXon
- **Issues:** https://github.com/mosabry99/GFXon/issues

---

<div align="center">

**Built with ❤️ using Flutter**

[⬆ Back to Top](#pubg-gfx-tool---professional-flutter-application)

</div>