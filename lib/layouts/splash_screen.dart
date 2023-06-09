import 'package:evcharger/layouts/login_screen.dart';
import 'package:evcharger/theme/extention.dart';
import 'package:flutter/material.dart';
import '../theme/light_color.dart';
import '../theme/text_styles.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // Delay for 2 seconds and then navigate to the login screen
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => LogIn()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF21899C),
            ),
          ),
          Positioned.fill(
            child: Opacity(
              opacity: .6,
              child: Container(
                decoration: BoxDecoration(),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: SizedBox(),
              ),
              Center(
                child: Image.asset(
                  "assets/EV-charging.png",
                  color: Color(0xFFD35934), //Color(0xFF21899C),
                  height: 200,
                  width: 200,
                ),
              ),
              Text(
                "EV JO",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Expanded(
                flex: 3,
                child: SizedBox(
                  height: 1,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}