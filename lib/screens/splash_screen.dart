import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'bottomNavigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 4),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => BottomNavigatoin(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Positioned(
                  top: 250,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 40.0,
                        sigmaY: 40.0,
                      ),
                      child: Container(
                        width: 340,
                        height: 352,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromRGBO(255, 255, 255, 0.5),
                              Color.fromRGBO(255, 255, 255, 0.2)
                            ],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'MONEWS',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            'From',
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
          Text(
            'Expertflutter',
            style: TextStyle(color: Colors.blue, fontSize: 17),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
