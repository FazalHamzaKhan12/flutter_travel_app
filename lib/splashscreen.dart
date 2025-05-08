import 'package:flutter/material.dart';
import 'package:travelapp_ui/screens/bottom_nav/bottom_nav.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 2500), () {
      setState(() {
        _opacity = 0.0;
      });
    });

    // Navigate to Home after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNav()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: Duration(milliseconds: 500),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF0072FF), Color(0xFF001F5C)],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Travel",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Lobster',
                    ),
                  ),
                  SizedBox(width: 10),
                  Image.asset("assets/images/globe.png", scale: 1),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Find Your Dream\nDestination With Us",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xffE8E8E8),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Roboto",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
