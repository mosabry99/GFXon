import '../../models/gfx_profile.dart';

/// Pre-defined GFX optimization presets
class GfxPresets {
  GfxPresets._();
  
  /// Balanced preset - Good mix of visuals and performance
  static final GfxProfile balanced = GfxProfile(
    id: 'preset_balanced',
    name: 'Balanced',
    description: 'Optimal balance between graphics quality and performance',
    resolution: Resolution.hd,
    fps: 60,
    graphicsQuality: GraphicsQuality.hd,
    antiAliasing: AntiAliasing.enabled,
    shadows: true,
    textureQuality: TextureQuality.high,
    viewDistance: ViewDistance.medium,
    colorStyle: ColorStyle.realistic,
    isPreset: true,
    createdAt: DateTime.now(),
  );
  
  /// HD preset - Enhanced visuals with good performance
  static final GfxProfile hd = GfxProfile(
    id: 'preset_hd',
    name: 'HD Graphics',
    description: 'Enhanced graphics with smooth performance',
    resolution: Resolution.fullHd,
    fps: 60,
    graphicsQuality: GraphicsQuality.ultraHd,
    antiAliasing: AntiAliasing.enhanced,
    shadows: true,
    textureQuality: TextureQuality.ultra,
    viewDistance: ViewDistance.far,
    colorStyle: ColorStyle.realistic,
    isPreset: true,
    createdAt: DateTime.now(),
  );
  
  /// Ultra HD preset - Maximum visual quality
  static final GfxProfile ultraHd = GfxProfile(
    id: 'preset_ultra_hd',
    name: 'Ultra HD',
    description: 'Maximum graphics quality for high-end devices',
    resolution: Resolution.quadHd,
    fps: 60,
    graphicsQuality: GraphicsQuality.ultraHd,
    antiAliasing: AntiAliasing.enhanced,
    shadows: true,
    textureQuality: TextureQuality.ultra,
    viewDistance: ViewDistance.ultraFar,
    colorStyle: ColorStyle.vivid,
    isPreset: true,
    createdAt: DateTime.now(),
  );
  
  /// Extreme FPS preset - Maximum performance
  static final GfxProfile extremeFps = GfxProfile(
    id: 'preset_extreme_fps',
    name: 'Extreme FPS',
    description: 'Maximum frame rate for competitive gaming',
    resolution: Resolution.hd,
    fps: 90,
    graphicsQuality: GraphicsQuality.smooth,
    antiAliasing: AntiAliasing.disabled,
    shadows: false,
    textureQuality: TextureQuality.medium,
    viewDistance: ViewDistance.near,
    colorStyle: ColorStyle.realistic,
    isPreset: true,
    createdAt: DateTime.now(),
  );
  
  /// Smooth preset - Performance focused
  static final GfxProfile smooth = GfxProfile(
    id: 'preset_smooth',
    name: 'Smooth',
    description: 'Optimized for smooth gameplay on mid-range devices',
    resolution: Resolution.hd,
    fps: 60,
    graphicsQuality: GraphicsQuality.smooth,
    antiAliasing: AntiAliasing.disabled,
    shadows: false,
    textureQuality: TextureQuality.medium,
    viewDistance: ViewDistance.medium,
    colorStyle: ColorStyle.realistic,
    isPreset: true,
    createdAt: DateTime.now(),
  );
  
  /// Get all available presets
  static List<GfxProfile> get all => [
        balanced,
        smooth,
        hd,
        ultraHd,
        extremeFps,
      ];
  
  /// Get preset by ID
  static GfxProfile? getById(String id) {
    try {
      return all.firstWhere((preset) => preset.id == id);
    } catch (e) {
      return null;
    }
  }
}
