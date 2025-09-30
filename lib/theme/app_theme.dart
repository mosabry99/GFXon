import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../services/storage/storage_service.dart';
import 'app_colors.dart';

/// Theme mode provider
final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>(
  (ref) => ThemeModeNotifier(),
);

/// Theme mode state notifier
class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier() : super(ThemeMode.dark) {
    _loadThemeMode();
  }

  Future<void> _loadThemeMode() async {
    final savedTheme = StorageService.instance.getString('theme_mode');
    if (savedTheme != null) {
      state = ThemeMode.values.firstWhere(
        (mode) => mode.toString() == savedTheme,
        orElse: () => ThemeMode.dark,
      );
    }
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    state = mode;
    await StorageService.instance.setString('theme_mode', mode.toString());
  }

  void toggleTheme() {
    final newMode = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    setThemeMode(newMode);
  }
}

/// App theme configuration
class AppTheme {
  AppTheme._();

  // Base text theme with Orbitron for headers (gamer font)
  static TextTheme _baseTextTheme(Color textColor) {
    return TextTheme(
      displayLarge: GoogleFonts.orbitron(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: textColor,
        letterSpacing: 1.5,
      ),
      displayMedium: GoogleFonts.orbitron(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: textColor,
        letterSpacing: 1.2,
      ),
      displaySmall: GoogleFonts.orbitron(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: textColor,
        letterSpacing: 1.0,
      ),
      headlineLarge: GoogleFonts.orbitron(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
      headlineMedium: GoogleFonts.orbitron(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      headlineSmall: GoogleFonts.rajdhani(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
      titleLarge: GoogleFonts.rajdhani(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
      titleMedium: GoogleFonts.rajdhani(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      titleSmall: GoogleFonts.rajdhani(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: textColor.withOpacity(0.7),
      ),
      labelLarge: GoogleFonts.rajdhani(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: textColor,
        letterSpacing: 0.5,
      ),
      labelMedium: GoogleFonts.rajdhani(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: textColor.withOpacity(0.6),
      ),
    );
  }

  /// Dark theme (primary theme for gamer app)
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.neonBlue,
      secondary: AppColors.neonPurple,
      tertiary: AppColors.neonPink,
      surface: AppColors.darkSurface,
      background: AppColors.darkBackground,
      error: AppColors.errorRed,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: AppColors.textPrimary,
      onBackground: AppColors.textPrimary,
      onError: Colors.white,
    ),
    textTheme: _baseTextTheme(AppColors.textPrimary),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkSurface,
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: AppColors.neonBlue),
      titleTextStyle: GoogleFonts.orbitron(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        letterSpacing: 1.5,
      ),
    ),
    cardTheme: CardTheme(
      color: AppColors.darkSurface,
      elevation: 4,
      shadowColor: AppColors.neonBlue.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: AppColors.neonBlue.withOpacity(0.2),
          width: 1,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.neonBlue,
        foregroundColor: Colors.white,
        elevation: 8,
        shadowColor: AppColors.neonBlue.withOpacity(0.5),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: GoogleFonts.rajdhani(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.0,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.neonBlue,
        side: const BorderSide(color: AppColors.neonBlue, width: 2),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: GoogleFonts.rajdhani(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.0,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkSurface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.neonBlue.withOpacity(0.3)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.neonBlue.withOpacity(0.3)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.neonBlue, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.errorRed),
      ),
      labelStyle: GoogleFonts.rajdhani(
        color: AppColors.textSecondary,
      ),
      hintStyle: GoogleFonts.inter(
        color: AppColors.textSecondary,
      ),
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: AppColors.neonBlue,
      inactiveTrackColor: AppColors.neonBlue.withOpacity(0.3),
      thumbColor: AppColors.neonBlue,
      overlayColor: AppColors.neonBlue.withOpacity(0.2),
      valueIndicatorColor: AppColors.neonBlue,
      valueIndicatorTextStyle: GoogleFonts.rajdhani(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.neonBlue;
        }
        return AppColors.textSecondary;
      }),
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.neonBlue.withOpacity(0.5);
        }
        return AppColors.darkSurface;
      }),
    ),
  );

  /// Light theme (alternative theme)
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    colorScheme: const ColorScheme.light(
      primary: AppColors.neonBlue,
      secondary: AppColors.neonPurple,
      tertiary: AppColors.neonPink,
      surface: Colors.white,
      background: AppColors.lightBackground,
      error: AppColors.errorRed,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: AppColors.darkBackground,
      onBackground: AppColors.darkBackground,
      onError: Colors.white,
    ),
    textTheme: _baseTextTheme(AppColors.darkBackground),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: AppColors.neonBlue),
      titleTextStyle: GoogleFonts.orbitron(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.darkBackground,
        letterSpacing: 1.5,
      ),
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 2,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: AppColors.neonBlue.withOpacity(0.2),
          width: 1,
        ),
      ),
    ),
  );
}
