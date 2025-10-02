import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:pubg_gfx_tool/core/constants/gfx_presets.dart';
import 'package:pubg_gfx_tool/core/router/app_router.dart';
import 'package:pubg_gfx_tool/services/analytics/analytics_service.dart';
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

  void _applyPreset(BuildContext context, String presetName) {
    AnalyticsService.instance.logPresetApplied(presetName);
    
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
