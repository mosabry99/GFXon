import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pubg_gfx_tool/theme/app_colors.dart';

/// Saved profiles screen
class SavedProfilesScreen extends StatelessWidget {
  const SavedProfilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SAVED PROFILES'),
      ),
      body: SafeArea(
        child: Center(
          child: Text(
            'No saved profiles yet',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 16.sp,
            ),
          ),
        ),
      ),
    );
  }
}
