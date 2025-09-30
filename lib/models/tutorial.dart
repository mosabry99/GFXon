/// Tutorial/Tips model
class Tutorial {
  final String id;
  final String title;
  final String description;
  final String content;
  final TutorialCategory category;
  final String iconPath;

  const Tutorial({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.category,
    required this.iconPath,
  });
}

/// Tutorial categories
enum TutorialCategory {
  performance,
  graphics,
  settings,
  tips,
}

extension TutorialCategoryExtension on TutorialCategory {
  String get displayName {
    switch (this) {
      case TutorialCategory.performance:
        return 'Performance';
      case TutorialCategory.graphics:
        return 'Graphics';
      case TutorialCategory.settings:
        return 'Settings';
      case TutorialCategory.tips:
        return 'Pro Tips';
    }
  }
}

/// Tutorial data
class TutorialData {
  TutorialData._();

  static const List<Tutorial> all = [
    Tutorial(
      id: 'fps_optimization',
      title: 'FPS Optimization',
      description: 'Maximize your frame rate for competitive advantage',
      content: '''
**Frame Rate Settings**

Higher FPS means smoother gameplay and better responsiveness. Here's how to optimize:

• **60 FPS**: Best balance for most devices
• **90 FPS**: For high-end devices with smooth displays
• **120 FPS**: For flagship devices with 120Hz+ screens

**Tips:**
1. Lower graphics quality to increase FPS
2. Disable shadows and anti-aliasing
3. Use "Smooth" graphics preset
4. Close background apps before playing
5. Keep your device cool for consistent performance

**Warning:** Very high FPS settings may drain battery faster.
''',
      category: TutorialCategory.performance,
      iconPath: 'assets/icons/fps.png',
    ),
    Tutorial(
      id: 'graphics_quality',
      title: 'Graphics Quality Guide',
      description: 'Understanding graphics settings and their impact',
      content: '''
**Graphics Quality Levels**

Each quality level affects visual fidelity and performance:

• **Smooth**: Lowest graphics, maximum FPS
• **Balanced**: Good balance of visuals and performance
• **HD**: Enhanced visuals with good performance
• **Ultra HD**: Maximum visual quality for high-end devices

**Visual Settings:**
- **Shadows**: Add depth but reduce FPS
- **Anti-Aliasing**: Smooths edges, slight performance cost
- **Texture Quality**: Affects detail level of surfaces
- **View Distance**: How far you can see clearly

**Recommendation:** Start with Balanced preset, then adjust based on your device's performance.
''',
      category: TutorialCategory.graphics,
      iconPath: 'assets/icons/graphics.png',
    ),
    Tutorial(
      id: 'custom_profiles',
      title: 'Creating Custom Profiles',
      description: 'How to create and manage custom GFX profiles',
      content: '''
**Custom Profile Creation**

Save your perfect settings for quick access:

**Steps:**
1. Go to Custom Settings screen
2. Adjust all settings to your preference
3. Tap "Save Profile" button
4. Enter a name for your profile
5. Profile saved to Saved Profiles screen

**Managing Profiles:**
- View all profiles in Saved Profiles screen
- Tap a profile to apply it instantly
- Long press to edit or delete
- Share profiles with friends (coming soon)

**Pro Tip:** Create different profiles for different scenarios (e.g., "Battery Saver", "Max Graphics", "Competitive").
''',
      category: TutorialCategory.settings,
      iconPath: 'assets/icons/profile.png',
    ),
    Tutorial(
      id: 'device_compatibility',
      title: 'Device Compatibility',
      description: 'Choosing the right settings for your device',
      content: '''
**Device-Specific Recommendations**

**Low-End Devices:**
- Resolution: HD (720p)
- FPS: 30-60
- Graphics: Smooth
- Anti-Aliasing: Disabled
- Shadows: Off

**Mid-Range Devices:**
- Resolution: Full HD (1080p)
- FPS: 60
- Graphics: Balanced or HD
- Anti-Aliasing: Enabled
- Shadows: Optional

**High-End Devices:**
- Resolution: Quad HD or Ultra HD
- FPS: 90-120
- Graphics: Ultra HD
- Anti-Aliasing: Enhanced
- Shadows: On

**Check Your Device:** Monitor temperature and battery drain. If device gets too hot, reduce settings.
''',
      category: TutorialCategory.tips,
      iconPath: 'assets/icons/device.png',
    ),
    Tutorial(
      id: 'battery_optimization',
      title: 'Battery Optimization',
      description: 'Extend gaming sessions with smart settings',
      content: '''
**Battery-Saving Tips**

Optimize settings to play longer:

**Settings to Adjust:**
1. Lower FPS to 30-60
2. Use Smooth graphics preset
3. Reduce screen brightness
4. Disable shadows and effects
5. Use HD resolution instead of higher

**Device Settings:**
- Enable battery saver mode
- Close background apps
- Disable auto-brightness
- Reduce haptic feedback
- Turn off Wi-Fi/Bluetooth when not needed

**Important:** Balance performance with battery life based on your session length needs.

**Pro Tip:** Keep your device between 20-80% charge for optimal battery health.
''',
      category: TutorialCategory.tips,
      iconPath: 'assets/icons/battery.png',
    ),
    Tutorial(
      id: 'competitive_settings',
      title: 'Competitive Settings',
      description: 'Optimize for competitive gameplay and tournaments',
      content: '''
**Competitive Gaming Setup**

Settings preferred by pro players:

**Priority: Performance Over Visuals**
- FPS: Maximum your device supports (90-120)
- Graphics: Smooth or Balanced
- Resolution: HD or Full HD
- Anti-Aliasing: Disabled (less input lag)
- Shadows: Off (better enemy visibility)

**Why These Settings?**
- Higher FPS = Better responsiveness
- Lower graphics = Consistent frame times
- No shadows = Clearer enemy outlines
- Less effects = Better focus

**Additional Tips:**
1. Use gaming mode on your device
2. Stable internet connection required
3. Test settings in training mode first
4. Maintain device temperature
5. Practice with same settings consistently

**Remember:** Consistency is key. Find settings that work and stick with them.
''',
      category: TutorialCategory.tips,
      iconPath: 'assets/icons/competitive.png',
    ),
  ];

  static List<Tutorial> getTutorialsByCategory(TutorialCategory category) {
    return all.where((tutorial) => tutorial.category == category).toList();
  }

  static Tutorial? getTutorialById(String id) {
    try {
      return all.firstWhere((tutorial) => tutorial.id == id);
    } catch (e) {
      return null;
    }
  }
}
