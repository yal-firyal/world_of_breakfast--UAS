import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountPage extends StatelessWidget {
  String str = "";
  AccountPage({Key? key, required this.str}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(str);
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ACCOUNT',
          style: GoogleFonts.lexend(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff87A8A1),
        automaticallyImplyLeading: false,
        elevation: 1,
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                // padding: const EdgeInsets.only(top: 24),
                child: Text(
                  "My Account",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lexend(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                  ),
                ),
              ),

              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 100,
                      backgroundImage: AssetImage('asset/profile.jpeg'),
                    ),
                  ),
                ],
              ),

              Container(
                padding: const EdgeInsets.only(top: 24),
                alignment: Alignment.center,
                child: Text(
                  '$str',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.lexend(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.only(top: 24),
                child: Text(
                  'Start your day with these easy breakfast recipes! Whether you’re on the go, looking for a make-ahead breakfast, or want clean eating options, these delicious breakfast recipes are for you! ',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.lexend(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

