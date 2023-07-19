import 'package:flutter/material.dart';
import 'package:interntask/views/help_screen.dart';
import 'package:interntask/views/home_screen.dart';
import 'package:interntask/views/login_screen.dart';
import 'package:interntask/views/splash_screen.dart';
import 'package:interntask/views/verify_phone.dart';

import 'network/dio.dart';

void main() async {

    await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:   SplashScreen(),
    );
  }
}


