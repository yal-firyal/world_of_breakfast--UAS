import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_of_breakfast/view/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  // method register
  void register(String email, password, name) async {
    try {
      // ME-POST atau MENAMBAH data json dari link
      var response = await Dio().post('http://localhost:3000/users',
      // var response = await Dio().post('http://10.0.2.2:3000/users',
          data: {"email": email, "password": password, "name": name});
      if (response.statusCode == 201) {
        // status code 201 karena berhasil membuat data baru
        print("Account created successfully");
        final snackBar = SnackBar(
          backgroundColor: Color.fromRGBO(0, 137, 56, 1),
          content: Text(
            'Account created successfully',
            style: GoogleFonts.lexend(
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => LoginPage(),
        ));
      } else {
        // print('Registration Failed');
        final snackBar = SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            'Registration failed',
            // e.toString(),
            style: GoogleFonts.lexend(
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.fromLTRB(39, 50, 39, 0),
            child: Image.asset(
                'asset/login.png'
            ),
          ),

          Container(
            margin: const EdgeInsets.fromLTRB(67, 30, 67, 0),
            child: Text(
              "Let’s Get Your\nYummy Food",
              textAlign: TextAlign.center,
              style: GoogleFonts.lexend(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                color: Colors.black,
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.fromLTRB(67, 8, 67, 0),
            child: Text(
              "With World Of Breakfast",
              textAlign: TextAlign.center,
              style: GoogleFonts.lexend(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal,
                color: Colors.black,
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.fromLTRB(24, 50, 24, 0),
            child: TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Email Address',
                labelText: 'Email Address',
                isDense: true,
                contentPadding: EdgeInsets.all(16),
                hintStyle: GoogleFonts.lexend(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal,
                  color: Color(0xff87A8A1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff87A8A1)),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff87A8A1)),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.fromLTRB(24, 16, 24, 0),
            child: TextFormField(
              controller: pwdController,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                isDense: true,
                contentPadding: EdgeInsets.all(16),
                hintStyle: GoogleFonts.lexend(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal,
                  color: Color(0xff87A8A1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff87A8A1)),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff87A8A1)),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.fromLTRB(24, 16, 24, 0),
            child: TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Username',
                labelText: 'Username',
                isDense: true,
                contentPadding: EdgeInsets.all(16),
                hintStyle: GoogleFonts.lexend(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal,
                  color: Color(0xff87A8A1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff87A8A1)),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff87A8A1)),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),

          Container(
            width: 280,
            height: 50,
            margin: const EdgeInsets.fromLTRB(40, 110, 40, 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xff87A8A1),
                // minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                try {
                  if (nameController.text.isNotEmpty && pwdController.text.isNotEmpty) {
                    print("Process");

                    register(emailController.text, pwdController.text, nameController.text);
                  } else {
                    print("Fail");
                    final snackBar = SnackBar(
                      backgroundColor: Colors.redAccent,
                      content: Text(
                        'Please complete your registration',
                        // e.toString(),
                        style: GoogleFonts.lexend(
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                } catch (e) {
                  print(e);
                }
              },
              child: Text(
                "Sign Up",
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

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  "Already have an account?",
                  style: GoogleFonts.lexend(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                  ),
                ),
              ),


              Container(
                child: TextButton(
                  child: Text(
                    "Sign In",
                    style: GoogleFonts.lexend(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      color: Color(0xff87A8A1),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
