import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hmart/screens/product.dart';
import 'package:hmart/screens/homeScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file/file.dart';
import 'package:hmart/screens/product.dart';
import 'addPost.dart';
import 'addPost.dart';

class BusinessHomePage extends StatelessWidget {
  final String imageURL;
  final String desc;
  final String name;

  BusinessHomePage(this.name, this.imageURL, this.desc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(

        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => AppPost()));},

        label: Text('Add Post'),
        icon: Icon(Icons.add),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      appBar: buildAppBar(context),
      body: Header(name, imageURL, desc),
    );
  }
}

class Header extends StatelessWidget {
  final String imageURL;
  final String desc;
  final String name;

  Header(this.name, this.imageURL, this.desc);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.only(
              left: 30,
              top: 20,
            ),
            alignment: Alignment.topLeft,
            child: Text(name.toUpperCase(),
                style: GoogleFonts.slabo13px(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ))),
        Container(
            padding: EdgeInsets.only(left: 30, top: 20, right: 15),
            alignment: Alignment.topLeft,
            child: Text(desc,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                ))),
        Expanded(
          child: Container(
              padding: EdgeInsets.all(18),
              height: 5000,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('products')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.all(5),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Product(
                                            snapshot.data.docs
                                                .elementAt(index)['Name']
                                                .toString(),
                                            snapshot.data.docs
                                                .elementAt(index)['imageURL']
                                                .toString(),
                                            snapshot.data.docs
                                                .elementAt(index)['Description']
                                                .toString()),
                                      ));
                                },
                                child: Card(
                                  elevation: 0,
                                  child: Container(
                                    width: 200,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(12),
                                              child: Image.network(
                                                  snapshot.data.docs.elementAt(
                                                      index)['imageURL']),
                                            ),
                                            Container(
                                                width: 200,
                                                height: 30,
                                                color: Colors.black38,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  snapshot.data.docs.elementAt(
                                                          index)['Name'] +
                                                      " >>",
                                                  style: GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.white,
                                                      fontSize: 18),
                                                )),
                                          ],
                                          alignment: Alignment.bottomCenter,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          });
                    }
                  })),
        ),
      ],
    );
  }
}
