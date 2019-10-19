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

          new SizedBox(height: 10.0,),

          //second container start

          new Container(
            margin: EdgeInsets.all(10.0),
            child: Card(
              elevation: 10.0,
              color: Color(0xFF272722),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  new Container(
                    margin: EdgeInsets.all(8.0),
                    child: new Column(
                      children: <Widget>[

                        new Container(
                          child: new CircleAvatar(
                            child: Text(widget.snapshot.data["title"][0],
                            ),
                            backgroundColor: Colors.deepOrange,
                            foregroundColor: Colors.white,
                          ),
                        ),
                        new SizedBox(height: 6.0,),

                        new Container(
                          child: new Row(
                            children: <Widget>[
                              
                              new Icon(Icons.remove_red_eye,
                              color: Colors.deepOrange,
                              ),
                              
                              new SizedBox(width: 5.0,),
                              
                              new Text(widget.snapshot.data["view"],
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white
                              ),
                              )
                              
                              
                            ],
                          ),
                        )

                      ],
                    ),
                  ),
                  new SizedBox(width: 10.0,),
                  new Container(
                    margin: EdgeInsets.only(top: 10.0),
                    width: MediaQuery.of(context).size.width/1.5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.snapshot.data["title"],
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white
                      ),
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
          //second container end

          new SizedBox(height: 6.0,),

          //third container start

          new Container(
            margin: EdgeInsets.only(left:10.0),
            child: new Card(
              color: Color(0xFF272722),
              shape: new RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)
              ),
              elevation: 10.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Text(widget.snapshot.data["content"],
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white
                ),
                ),
              ),
            ),
          ),

          //third container end



        ],
      ),

      
    );
  }
}






