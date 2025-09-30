import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/gfx_profile.dart';
import '../../theme/app_colors.dart';
import 'glow_card.dart';

/// Preset card widget for displaying GFX presets
class PresetCard extends StatelessWidget {
  final GfxProfile preset;
  final VoidCallback onTap;
  final Color? accentColor;

  const PresetCard({
    super.key,
    required this.preset,
    required this.onTap,
    this.accentColor,
  });

  Color _getPresetColor() {
    if (accentColor != null) return accentColor!;
    
    switch (preset.name) {
      case 'Balanced':
        return AppColors.neonBlue;
      case 'Smooth':
        return AppColors.neonGreen;
      case 'HD Graphics':
        return AppColors.neonPurple;
      case 'Ultra HD':
        return AppColors.neonPink;
      case 'Extreme FPS':
        return AppColors.neonOrange;
      default:
        return AppColors.neonBlue;
    }
  }

  IconData _getPresetIcon() {
    switch (preset.name) {
      case 'Balanced':
        return Icons.balance;
      case 'Smooth':
        return Icons.speed;
      case 'HD Graphics':
        return Icons.hd;
      case 'Ultra HD':
        return Icons.4k;
      case 'Extreme FPS':
        return Icons.bolt;
      default:
        return Icons.settings;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getPresetColor();

    return GlowCard(
      glowColor: color,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: color.withOpacity(0.4)),
                ),
                child: Icon(
                  _getPresetIcon(),
                  color: color,
                  size: 28.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      preset.name,
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '${preset.fps} FPS • ${preset.resolution.displayName}',
                      style: TextStyle(
                        color: color,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: color.withOpacity(0.6),
                size: 16.sp,
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            preset.description,
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13.sp,
              height: 1.4,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
