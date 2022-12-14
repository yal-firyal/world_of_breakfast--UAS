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
            padding: EdgeInsets.only(top: 120),
            alignment: Alignment.topCenter,
            child: Text(
              "WORLD OF",
              style: GoogleFonts.lexend(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          Container(
            padding: EdgeInsets.only(top: 160),
            alignment: Alignment.topCenter,
            child: Text(
              "Breakfast",
              style: GoogleFonts.berkshireSwash(
                fontSize: 74,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal,
                color: Color(0xff87A8A1),
              ),
              textAlign: TextAlign.center,
            ),
          ),

          Container(
            // width: 280,
            // height: 50,
            padding: EdgeInsets.only(top: 300, left: 60, right: 60),
            alignment: Alignment.topCenter,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xff87A8A1),
                minimumSize: const Size.fromHeight(55),
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
