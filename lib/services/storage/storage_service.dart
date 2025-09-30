import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Local storage service using SharedPreferences and Hive
/// 
/// This service provides a unified interface for storing and retrieving
/// simple key-value pairs (SharedPreferences) and complex objects (Hive).
class StorageService {
  StorageService._();
  
  static final StorageService instance = StorageService._();

  SharedPreferences? _prefs;
  Box? _settingsBox;
  Box? _profilesBox;

  /// Initialize the storage service
  Future<void> init() async {
    try {
      // Initialize SharedPreferences
      _prefs = await SharedPreferences.getInstance();
      debugPrint('✅ SharedPreferences initialized');

      // Initialize Hive boxes
      _settingsBox = await Hive.openBox('app_settings');
      _profilesBox = await Hive.openBox('gfx_profiles');
      debugPrint('✅ Hive boxes opened');
    } catch (e) {
      debugPrint('❌ Storage initialization error: $e');
      rethrow;
    }
  }

  // ==================== SharedPreferences Methods ====================

  /// Save a string value
  Future<bool> setString(String key, String value) async {
    try {
      return await _prefs?.setString(key, value) ?? false;
    } catch (e) {
      debugPrint('Error saving string: $e');
      return false;
    }
  }

  /// Get a string value
  String? getString(String key) {
    try {
      return _prefs?.getString(key);
    } catch (e) {
      debugPrint('Error getting string: $e');
      return null;
    }
  }

  /// Save a boolean value
  Future<bool> setBool(String key, bool value) async {
    try {
      return await _prefs?.setBool(key, value) ?? false;
    } catch (e) {
      debugPrint('Error saving bool: $e');
      return false;
    }
  }

  /// Get a boolean value
  bool? getBool(String key) {
    try {
      return _prefs?.getBool(key);
    } catch (e) {
      debugPrint('Error getting bool: $e');
      return null;
    }
  }

  /// Save an integer value
  Future<bool> setInt(String key, int value) async {
    try {
      return await _prefs?.setInt(key, value) ?? false;
    } catch (e) {
      debugPrint('Error saving int: $e');
      return false;
    }
  }

  /// Get an integer value
  int? getInt(String key) {
    try {
      return _prefs?.getInt(key);
    } catch (e) {
      debugPrint('Error getting int: $e');
      return null;
    }
  }

  /// Save a double value
  Future<bool> setDouble(String key, double value) async {
    try {
      return await _prefs?.setDouble(key, value) ?? false;
    } catch (e) {
      debugPrint('Error saving double: $e');
      return false;
    }
  }

  /// Get a double value
  double? getDouble(String key) {
    try {
      return _prefs?.getDouble(key);
    } catch (e) {
      debugPrint('Error getting double: $e');
      return null;
    }
  }

  /// Remove a key
  Future<bool> remove(String key) async {
    try {
      return await _prefs?.remove(key) ?? false;
    } catch (e) {
      debugPrint('Error removing key: $e');
      return false;
    }
  }

  /// Clear all preferences
  Future<bool> clearAll() async {
    try {
      return await _prefs?.clear() ?? false;
    } catch (e) {
      debugPrint('Error clearing preferences: $e');
      return false;
    }
  }

  // ==================== Hive Methods ====================

  /// Get the settings box
  Box? get settingsBox => _settingsBox;

  /// Get the profiles box
  Box? get profilesBox => _profilesBox;

  /// Save a value to settings box
  Future<void> saveSetting(String key, dynamic value) async {
    try {
      await _settingsBox?.put(key, value);
    } catch (e) {
      debugPrint('Error saving setting: $e');
    }
  }

  /// Get a value from settings box
  dynamic getSetting(String key, {dynamic defaultValue}) {
    try {
      return _settingsBox?.get(key, defaultValue: defaultValue);
    } catch (e) {
      debugPrint('Error getting setting: $e');
      return defaultValue;
    }
  }

  /// Save a profile
  Future<void> saveProfile(String key, Map<String, dynamic> profile) async {
    try {
      await _profilesBox?.put(key, profile);
      debugPrint('✅ Profile saved: $key');
    } catch (e) {
      debugPrint('❌ Error saving profile: $e');
    }
  }

  /// Get a profile
  Map<String, dynamic>? getProfile(String key) {
    try {
      final data = _profilesBox?.get(key);
      if (data != null && data is Map) {
        return Map<String, dynamic>.from(data);
      }
      return null;
    } catch (e) {
      debugPrint('Error getting profile: $e');
      return null;
    }
  }

  /// Get all profiles
  List<Map<String, dynamic>> getAllProfiles() {
    try {
      final profiles = <Map<String, dynamic>>[];
      final keys = _profilesBox?.keys ?? [];
      
      for (final key in keys) {
        final data = _profilesBox?.get(key);
        if (data != null && data is Map) {
          profiles.add(Map<String, dynamic>.from(data));
        }
      }
      
      return profiles;
    } catch (e) {
      debugPrint('Error getting all profiles: $e');
      return [];
    }
  }

  /// Delete a profile
  Future<void> deleteProfile(String key) async {
    try {
      await _profilesBox?.delete(key);
      debugPrint('✅ Profile deleted: $key');
    } catch (e) {
      debugPrint('❌ Error deleting profile: $e');
    }
  }

  /// Clear all profiles
  Future<void> clearProfiles() async {
    try {
      await _profilesBox?.clear();
      debugPrint('✅ All profiles cleared');
    } catch (e) {
      debugPrint('❌ Error clearing profiles: $e');
    }
  }
}
