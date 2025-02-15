import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

import 'package:tourist_spot_app/home_page.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  startTimer() async {
    Timer(const Duration(seconds: 3), () {
      //for one time page view, no back button available in next page when use it
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) =>  Homepage()));
    });
  }

  @override
  void initState(){
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.blueAccent, // Border color
                  width: 4.0, // Border width
                ),
              ),
              child: ClipOval(
                child: Image.asset(
                  "assets/images/abc.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),


            Text(
              "Tourist Spot App",
              style: GoogleFonts.acme(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blueAccent
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const CircularProgressIndicator(
              color: Colors.blueAccent,
            ),
          ],

        ),
      )
    );
  }
}
