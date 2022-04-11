import 'dart:async';

import 'package:employeen/assets/text_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  /// 3 seconds holds the splashscreen
  /// After it route to the HomePage
  startTimer() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Text(
          "Employeen",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: textColorPrimary,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
         CircularProgressIndicator(
          color: Colors.greenAccent.shade200,
          strokeWidth: 3,
        ),
          ],
        ),
      ),
    );
  }
}
