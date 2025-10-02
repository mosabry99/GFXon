import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pubg_gfx_tool/models/gfx_profile.dart';
import 'package:pubg_gfx_tool/shared/widgets/glow_button.dart';
import 'package:pubg_gfx_tool/theme/app_colors.dart';

/// Custom GFX settings screen
class CustomSettingsScreen extends StatefulWidget {
  const CustomSettingsScreen({super.key});

  @override
  State<CustomSettingsScreen> createState() => _CustomSettingsScreenState();
}

class _CustomSettingsScreenState extends State<CustomSettingsScreen> {
  // Settings state
  Resolution _resolution = Resolution.fullHd;
  int _fps = 60;
  GraphicsQuality _graphicsQuality = GraphicsQuality.hd;
  AntiAliasing _antiAliasing = AntiAliasing.enabled;
  bool _shadows = true;
  TextureQuality _textureQuality = TextureQuality.high;
  ViewDistance _viewDistance = ViewDistance.far;
  ColorStyle _colorStyle = ColorStyle.realistic;

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

              // Resolution Setting
              _buildSettingSection(
                'Resolution',
                DropdownButton<Resolution>(
                  value: _resolution,
                  isExpanded: true,
                  dropdownColor: AppColors.darkSurface,
                  style: TextStyle(color: AppColors.textPrimary, fontSize: 14.sp),
                  items: Resolution.values.map((res) {
                    return DropdownMenuItem(
                      value: res,
                      child: Text(res.displayName),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _resolution = value);
                    }
                  },
                ),
              ),

              // FPS Setting
              _buildSettingSection(
                'Frame Rate (FPS)',
                Column(
                  children: [
                    Slider(
                      value: _fps.toDouble(),
                      min: 30,
                      max: 120,
                      divisions: 6,
                      activeColor: AppColors.neonBlue,
                      inactiveColor: AppColors.neonBlue.withOpacity(0.3),
                      label: '$_fps FPS',
                      onChanged: (value) {
                        setState(() => _fps = value.toInt());
                      },
                    ),
                    Text(
                      '$_fps FPS',
                      style: TextStyle(
                        color: AppColors.neonBlue,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              // Graphics Quality
              _buildSettingSection(
                'Graphics Quality',
                DropdownButton<GraphicsQuality>(
                  value: _graphicsQuality,
                  isExpanded: true,
                  dropdownColor: AppColors.darkSurface,
                  style: TextStyle(color: AppColors.textPrimary, fontSize: 14.sp),
                  items: GraphicsQuality.values.map((quality) {
                    return DropdownMenuItem(
                      value: quality,
                      child: Text(quality.displayName),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _graphicsQuality = value);
                    }
                  },
                ),
              ),

              // Anti-Aliasing
              _buildSettingSection(
                'Anti-Aliasing',
                DropdownButton<AntiAliasing>(
                  value: _antiAliasing,
                  isExpanded: true,
                  dropdownColor: AppColors.darkSurface,
                  style: TextStyle(color: AppColors.textPrimary, fontSize: 14.sp),
                  items: AntiAliasing.values.map((aa) {
                    return DropdownMenuItem(
                      value: aa,
                      child: Text(aa.displayName),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _antiAliasing = value);
                    }
                  },
                ),
              ),

              // Shadows Toggle
              _buildSettingSection(
                'Shadows',
                SwitchListTile(
                  value: _shadows,
                  activeColor: AppColors.neonBlue,
                  title: Text(
                    _shadows ? 'Enabled' : 'Disabled',
                    style: TextStyle(color: AppColors.textPrimary),
                  ),
                  onChanged: (value) {
                    setState(() => _shadows = value);
                  },
                ),
              ),

              // Texture Quality
              _buildSettingSection(
                'Texture Quality',
                DropdownButton<TextureQuality>(
                  value: _textureQuality,
                  isExpanded: true,
                  dropdownColor: AppColors.darkSurface,
                  style: TextStyle(color: AppColors.textPrimary, fontSize: 14.sp),
                  items: TextureQuality.values.map((texture) {
                    return DropdownMenuItem(
                      value: texture,
                      child: Text(texture.displayName),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _textureQuality = value);
                    }
                  },
                ),
              ),

              // View Distance
              _buildSettingSection(
                'View Distance',
                DropdownButton<ViewDistance>(
                  value: _viewDistance,
                  isExpanded: true,
                  dropdownColor: AppColors.darkSurface,
                  style: TextStyle(color: AppColors.textPrimary, fontSize: 14.sp),
                  items: ViewDistance.values.map((distance) {
                    return DropdownMenuItem(
                      value: distance,
                      child: Text(distance.displayName),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _viewDistance = value);
                    }
                  },
                ),
              ),

              // Color Style
              _buildSettingSection(
                'Color Style',
                DropdownButton<ColorStyle>(
                  value: _colorStyle,
                  isExpanded: true,
                  dropdownColor: AppColors.darkSurface,
                  style: TextStyle(color: AppColors.textPrimary, fontSize: 14.sp),
                  items: ColorStyle.values.map((style) {
                    return DropdownMenuItem(
                      value: style,
                      child: Text(style.displayName),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _colorStyle = value);
                    }
                  },
                ),
              ),

              SizedBox(height: 32.h),

              // Save Button
              GlowButton(
                text: 'SAVE PROFILE',
                onPressed: _saveProfile,
                icon: Icons.save,
              ),

              SizedBox(height: 16.h),

              // Apply Button
              GlowButton(
                text: 'APPLY SETTINGS',
                onPressed: _applySettings,
                icon: Icons.check_circle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingSection(String title, Widget control) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.darkSurface,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColors.neonBlue.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.neonBlue,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 12.h),
          control,
        ],
      ),
    );
  }

  void _saveProfile() {
    // Show save dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.darkSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
          side: BorderSide(
            color: AppColors.neonBlue.withOpacity(0.3),
          ),
        ),
        title: Text(
          'Save Profile',
          style: TextStyle(color: AppColors.textPrimary),
        ),
        content: TextField(
          style: TextStyle(color: AppColors.textPrimary),
          decoration: InputDecoration(
            hintText: 'Enter profile name',
            hintStyle: TextStyle(color: AppColors.textSecondary),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.neonBlue.withOpacity(0.3)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.neonBlue),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('CANCEL', style: TextStyle(color: AppColors.textSecondary)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('✓ Profile saved successfully!'),
                  backgroundColor: AppColors.successGreen,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.neonBlue,
            ),
            child: const Text('SAVE'),
          ),
        ],
      ),
    );
  }

  void _applySettings() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('✓ Settings applied to PUBG Mobile!'),
        backgroundColor: AppColors.successGreen,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }
}
