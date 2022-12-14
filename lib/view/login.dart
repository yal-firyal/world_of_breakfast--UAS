import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dio/dio.dart';
import 'package:world_of_breakfast/utils.dart';
import 'package:world_of_breakfast/view/bottomnavbar.dart';
import 'package:world_of_breakfast/view/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  void login(String email, password) async {
    try {
      // ME-GET atau Mengambil data json dari link
      // var response = await Dio().get('http://192.168.30.175:3000/users');
      var response = await Dio().get('${BASE_URL}/users');
      // var response = await Dio().get('http://10.0.2.1:3000/users');
      // var response = await Dio().get('http://localhost:3000/users');
      // inisialisasi panjang data
      var panjang_data = response.data.length;
      if (response.statusCode == 200) {
        // pengecekan dengan perulangan dan percabangan,
        // input akan dicek dari semua data yg sudah ada di json
        for (var i = 0; i <= panjang_data; i++) {
          if (email == response.data[i]['email'] &&
              password == response.data[i]['password']) {
            print("Login success");
            final snackBar = SnackBar(
              backgroundColor: Color.fromRGBO(0, 137, 56, 1),
              content: Text(
                'Login success',
                style: GoogleFonts.lexend(
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            );
            Navigator.push(context, MaterialPageRoute(builder: (context) => Navbar()));
            break;
          }
        }
      } else {
        final snackBar = SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            'Login failed',
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
      final snackBar = SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(
          'Login failed',
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 24),
                child: Image.asset(
                    'asset/login.png'
                ),
              ),

              Container(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  "Let’s Breakfast\nWith Yummy Food",
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
                padding: const EdgeInsets.only(top: 50),
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (String? val) {
                    emailController.text = val!;
                  },
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
                padding: const EdgeInsets.only(top: 16),
                child: TextFormField(
                  controller: pwdController,
                  onSaved: (String? val) {
                    pwdController.text = val!;
                  },
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
                // width: 280,
                // height: 50,
                padding: const EdgeInsets.only(top: 185),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff87A8A1),
                    minimumSize: const Size.fromHeight(55),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    try {
                      if (emailController.text.isNotEmpty && pwdController.text.isNotEmpty) {
                        print("Process");

                        login(emailController.text, pwdController.text);
                      } else {
                        print("Fail");
                        final snackBar = SnackBar(
                          backgroundColor: Colors.redAccent,
                          content: Text(
                            'Please complete your login',
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
                    "Sign In",
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
                      "Don't have an account yet?",
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
                        "Sign Up",
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
                            MaterialPageRoute(builder: (context) => RegisterPage()));
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
