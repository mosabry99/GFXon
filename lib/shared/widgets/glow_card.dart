import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors.dart';

/// Glowing card widget with neon effect
class GlowCard extends StatelessWidget {
  final Widget child;
  final Color? glowColor;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final bool showGlow;

  const GlowCard({
    super.key,
    required this.child,
    this.glowColor,
    this.onTap,
    this.padding,
    this.width,
    this.height,
    this.showGlow = true,
  });

  @override
  Widget build(BuildContext context) {
    final color = glowColor ?? AppColors.neonBlue;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.darkSurface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
        boxShadow: showGlow
            ? [
                AppColors.softGlow(color),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16.r),
          child: Padding(
            padding: padding ?? EdgeInsets.all(16.w),
            child: child,
          ),
        ),
      ),
    );
  }
}
