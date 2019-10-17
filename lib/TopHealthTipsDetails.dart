import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';


class TopHealthTipsDetails extends StatefulWidget {
  
  DocumentSnapshot snapshot;
  
  TopHealthTipsDetails(this.snapshot);
  
  @override
  _TopHealthTipsDetailsState createState() => new _TopHealthTipsDetailsState();
}

class _TopHealthTipsDetailsState extends State<TopHealthTipsDetails> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      
      appBar: new AppBar(
        title: new Text("Top HealthTips Details"),
        backgroundColor: Color(0xff222240),
      ),
      
    );
  }
}






