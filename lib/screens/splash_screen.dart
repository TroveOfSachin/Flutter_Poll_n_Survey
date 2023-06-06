import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:poll_n_survey/screens/onboarding_intro_screen.dart';
import 'package:poll_n_survey/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    whereToGo();
  }

  void whereToGo() async {
    var pref = await SharedPreferences.getInstance();
    var isViewed = pref.containsKey(PREF_KEY_INTRO_VIEWED)
        ? pref.getBool(PREF_KEY_INTRO_VIEWED)!
        : false;
    var screen = isViewed ? const OnBoardingScreen() : const DashboardScreen();
    Timer(const Duration(seconds: 5), () async {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => screen));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.fill,
          ),
          //   gradient: LinearGradient(
          // begin: Alignment.bottomLeft,
          // end: Alignment.topRight,
          // colors: [Colors.lightBlueAccent, Colors.blue, Colors.blueAccent],
          // )
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Poll & Survey",
                  style: TextStyle(
                      color: Colors.blue,
                      fontFamily: "Satisfy",
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      shadows: [
                        Shadow(
                            color: Colors.white,
                            offset: Offset(1, 3),
                            blurRadius: 5)
                      ]),
                ),
                Stack(
                  children: [
                    Opacity(
                        opacity: 1,
                        child: Image.asset("assets/images/pie_chart.png",
                            color: Colors.red)),
                    ClipRect(
                      child: BackdropFilter(
                          filter:
                              ImageFilter.dilate(radiusX: 0.1, radiusY: 0.1),
                          child: Image.asset("assets/images/pie_chart.png")),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
