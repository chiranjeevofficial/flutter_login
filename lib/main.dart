import 'package:flutter/material.dart';
import 'package:login_app/pages/page_home.dart';
import 'package:login_app/pages/page_login.dart';
import 'package:login_app/pages/page_signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      initialRoute: MyRoute.signupRoute,
      routes: {
        MyRoute.homeRoute: (context) => const HomePage(),
        MyRoute.loginRoute: (context) => const LoginPage(),
        MyRoute.signupRoute: (context) => const SignupPage(),
      },
    );
  }
}

class MyRoute {
  static String homeRoute = "/home";
  static String loginRoute = "/login";
  static String signupRoute = "/signup";
  static String dashboardRoute = "/dashboard";
}
