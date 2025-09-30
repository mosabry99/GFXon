import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/tutorial.dart';
import '../../../shared/widgets/glow_card.dart';
import '../../../theme/app_colors.dart';

/// Tutorials and tips screen
class TutorialsScreen extends StatelessWidget {
  const TutorialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TIPS & TUTORIALS'),
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.all(16.w),
          itemCount: TutorialData.all.length,
          itemBuilder: (context, index) {
            final tutorial = TutorialData.all[index];
            return Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: GlowCard(
                glowColor: AppColors.neonPurple,
                onTap: () {
                  // Show tutorial details
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tutorial.title,
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      tutorial.description,
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
