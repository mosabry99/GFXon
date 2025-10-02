import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:pubg_gfx_tool/services/analytics/analytics_service.dart';
import 'package:pubg_gfx_tool/services/storage/storage_service.dart';

/// Bootstrap the application with required services
/// 
/// Initializes Hive for local storage, Firebase for analytics,
/// and any other required services before the app starts.
Future<void> bootstrap() async {
  try {
    // Initialize Hive for local storage
    await Hive.initFlutter();
    
    // Register Hive adapters here if using custom models
    // Hive.registerAdapter(GfxProfileAdapter());
    
    // Initialize Firebase (optional - can be disabled if not needed)
    try {
      await Firebase.initializeApp();
      debugPrint('✅ Firebase initialized successfully');
    } catch (e) {
      debugPrint('⚠️  Firebase initialization skipped: $e');
      debugPrint('   (This is OK if Firebase is not configured yet)');
    }
    
    // Initialize storage service
    await StorageService.instance.init();
    debugPrint('✅ Storage service initialized');
    
    // Initialize analytics service
    await AnalyticsService.instance.init();
    debugPrint('✅ Analytics service initialized');
    
    debugPrint('✅ Bootstrap completed successfully');
  } catch (e, stackTrace) {
    debugPrint('❌ Bootstrap failed: $e');
    debugPrint('Stack trace: $stackTrace');
    rethrow;
  }
}
