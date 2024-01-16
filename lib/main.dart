import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_app/pages/dashboard.dart';
import 'package:login_app/pages/page_home.dart';
import 'package:login_app/pages/page_login.dart';
import 'package:login_app/pages/page_signup.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:contacts_service/contacts_service.dart';

Future <void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Permission.contacts.request();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      initialRoute: MyRoute.homeRoute,
      routes: {
        "/": (context) => const HomePage(),
        MyRoute.homeRoute: (context) => const HomePage(),
        MyRoute.loginRoute: (context) => const LoginPage(),
        MyRoute.signupRoute: (context) => const SignupPage(),
        MyRoute.dashboardRoute: (context) => const Dashboard(),
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
