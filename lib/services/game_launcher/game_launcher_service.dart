import 'dart:io';
import 'package:flutter/services.dart';

/// Service for launching PUBG Mobile game
class GameLauncherService {
  static const _channel = MethodChannel('com.pubg.gfx.tool/game_launcher');
  
  /// Singleton instance
  static final GameLauncherService instance = GameLauncherService._();
  
  GameLauncherService._();

  /// Launch PUBG Mobile Global version
  /// Returns true if launch was successful
  Future<bool> launchPubgMobile() async {
    try {
      if (Platform.isAndroid) {
        return await _launchAndroid();
      } else if (Platform.isIOS) {
        return await _launchIOS();
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  /// Launch PUBG Mobile on Android
  Future<bool> _launchAndroid() async {
    try {
      // Try to launch using package name
      final result = await _channel.invokeMethod<bool>('launchGame', {
        'packageName': 'com.tencent.ig', // PUBG Mobile Global package name
      });
      return result ?? false;
    } on PlatformException {
      return false;
    }
  }

  /// Launch PUBG Mobile on iOS
  Future<bool> _launchIOS() async {
    try {
      // iOS URL scheme for PUBG Mobile
      final result = await _channel.invokeMethod<bool>('launchGame', {
        'urlScheme': 'pubgmobile://', // PUBG Mobile URL scheme
      });
      return result ?? false;
    } on PlatformException {
      return false;
    }
  }

  /// Check if PUBG Mobile is installed
  Future<bool> isPubgMobileInstalled() async {
    try {
      if (Platform.isAndroid) {
        final result = await _channel.invokeMethod<bool>('isGameInstalled', {
          'packageName': 'com.tencent.ig',
        });
        return result ?? false;
      } else if (Platform.isIOS) {
        final result = await _channel.invokeMethod<bool>('isGameInstalled', {
          'urlScheme': 'pubgmobile://',
        });
        return result ?? false;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
