import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homeScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file/file.dart';

class Product extends StatelessWidget {
  final String imageURL;
  final String desc;
  final String name;

  Product(this.name, this.imageURL, this.desc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: ProductBody(name, imageURL, desc),
    );
  }
}

class ProductBody extends StatelessWidget {
  final String imageURL;
  final String desc;
  final String name;

  ProductBody(this.name, this.imageURL, this.desc);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Stack(
            children: [
              Positioned.fill(
                child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 250,
                      child:
                          Image.network('https://i.ibb.co/MfQ7MnV/Subtract.jpg'),
                    )),
              ),



              Padding(
                padding: const EdgeInsets.only(top:28.0),
                child: Row(
                  children: [Spacer(),
                    Container(width:260,height:330,child: Card(elevation:20,child: Image.network(imageURL),)),
                    SizedBox(width: 50,),
                    Spacer(),],
                ),
              ),
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.only(left: 40,top: 25),
          child: Text(name,
              style: GoogleFonts.slabo13px(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w900),
              )),
        ),

        Padding(
          padding: EdgeInsets.only(left: 40,top: 15,right: 15,bottom:20),
          child: Text(desc,
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              )),
        ),

      ],
    );
  }
}
