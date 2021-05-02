import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hmart/screens/homeScreen.dart';
import 'package:firebase_core/firebase_core.dart';

class AppPost extends StatefulWidget {
  @override
  _AppPostState createState() => _AppPostState();
}

class _AppPostState extends State<AppPost> {
  String imgURL = " ";
  String name, description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    setState(() {
                      name = value.trim();
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      contentPadding: EdgeInsets.all(16),
                      hintText: "Product Name",
                      hintStyle: TextStyle(color: Colors.black45)),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      imgURL = value.trim();
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      contentPadding: EdgeInsets.all(16),
                      hintText: "Image Link",
                      hintStyle: TextStyle(color: Colors.black45)),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  minLines: 10,
                  maxLines: 15,
                  onChanged: (value) {
                    setState(() {
                      description = value.trim();
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      contentPadding: EdgeInsets.all(16),
                      hintText: "Description",
                      hintStyle: TextStyle(color: Colors.black45)),
                ),
                SizedBox(
                  height: 25,
                ),

                Row(
                  children: [Spacer(),
                    GestureDetector(
                      onTap: () {

                        Map<String,dynamic> data={
                          "Name": name,
                          "imageURL": imgURL,
                          "Description": description,
                        };

                        CollectionReference ref=FirebaseFirestore.instance.collection('products');
                        ref.add(data);


                      },
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.deepPurpleAccent,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.only(
                              top: 15, bottom: 15, left: 45, right: 45),
                          child: Text("Submit Post",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
