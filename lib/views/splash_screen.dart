import 'package:flutter/material.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen.SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  AnimatedSplashScreen(
      splash: 'images/splash.png',
      nextScreen: MainScreen(),
      splashTransition: SplashTransition.rotationTransition,
      pageTransitionType: PageTransitionType.scale,
    );
  }
}
