# PUBG GFX Tool - Setup Guide

This guide will help you build, customize, and deploy the PUBG GFX Tool Flutter application.

---

## 📋 Prerequisites

### Required Software

1. **Flutter SDK** (3.0.0 or higher)
   ```bash
   # Check Flutter installation
   flutter --version
   
   # Expected output: Flutter 3.x.x or higher
   ```

2. **Dart SDK** (included with Flutter)
   ```bash
   dart --version
   ```

3. **Android Studio** or **Xcode** (for mobile development)
   - Android Studio for Android builds
   - Xcode for iOS builds (macOS only)

4. **Git**
   ```bash
   git --version
   ```

5. **Code Editor**
   - VS Code (recommended) with Flutter extension
   - Android Studio with Flutter plugin
   - IntelliJ IDEA

---

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/mosabry99/GFXon.git
cd GFXon
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Run Code Generation

Generate Freezed models and JSON serialization:

```bash
# Run build_runner to generate code
flutter pub run build_runner build --delete-conflicting-outputs

# Or use watch mode for development
flutter pub run build_runner watch --delete-conflicting-outputs
```

### 4. Firebase Setup (Optional)

The app works without Firebase, but for analytics:

#### Android

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create a new project
3. Add Android app
4. Download `google-services.json`
5. Place it in `android/app/`

#### iOS

1. In Firebase Console, add iOS app
2. Download `GoogleService-Info.plist`
3. Place it in `ios/Runner/`

#### Generate Firebase Options

```bash
flutterfire configure
```

If Firebase is not configured, the app will run without analytics (graceful fallback).

### 5. Run the App

```bash
# Run on connected device/emulator
flutter run

# Run in debug mode
flutter run --debug

# Run in release mode
flutter run --release
```

---

## 🎨 Customization Guide

### 1. Branding & Colors

Edit `lib/theme/app_colors.dart`:

```dart
class AppColors {
  // Change neon colors
  static const Color neonBlue = Color(0xFF00d4ff);
  static const Color neonPurple = Color(0xFF9d4edd);
  // ... customize other colors
}
```

### 2. App Name & Package

1. Update `pubspec.yaml`:
   ```yaml
   name: your_app_name
   description: Your custom description
   ```

2. Update package name:
   ```bash
   # Use change_app_package_name package
   flutter pub global activate change_app_package_name
   flutter pub global run change_app_package_name:main com.yourcompany.appname
   ```

### 3. App Icon & Splash Screen

#### App Icon

1. Replace `assets/images/app_icon.png` with your icon (1024x1024 px)
2. Run icon generator:
   ```bash
   flutter pub run flutter_launcher_icons
   ```

#### Splash Screen

1. Replace `assets/images/splash_logo.png` with your logo
2. Generate splash screens:
   ```bash
   flutter pub run flutter_native_splash:create
   ```

### 4. GFX Presets

Edit `lib/core/constants/gfx_presets.dart`:

```dart
static final GfxProfile balanced = GfxProfile(
  id: 'preset_balanced',
  name: 'Balanced',
  description: 'Your custom description',
  resolution: Resolution.hd,
  fps: 60,
  // ... customize settings
);
```

### 5. Tutorials & Tips

Edit `lib/models/tutorial.dart` to add/modify tutorials:

```dart
static const List<Tutorial> all = [
  Tutorial(
    id: 'your_tutorial_id',
    title: 'Your Tutorial Title',
    description: 'Description',
    content: '''Your tutorial content in Markdown''',
    category: TutorialCategory.performance,
    iconPath: 'assets/icons/your_icon.png',
  ),
  // Add more tutorials
];
```

---

## 📁 Project Structure

```
lib/
├── core/              # Core app configuration
│   ├── bootstrap.dart
│   ├── constants/     # App-wide constants
│   └── router/        # Navigation setup
├── features/          # Feature modules
│   ├── dashboard/     # Main dashboard
│   ├── gfx/          # GFX settings & profiles
│   ├── onboarding/   # Splash & onboarding
│   ├── settings/     # App settings
│   └── tutorials/    # Tips & guides
├── models/           # Data models
├── services/         # Services (storage, analytics)
├── shared/           # Reusable widgets
├── theme/            # Theme & styling
└── main.dart         # Entry point
```

