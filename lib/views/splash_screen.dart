import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:interntask/views/login_screen.dart';

import 'home_screen.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  AnimatedSplashScreen(
      splash: 'assets/images/img.png',
      duration: 100,

      nextScreen:LoginScreen(),
      backgroundColor: Color(0xff0062BD),
      splashTransition: SplashTransition.rotationTransition,
      splashIconSize: 170,
      //pageTransitionType: PageTransitionType.scale,
    );
  }
}
