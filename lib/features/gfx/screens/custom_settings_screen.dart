import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pubg_gfx_tool/shared/widgets/glow_button.dart';
import 'package:pubg_gfx_tool/theme/app_colors.dart';

/// Custom GFX settings screen
class CustomSettingsScreen extends StatelessWidget {
  const CustomSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CUSTOM SETTINGS'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Customize Your Graphics',
                style: TextStyle(
                  color: AppColors.neonBlue,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 24.h),
              // Add sliders and dropdowns for settings here
              Center(
                child: Text(
                  'Custom settings UI coming soon...',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              GlowButton(
                text: 'SAVE PROFILE',
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icons.save,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
