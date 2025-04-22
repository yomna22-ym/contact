import 'package:contact_task/additional/images.dart';
import 'package:flutter/material.dart';
import 'package:contact_task/additional/colors_app.dart';

class SplashScreenF extends StatefulWidget {
  static const String routeName = '/';
  const SplashScreenF({super.key});

  @override
  State<SplashScreenF> createState() => _SplashScreenFState();
}

class _SplashScreenFState extends State<SplashScreenF> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 7), () {
      Navigator.pushReplacementNamed(context, '/home_screen');
    });


    return Scaffold(
      backgroundColor: ColorApp.drkblu,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SafeArea(child: Image.asset(Images.rt, width: MediaQuery.of(context).size.width*0.7,)),
            const SizedBox(height: 20),
          ],),),);}}

