import 'dart:async';

import 'package:ai_chatboat/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;

  const SplashScreen({super.key, required this.onThemeChanged});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen(
                  onThemeChanged: widget.onThemeChanged,
                  isAppbarActive: true,
                )),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/png/background.png"))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                Theme.of(context).brightness == Brightness.dark
                    ? "assets/png/dark_logo.png"
                    : "assets/png/light_logo.png",
                height: 120,
                width: 230,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GradientText(
                    "Ai ",
                    style: const TextStyle(
                      fontFamily: "Outfit",
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                    colors: const [Color(0xFF9648E8), Color(0xFF4634E5)],
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    "Type Keyboard",
                    style: TextStyle(
                      fontFamily: "Outfit",
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              // Switch(
              //   value: Theme.of(context).brightness == Brightness.dark,
              //   onChanged: widget.onThemeChanged,
              //   activeColor: Colors.deepPurple,
              //   inactiveThumbColor: Colors.grey,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
