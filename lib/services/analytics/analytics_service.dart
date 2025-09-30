import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';

/// Analytics service wrapper for tracking user events
/// 
/// This service provides a clean interface for Firebase Analytics
/// and can be easily extended to support other analytics platforms.
class AnalyticsService {
  AnalyticsService._();
  
  static final AnalyticsService instance = AnalyticsService._();

  FirebaseAnalytics? _analytics;
  bool _isInitialized = false;

  /// Initialize the analytics service
  Future<void> init() async {
    try {
      _analytics = FirebaseAnalytics.instance;
      _isInitialized = true;
      debugPrint('✅ Analytics service initialized');
    } catch (e) {
      debugPrint('⚠️  Analytics initialization skipped: $e');
      _isInitialized = false;
    }
  }

  /// Check if analytics is available
  bool get isAvailable => _isInitialized && _analytics != null;

  // ==================== Event Tracking Methods ====================

  /// Track a custom event
  Future<void> logEvent({
    required String name,
    Map<String, dynamic>? parameters,
  }) async {
    if (!isAvailable) {
      debugPrint('📊 [Analytics disabled] Event: $name - $parameters');
      return;
    }

    try {
      await _analytics?.logEvent(
        name: name,
        parameters: parameters,
      );
      debugPrint('📊 Event logged: $name');
    } catch (e) {
      debugPrint('❌ Error logging event: $e');
    }
  }

  /// Log app opened
  Future<void> logAppOpen() async {
    await logEvent(name: 'app_open');
  }

  /// Log preset applied
  Future<void> logPresetApplied(String presetName) async {
    await logEvent(
      name: 'preset_applied',
      parameters: {
        'preset_name': presetName,
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }

  /// Log custom profile created
  Future<void> logCustomProfileCreated(String profileName) async {
    await logEvent(
      name: 'custom_profile_created',
      parameters: {
        'profile_name': profileName,
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }

  /// Log custom profile applied
  Future<void> logCustomProfileApplied(String profileName) async {
    await logEvent(
      name: 'custom_profile_applied',
      parameters: {
        'profile_name': profileName,
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }

  /// Log profile saved
  Future<void> logProfileSaved(String profileName) async {
    await logEvent(
      name: 'profile_saved',
      parameters: {
        'profile_name': profileName,
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }

  /// Log profile deleted
  Future<void> logProfileDeleted(String profileName) async {
    await logEvent(
      name: 'profile_deleted',
      parameters: {
        'profile_name': profileName,
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }

  /// Log dark mode toggled
  Future<void> logDarkModeToggled(bool isDark) async {
    await logEvent(
      name: 'dark_mode_toggled',
      parameters: {
        'is_dark': isDark,
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }

  /// Log screen view
  Future<void> logScreenView(String screenName) async {
    if (!isAvailable) return;

    try {
      await _analytics?.logScreenView(
        screenName: screenName,
      );
      debugPrint('📊 Screen view: $screenName');
    } catch (e) {
      debugPrint('❌ Error logging screen view: $e');
    }
  }

  /// Log tutorial viewed
  Future<void> logTutorialViewed(String tutorialName) async {
    await logEvent(
      name: 'tutorial_viewed',
      parameters: {
        'tutorial_name': tutorialName,
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }

  /// Log settings changed
  Future<void> logSettingsChanged(String settingName, dynamic value) async {
    await logEvent(
      name: 'settings_changed',
      parameters: {
        'setting_name': settingName,
        'value': value.toString(),
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }

  /// Log feedback submitted
  Future<void> logFeedbackSubmitted() async {
    await logEvent(
      name: 'feedback_submitted',
      parameters: {
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }

  /// Log share action
  Future<void> logShareAction(String content) async {
    await logEvent(
      name: 'share_action',
      parameters: {
        'content': content,
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }

  // ==================== User Properties ====================

  /// Set user property
  Future<void> setUserProperty({
    required String name,
    required String value,
  }) async {
    if (!isAvailable) return;

    try {
      await _analytics?.setUserProperty(
        name: name,
        value: value,
      );
      debugPrint('📊 User property set: $name = $value');
    } catch (e) {
      debugPrint('❌ Error setting user property: $e');
    }
  }

  /// Set user ID
  Future<void> setUserId(String id) async {
    if (!isAvailable) return;

    try {
      await _analytics?.setUserId(id: id);
      debugPrint('📊 User ID set: $id');
    } catch (e) {
      debugPrint('❌ Error setting user ID: $e');
    }
  }
}
