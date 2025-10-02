import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:pubg_gfx_tool/core/router/app_router.dart';
import 'package:pubg_gfx_tool/models/onboarding_page.dart';
import 'package:pubg_gfx_tool/services/storage/storage_service.dart';
import 'package:pubg_gfx_tool/shared/widgets/glow_button.dart';
import 'package:pubg_gfx_tool/theme/app_colors.dart';

/// Onboarding screen with page view
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  Future<void> _completeOnboarding() async {
    await StorageService.instance.setBool('onboarding_completed', true);
    if (mounted) {
      context.go(AppRoutes.dashboard);
    }
  }

  void _skipOnboarding() {
    _completeOnboarding();
  }

  void _nextPage() {
    if (_currentPage < OnboardingData.pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _completeOnboarding();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Skip button
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: _skipOnboarding,
                child: Text(
                  'SKIP',
                  style: TextStyle(
                    color: AppColors.neonBlue,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),

            // Page view
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: OnboardingData.pages.length,
                itemBuilder: (context, index) {
                  final page = OnboardingData.pages[index];
                  return _OnboardingPageWidget(page: page);
                },
              ),
            ),

            // Page indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                OnboardingData.pages.length,
                (index) => _PageIndicator(
                  isActive: index == _currentPage,
                ),
              ),
            ),

            SizedBox(height: 32.h),

            // Action button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: GlowButton(
                text: _currentPage == OnboardingData.pages.length - 1
                    ? 'GET STARTED'
                    : 'NEXT',
                onPressed: _nextPage,
                icon: _currentPage == OnboardingData.pages.length - 1
                    ? Icons.rocket_launch
                    : Icons.arrow_forward,
              ),
            ),

            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}

class _OnboardingPageWidget extends StatelessWidget {
  final OnboardingPage page;

  const _OnboardingPageWidget({required this.page});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200.w,
            height: 200.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.primaryGradient,
              boxShadow: [
                AppColors.softGlow(AppColors.neonBlue),
              ],
            ),
            child: const Icon(
              Icons.auto_awesome,
              size: 80,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 48.h),
          Text(
            page.title,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 28.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.0,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),
          Text(
            page.description,
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 16.sp,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _PageIndicator extends StatelessWidget {
  final bool isActive;

  const _PageIndicator({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      width: isActive ? 24.w : 8.w,
      height: 8.h,
      decoration: BoxDecoration(
        color: isActive ? AppColors.neonBlue : AppColors.textSecondary,
        borderRadius: BorderRadius.circular(4.r),
        boxShadow: isActive
            ? [AppColors.softGlow(AppColors.neonBlue)]
            : null,
      ),
    );
  }
}
