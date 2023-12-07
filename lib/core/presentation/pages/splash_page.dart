import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sigmavpnflutter/core/presentation/pages/home_page.dart';
import 'package:sigmavpnflutter/core/theme/colors.dart';
import 'package:sigmavpnflutter/core/theme/text_styles.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;

  void startTimer() {
    // ignore: prefer_conditional_assignment
    if (timer == null) {
      timer = Timer(const Duration(seconds: 3), () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const VpnPage()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    startTimer();


    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: Container(
          color: secondaryColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/ic_splash_screen.png",
                  height: screenHeightRatio(300),
                  width: screenWidthRatio(300),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}


