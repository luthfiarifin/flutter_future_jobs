import 'package:flutter/material.dart';
import 'package:flutter_future_jobs/theme.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Image.asset(
          'assets/image_splash.png',
          width: 178,
        ),
      ),
    );
  }
}
