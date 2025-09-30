/// Onboarding page data model
class OnboardingPage {
  final String title;
  final String description;
  final String imagePath;
  final String? lottieAnimationPath;

  const OnboardingPage({
    required this.title,
    required this.description,
    required this.imagePath,
    this.lottieAnimationPath,
  });
}

/// Onboarding pages data
class OnboardingData {
  OnboardingData._();

  static const List<OnboardingPage> pages = [
    OnboardingPage(
      title: 'Optimize Your Game',
      description:
          'Enhance your PUBG Mobile experience with custom graphics settings tailored for your device.',
      imagePath: 'assets/images/onboarding_1.png',
    ),
    OnboardingPage(
      title: 'Quick Presets',
      description:
          'Apply optimized presets with one tap. Choose from Balanced, HD, Ultra HD, or Extreme FPS modes.',
      imagePath: 'assets/images/onboarding_2.png',
    ),
    OnboardingPage(
      title: 'Custom Profiles',
      description:
          'Create and save your own custom graphics profiles. Fine-tune every setting to perfection.',
      imagePath: 'assets/images/onboarding_3.png',
    ),
    OnboardingPage(
      title: 'Safe & Easy',
      description:
          'All settings are stored locally on your device. Simple, safe, and effective optimization.',
      imagePath: 'assets/images/onboarding_4.png',
    ),
  ];
}
