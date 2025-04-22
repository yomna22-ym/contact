import 'package:contact_task/screens/home_screen.dart';
import 'package:contact_task/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String routeName = '/';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreenF.routeName: (_) => SplashScreenF(),
        '/home_screen': (context) => HomeScreen(),
      },
      initialRoute: SplashScreenF.routeName,
    );
  }
}
