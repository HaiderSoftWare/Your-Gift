import 'package:flutter/material.dart';

import 'package:splash_screen_view/SplashScreenView.dart';

import 'login.dart';

class Splash_Screen extends StatelessWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SplashScreenView(
          navigateRoute: Login(),
          duration: 4000,
          imageSize: 130,
          imageSrc: "images/gift.png",
          backgroundColor: Colors.white,
          text: '               هديتك \n مرحبا بك في تطبيق هديتك',
          textStyle: const TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.amber),
        ),
      ),
    );
  }
}
