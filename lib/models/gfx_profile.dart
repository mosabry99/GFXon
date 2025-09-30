import 'package:freezed_annotation/freezed_annotation.dart';

part 'gfx_profile.freezed.dart';
part 'gfx_profile.g.dart';

/// GFX Profile model representing a complete graphics configuration
@freezed
class GfxProfile with _$GfxProfile {
  const factory GfxProfile({
    required String id,
    required String name,
    required String description,
    required Resolution resolution,
    required int fps,
    required GraphicsQuality graphicsQuality,
    required AntiAliasing antiAliasing,
    required bool shadows,
    required TextureQuality textureQuality,
    required ViewDistance viewDistance,
    required ColorStyle colorStyle,
    @Default(false) bool isPreset,
    required DateTime createdAt,
    DateTime? lastModified,
  }) = _GfxProfile;

  factory GfxProfile.fromJson(Map<String, dynamic> json) =>
      _$GfxProfileFromJson(json);
}

/// Screen resolution options
enum Resolution {
  @JsonValue('hd')
  hd, // 720p
  @JsonValue('full_hd')
  fullHd, // 1080p
  @JsonValue('quad_hd')
  quadHd, // 1440p
  @JsonValue('ultra_hd')
  ultraHd, // 4K
}

extension ResolutionExtension on Resolution {
  String get displayName {
    switch (this) {
      case Resolution.hd:
        return 'HD (720p)';
      case Resolution.fullHd:
        return 'Full HD (1080p)';
      case Resolution.quadHd:
        return 'Quad HD (1440p)';
      case Resolution.ultraHd:
        return 'Ultra HD (4K)';
    }
  }

  String get description {
    switch (this) {
      case Resolution.hd:
        return 'Balanced performance and quality';
      case Resolution.fullHd:
        return 'Enhanced visuals';
      case Resolution.quadHd:
        return 'High-end graphics';
      case Resolution.ultraHd:
        return 'Maximum quality';
    }
  }
}

/// Graphics quality presets
enum GraphicsQuality {
  @JsonValue('smooth')
  smooth,
  @JsonValue('balanced')
  balanced,
  @JsonValue('hd')
  hd,
  @JsonValue('ultra_hd')
  ultraHd,
}

extension GraphicsQualityExtension on GraphicsQuality {
  String get displayName {
    switch (this) {
      case GraphicsQuality.smooth:
        return 'Smooth';
      case GraphicsQuality.balanced:
        return 'Balanced';
      case GraphicsQuality.hd:
        return 'HD';
      case GraphicsQuality.ultraHd:
        return 'Ultra HD';
    }
  }
}

/// Anti-aliasing options
enum AntiAliasing {
  @JsonValue('disabled')
  disabled,
  @JsonValue('enabled')
  enabled,
  @JsonValue('enhanced')
  enhanced,
}

extension AntiAliasingExtension on AntiAliasing {
  String get displayName {
    switch (this) {
      case AntiAliasing.disabled:
        return 'Disabled';
      case AntiAliasing.enabled:
        return 'Enabled';
      case AntiAliasing.enhanced:
        return 'Enhanced';
    }
  }
}

/// Texture quality options
enum TextureQuality {
  @JsonValue('low')
  low,
  @JsonValue('medium')
  medium,
  @JsonValue('high')
  high,
  @JsonValue('ultra')
  ultra,
}

extension TextureQualityExtension on TextureQuality {
  String get displayName {
    switch (this) {
      case TextureQuality.low:
        return 'Low';
      case TextureQuality.medium:
        return 'Medium';
      case TextureQuality.high:
        return 'High';
      case TextureQuality.ultra:
        return 'Ultra';
    }
  }
}

/// View distance options
enum ViewDistance {
  @JsonValue('near')
  near,
  @JsonValue('medium')
  medium,
  @JsonValue('far')
  far,
  @JsonValue('ultra_far')
  ultraFar,
}

extension ViewDistanceExtension on ViewDistance {
  String get displayName {
    switch (this) {
      case ViewDistance.near:
        return 'Near';
      case ViewDistance.medium:
        return 'Medium';
      case ViewDistance.far:
        return 'Far';
      case ViewDistance.ultraFar:
        return 'Ultra Far';
    }
  }
}

/// Color style options
enum ColorStyle {
  @JsonValue('realistic')
  realistic,
  @JsonValue('vivid')
  vivid,
  @JsonValue('soft')
  soft,
}

extension ColorStyleExtension on ColorStyle {
  String get displayName {
    switch (this) {
      case ColorStyle.realistic:
        return 'Realistic';
      case ColorStyle.vivid:
        return 'Vivid';
      case ColorStyle.soft:
        return 'Soft';
    }
  }
}
