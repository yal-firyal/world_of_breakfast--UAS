import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_of_breakfast/view/login.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('asset/Breakfast.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.fromLTRB(90, 98, 89, 0),
            child: Text(
              "WORLD OF",
              style: GoogleFonts.lexend(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                color: Colors.black,
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.fromLTRB(25, 140, 26, 0),
            child: Text(
              "Breakfast",
              style: GoogleFonts.berkshireSwash(
                fontSize: 74,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal,
                color: Color(0xff87A8A1),
              ),
            ),
          ),

          Container(
            width: 280,
            height: 50,
            margin: const EdgeInsets.fromLTRB(60, 305, 60, 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xff87A8A1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text(
                "Get Started",
                style: GoogleFonts.lexend(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
