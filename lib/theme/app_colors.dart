import 'package:flutter/material.dart';

/// Application color palette with gamer-style neon colors
class AppColors {
  AppColors._();

  // Dark theme colors (primary)
  static const Color darkBackground = Color(0xFF0a0e27);
  static const Color darkSurface = Color(0xFF16213e);
  static const Color darkCard = Color(0xFF1a1a2e);

  // Light theme colors
  static const Color lightBackground = Color(0xFFf5f7fa);
  static const Color lightSurface = Color(0xFFffffff);

  // Neon accent colors (gamer style)
  static const Color neonBlue = Color(0xFF00d4ff);
  static const Color neonPurple = Color(0xFF9d4edd);
  static const Color neonPink = Color(0xFFff006e);
  static const Color neonGreen = Color(0xFF39ff14);
  static const Color neonOrange = Color(0xFFff9e00);
  static const Color neonYellow = Color(0xFFffff00);

  // Text colors
  static const Color textPrimary = Color(0xFFffffff);
  static const Color textSecondary = Color(0xFFa0a0a0);
  static const Color textTertiary = Color(0xFF6c757d);

  // Status colors
  static const Color successGreen = Color(0xFF00ff88);
  static const Color warningYellow = Color(0xFFffd60a);
  static const Color errorRed = Color(0xFFff0054);
  static const Color infoBlue = Color(0xFF00b4d8);

  // Gradient colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [neonBlue, neonPurple],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [neonPink, neonOrange],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient successGradient = LinearGradient(
    colors: [neonGreen, neonBlue],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Card gradient with opacity
  static LinearGradient cardGradient = LinearGradient(
    colors: [
      darkSurface,
      darkSurface.withOpacity(0.8),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Glow effect colors
  static BoxShadow neonGlow(Color color) {
    return BoxShadow(
      color: color.withOpacity(0.6),
      blurRadius: 20,
      spreadRadius: 2,
    );
  }

  static BoxShadow softGlow(Color color) {
    return BoxShadow(
      color: color.withOpacity(0.3),
      blurRadius: 10,
      spreadRadius: 1,
    );
  }
}
