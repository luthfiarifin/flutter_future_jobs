import 'package:flutter/material.dart';
import 'package:flutter_future_jobs/pages/on_boarding_page.dart';
import 'package:flutter_future_jobs/pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/on_boarding': (context) => OnBoardingPage(),
      },
    );
  }
}
