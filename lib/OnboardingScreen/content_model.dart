import 'dart:ui';

class OnboardingContent {
  String image;
  String title;
  String description;
  Color color;

  OnboardingContent({required this.image, required this.title, required this.description, required this.color});
}

List<OnboardingContent> contents = [
  OnboardingContent(
      title: 'Quality',
      image: 'Assets/OnbordingScreen/onboarding1.svg',
      description: "Sell your farm fresh products directly to consumers, cutting out the middleman and reducing emissions of the global supply chain.",
      color: Color(0xFF5ea25f)
  ),
  OnboardingContent(
      title: 'Convenient',
      image: 'Assets/OnbordingScreen/onboarding2.svg',
      description: "Our team of delivery drivers will make sure your orders are picked up on time and promptly delivered to your customers.",
      color: Color(0xFFd5715b)
  ),
  OnboardingContent(
      title: 'Local',
      image: 'Assets/OnbordingScreen/onboarding3.svg',
      description: "We love the earth and know you do too! Join us in reducing our local carbon footprint one order at a time.",
      color: Color(0xFFf8c569)
  ),
];