---

## 🏗️ Building for Production

### Android APK

```bash
# Build APK
flutter build apk --release

# Build App Bundle (for Play Store)
flutter build appbundle --release

# Output location:
# build/app/outputs/flutter-apk/app-release.apk
# build/app/outputs/bundle/release/app-release.aab
```

### iOS IPA

```bash
# Build iOS
flutter build ios --release

# Then use Xcode to archive and export
```

### Code Signing

#### Android

1. Create keystore:
   ```bash
   keytool -genkey -v -keystore ~/key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key
   ```

2. Create `android/key.properties`:
   ```
   storePassword=your_password
   keyPassword=your_password
   keyAlias=key
   storeFile=/path/to/key.jks
   ```

3. Update `android/app/build.gradle` (already configured in template)

#### iOS

Use Xcode to manage certificates and provisioning profiles.

---

## 🧪 Testing

### Run Tests

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# View coverage report
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

### Analyze Code

```bash
# Run static analysis
flutter analyze

# Check for potential issues
dart analyze
```

### Format Code

```bash
# Format all Dart files
dart format .

# Check formatting without changes
dart format --set-exit-if-changed .
```

---

## 🔧 Troubleshooting

### Common Issues

#### 1. Build Runner Errors

```bash
# Clean and regenerate
flutter clean
flutter pub get
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
```

#### 2. Firebase Errors

If Firebase is causing issues:
- Check `google-services.json` / `GoogleService-Info.plist` are in correct locations
- Or simply skip Firebase setup - the app has graceful fallback

#### 3. Dependency Conflicts

```bash
# Update dependencies
flutter pub upgrade

# Or use specific versions in pubspec.yaml
```

#### 4. Android Build Issues

```bash
# Clean project
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
flutter run
```

#### 5. iOS Build Issues

```bash
# Clean iOS build
cd ios
rm -rf Pods Podfile.lock
pod install
cd ..
flutter clean
flutter pub get
flutter run
```

---

## 📦 Assets Management

### Adding Assets

1. Add files to respective folders:
   - `assets/images/` - Images
   - `assets/icons/` - Icons
   - `assets/lottie/` - Lottie animations

2. Update `pubspec.yaml`:
   ```yaml
   flutter:
     assets:
       - assets/images/
       - assets/icons/
       - assets/lottie/
   ```

3. Run:
   ```bash
   flutter pub get
   ```

### Required Assets

Create these placeholder files if they don't exist:

```bash
mkdir -p assets/images assets/icons assets/lottie assets/fonts

# Create placeholder images (or add real ones)
touch assets/images/app_icon.png
touch assets/images/app_icon_foreground.png
touch assets/images/splash_logo.png
touch assets/images/onboarding_1.png
touch assets/images/onboarding_2.png
touch assets/images/onboarding_3.png
touch assets/images/onboarding_4.png
```

---

## 🚢 Deployment

### Google Play Store

1. Build app bundle:
   ```bash
   flutter build appbundle --release
   ```

2. Go to [Google Play Console](https://play.google.com/console)
3. Create app listing
4. Upload `app-release.aab`
5. Complete store listing, screenshots, etc.

### Apple App Store

1. Build in Xcode
2. Archive the app
3. Upload to App Store Connect
4. Submit for review

---

## 📝 Source Code Resale

### For Buyers

This codebase is designed for easy customization:

1. **Change Branding** - Update colors, fonts, and theme
2. **Modify Presets** - Edit GFX presets in constants
3. **Add Features** - Follow the feature-based architecture
4. **Localization** - Add language support easily
5. **Monetization** - Integration points for ads/IAP included

### Documentation for Buyers

- Clean, commented code
- Feature-based architecture
- Easy to extend
- Industry-standard patterns
- Comprehensive setup guide

---

## 🆘 Support

For issues or questions:

1. Check the [Troubleshooting](#troubleshooting) section
2. Review Flutter documentation: https://docs.flutter.dev
3. Check package documentation in `pubspec.yaml`

---

## 📄 License

This is a commercial source code template intended for resale.
The buyer receives full rights to customize and publish the app.

---

**Version:** 1.0.0  
**Last Updated:** September 2025  
**Compatibility:** Flutter 3.0.0+
