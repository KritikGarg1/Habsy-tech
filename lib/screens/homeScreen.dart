import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hmart/components/topBrands.dart';
import 'homePosts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainBody(),
      appBar: buildAppBar(context),
    );
  }
}

AppBar buildAppBar(context) {

  final auth = FirebaseAuth.instance;

  Color kTextColor = Colors.black45;
  return AppBar(
    backgroundColor: Colors.white10,
    elevation: 0,
    leading: IconButton(
      icon: Icon(Icons.arrow_back_rounded),
      onPressed: () {Navigator.of(context).pop();},
      iconSize: 25,
      color: kTextColor,
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.search),
        color: kTextColor,
        iconSize: 25,
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.shopping_cart_outlined),
        iconSize: 25,
        onPressed: () {},
        color: kTextColor,
      ),
      IconButton(
        icon: Icon(Icons.logout),
        iconSize: 25,
        onPressed: () {auth.signOut();},
        color: kTextColor,
      ),
      SizedBox(width: 25)
    ],
  );
}

class MainBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text("Discover",
                style: GoogleFonts.slabo13px(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )),
          ),
          Container(
            padding: EdgeInsets.only(top: 28),
            child: Container(
                padding: EdgeInsets.only(top: 10),
                color: Colors.deepPurple[50],
                child: Padding(padding: EdgeInsets.all(10), child: TopBrands())),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Image.network('https://i.ibb.co/hXshhVj/Group-2.jpg'),
          ),

          Container(
            padding: EdgeInsets.only(top: 28),
            child: Container(
                padding: EdgeInsets.only(top: 10),
                color: Colors.white,
                child: Padding(padding: EdgeInsets.all(10), child: HomePost())),
          )
        ],
        ),
      ),
    );
  }
}
