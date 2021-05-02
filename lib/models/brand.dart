import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Brand {
  final String image, title;
  final int id;
  Brand({
    this.id,
    this.image,
    this.title,
  });
}



