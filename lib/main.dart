import 'package:flutter/material.dart';
import 'package:flutter_future_jobs/providers/auth_provider.dart';
import 'package:flutter_future_jobs/providers/user_provider.dart';
import 'package:provider/provider.dart';

import 'pages/category_page.dart';
import 'pages/on_boarding_page.dart';
import 'pages/sign_in_page.dart';
import 'pages/sign_up_page.dart';
import 'pages/splash_page.dart';
import 'pages/detail_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/on_boarding': (context) => OnBoardingPage(),
          '/sign_up': (context) => SignUpPage(),
          '/sign_in': (context) => SignInPage(),
          '/home': (context) => HomePage(),
          '/category': (context) => CategoryPage(),
          '/detail': (context) => DetailPage(),
        },
      ),
    );
  }
}
