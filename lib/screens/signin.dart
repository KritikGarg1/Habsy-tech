import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hmart/screens/signup.dart';
import 'homeScreen.dart';
import 'business/signIn.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  child: Stack(
                    children: <Widget>[
                       Positioned(
                            child: Container(
                          margin: EdgeInsets.only(top: 100, right: 30),
                          child: Container(
                            alignment: Alignment.topRight,
                            child: GestureDetector(onTap: (){Navigator.push(context,MaterialPageRoute(
                              builder: (context) => BusinessLoginPage(),));},
                              child:Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.deepPurple),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              //                 <--- border radius here
                              child: Text("Switch to business",
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        color: Colors.deepPurple,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ),
                        )),
                      ),
                      Positioned(
                          child: Container(
                        margin: EdgeInsets.only(top: 200, left: 35),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text("Welcome",
                              style: GoogleFonts.slabo13px(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .4),
                                  blurRadius: 60.0,
                                  offset: Offset(0, 0))
                            ]),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[100]))),
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    _email = value.trim();
                                  });
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email address",
                                    hintStyle:
                                        TextStyle(color: Colors.black45)),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    _password = value.trim();
                                  });
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle:
                                        TextStyle(color: Colors.black45)),
                              ),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      GestureDetector(
                        onTap: () {
                          auth
                              .signInWithEmailAndPassword(
                                  email: _email, password: _password)
                              .then((_) {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          });
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(90, 50, 180, 1),
                                Color.fromRGBO(50, 90, 200, 1),
                              ])),
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          GestureDetector(onTap: (){Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage()));},
                            child: Text(
                              "New User? Sign Up",
                              style: TextStyle(fontSize: 16,color: Color.fromRGBO(50, 30, 50, 1)),
                            ),
                          ),
                          Spacer(),
                          Text(
                            "Forgot Password?",
                            style: TextStyle(fontSize: 16,color: Color.fromRGBO(50, 30, 50, 1)),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
