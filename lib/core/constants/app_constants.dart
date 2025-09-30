/// Application-wide constants
class AppConstants {
  AppConstants._();
  
  // App Info
  static const String appName = 'PUBG GFX Tool';
  static const String appVersion = '1.0.0';
  static const String appDescription = 
      'Optimize your PUBG Mobile gaming experience with custom graphics settings';
  
  // Storage Keys
  static const String themeKey = 'theme_mode';
  static const String languageKey = 'language';
  static const String lastProfileKey = 'last_applied_profile';
  static const String onboardingKey = 'onboarding_completed';
  
  // Hive Box Names
  static const String profilesBox = 'gfx_profiles';
  static const String settingsBox = 'app_settings';
  
  // URLs
  static const String feedbackUrl = 'mailto:support@pubggfxtool.com';
  static const String privacyPolicyUrl = 'https://pubggfxtool.com/privacy';
  static const String termsOfServiceUrl = 'https://pubggfxtool.com/terms';
  static const String tutorialsUrl = 'https://pubggfxtool.com/tutorials';
  
  // Animation Durations
  static const int defaultAnimationDuration = 300;
  static const int splashDuration = 2000;
  static const int shimmerDuration = 1500;
  
  // Dimensions
  static const double defaultBorderRadius = 16.0;
  static const double defaultPadding = 16.0;
  static const double cardElevation = 4.0;
  
  // GFX Settings Limits
  static const int minFps = 20;
  static const int maxFps = 120;
  static const int defaultFps = 60;
}
