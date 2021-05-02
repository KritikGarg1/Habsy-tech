import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hmart/screens/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'product.dart';

class HomePost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18.0, top: 2, bottom: 8),
          child: Text(
            "NEW POSTS >",
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold, color: Colors.black45),
          ),
        ),
        Container(
          height: 220.0,
          child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('products').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
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
                                          child: Image.network(snapshot
                                              .data.docs
                                              .elementAt(index)['imageURL']),
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
                                                  fontWeight: FontWeight.w400,
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
              }),
        ),
      ],
    );
  }
}
