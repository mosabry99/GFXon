import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:pubg_gfx_tool/core/constants/gfx_presets.dart';
import 'package:pubg_gfx_tool/core/router/app_router.dart';
import 'package:pubg_gfx_tool/services/analytics/analytics_service.dart';
import 'package:pubg_gfx_tool/services/game_launcher/game_launcher_service.dart';
import 'package:pubg_gfx_tool/shared/widgets/glow_button.dart';
import 'package:pubg_gfx_tool/shared/widgets/preset_card.dart';
import 'package:pubg_gfx_tool/theme/app_colors.dart';

/// Main dashboard screen with quick access to presets
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PUBG GFX TOOL'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              context.push(AppRoutes.settings);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome header
              _buildWelcomeHeader(context),
              
              SizedBox(height: 24.h),

              // Quick actions
              _buildQuickActions(context),

              SizedBox(height: 24.h),

              // Launch PUBG Mobile button
              _buildLaunchGameButton(context),

              SizedBox(height: 32.h),

              // Presets section
              Text(
                'QUICK PRESETS',
                style: TextStyle(
                  color: AppColors.neonBlue,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                ),
              ),
              
              SizedBox(height: 16.h),

              // Preset cards
              ...GfxPresets.all.map((preset) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: PresetCard(
                    preset: preset,
                    onTap: () {
                      _applyPreset(context, preset.name);
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          AppColors.softGlow(AppColors.neonBlue),
        ],
      ),
      child: Row(
        children: [
          const Icon(
            Icons.auto_awesome,
            color: Colors.white,
            size: 32,
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Choose a preset or customize your settings',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _QuickActionCard(
            icon: Icons.tune,
            label: 'Custom\nSettings',
            color: AppColors.neonPurple,
            onTap: () {
              context.push(AppRoutes.customSettings);
            },
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: _QuickActionCard(
            icon: Icons.bookmark,
            label: 'Saved\nProfiles',
            color: AppColors.neonPink,
            onTap: () {
              context.push(AppRoutes.savedProfiles);
            },
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: _QuickActionCard(
            icon: Icons.lightbulb,
            label: 'Tips &\nGuides',
            color: AppColors.neonOrange,
            onTap: () {
              context.push(AppRoutes.tutorials);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildLaunchGameButton(BuildContext context) {
    return GestureDetector(
      onTap: () => _launchPubgMobile(context),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.neonGreen,
              AppColors.neonGreen.withOpacity(0.7),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.neonGreen.withOpacity(0.5),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.play_circle_fill,
              color: Colors.white,
              size: 32.sp,
            ),
            SizedBox(width: 12.w),
            Text(
              'LAUNCH PUBG MOBILE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchPubgMobile(BuildContext context) async {
    // Check if game is installed
    final isInstalled = await GameLauncherService.instance.isPubgMobileInstalled();
    
    if (!isInstalled) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('⚠️ PUBG Mobile is not installed'),
            backgroundColor: AppColors.warningOrange,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        );
      }
      return;
    }

    // Launch the game
    final launched = await GameLauncherService.instance.launchPubgMobile();
    
    if (context.mounted) {
      if (launched) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('🎮 Launching PUBG Mobile...'),
            backgroundColor: AppColors.successGreen,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('❌ Failed to launch PUBG Mobile'),
            backgroundColor: AppColors.errorRed,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        );
      }
    }
  }

  Future<void> _applyPreset(BuildContext context, String presetName) async {
    // Show confirmation dialog
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.darkSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
          side: BorderSide(
            color: AppColors.neonBlue.withOpacity(0.3),
            width: 1,
          ),
        ),
        title: Row(
          children: [
            Icon(Icons.check_circle_outline, color: AppColors.neonBlue),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                'Apply $presetName?',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'This will apply the $presetName graphics profile to PUBG Mobile.',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: AppColors.neonBlue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: AppColors.neonBlue.withOpacity(0.3),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: AppColors.neonBlue,
                    size: 20.sp,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      'Make sure PUBG Mobile is closed before applying settings.',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              'CANCEL',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.neonBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Text(
              'APPLY',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      AnalyticsService.instance.logPresetApplied(presetName);
      
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('✓ $presetName preset applied successfully!'),
            backgroundColor: AppColors.successGreen,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        );
      }
    }
  }
}

class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        decoration: BoxDecoration(
          color: AppColors.darkSurface,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: color.withOpacity(0.3),
            width: 1,
          ),
          boxShadow: [
            AppColors.softGlow(color),
          ],
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: color,
              size: 32.sp,
            ),
            SizedBox(height: 8.h),
            Text(
              label,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                height: 1.3,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
