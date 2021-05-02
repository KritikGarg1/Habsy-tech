import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hmart/screens/signup.dart';
import 'package:hmart/screens/homeScreen.dart';
import 'home.dart';

class BusinessLoginPage extends StatefulWidget {
  @override
  _BusinessLoginPageState createState() => _BusinessLoginPageState();
}

class _BusinessLoginPageState extends State<BusinessLoginPage> {
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
                            margin: EdgeInsets.only(top: 200, left: 35),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text("Business Login",
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
                                    builder: (context) => BusinessHomePage("Sony","https://www.sony.com/image/sonyview1?fmt=png&wid=1200","At Sony, our mission is to be a company that inspires and fulfills your curiosity. Using our unlimited passion for technology, content and services to deliver groundbreaking new excitement and entertainment, as only Sony can.")));
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
