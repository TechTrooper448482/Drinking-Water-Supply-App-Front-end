import 'package:flutter/material.dart';
import 'dart:async';

import 'ProductListScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => ProductListScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: screenWidth * 0.4,
              height: screenHeight * 0.4,
              child: Icon(
                Icons.water_drop,
                size: screenWidth * 0.3,
                color: Colors.blue[900],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Boondh Water',
              style: TextStyle(
                fontSize: screenWidth * 0.07,
                color: Colors.blue[900],
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}