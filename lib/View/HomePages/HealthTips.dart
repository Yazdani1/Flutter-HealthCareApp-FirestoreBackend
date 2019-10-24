import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class HealthTips extends StatefulWidget {
  @override
  _HealthTipsState createState() => new _HealthTipsState();
}

class _HealthTipsState extends State<HealthTips> {

  Future getallHealthtips() async {
    var firestore = Firestore.instance;
    QuerySnapshot snap = await firestore.collection("HealthTips")
        .getDocuments();
    return snap.documents;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: new Container(

          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.green[900],
                Colors.deepOrange[600],
                Colors.amber[400],
              ],
            ),
          ),

          child: FutureBuilder(
              future: getallHealthtips(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: Container(
                        child: new Text("Data Loading...",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white
                          ),
                        ),
                      )
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 100.0,
                          margin: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Colors.deepOrange[400],
                                Colors.amber[400],
                              ],
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[

                              new Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.deepOrange,
                                    borderRadius: BorderRadius.circular(55.0),
                                      border: Border.all(
                                          style: BorderStyle.solid,
                                          color: Colors.white)
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text("TIPS",
                                      style: TextStyle(
                                          fontSize: 25.0,
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(width: 6.0,),

                              Container(
                                width: 0.8,
                                margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                                height: double.maxFinite,
                                color: Colors.white,
                              ),

                              new Expanded(
                                flex: 3,
                                child: Container(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text("Health Tips",
                                      style: TextStyle(
                                          fontSize: 25.0,
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                ),
                              ),


                            ],
                          ),
                        );
                      }
                  );
                }
              }
          )

      ),


    );
  }

  backgroudnDesign() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.deepOrange[400],
            Colors.lightGreen[200],
            Colors.yellow[600],
            Colors.amber[400],
          ],
        ),
      ),

    );
  }

}


