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
      backgroundColor: Color(0xFF222240),
      body: new ListView(
        children: <Widget>[

          //first container start

          new Container(
            margin: EdgeInsets.all(10.0),
            child: new ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: new Image.network(widget.snapshot.data["image"],
              height: 250.0,
                fit: BoxFit.cover,
              ),
            ),
          ),

          //first container end


        ],
      ),

      
    );
  }
}






