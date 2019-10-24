import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';


class MedicinDoctorList extends StatefulWidget {
  @override
  _MedicinDoctorListState createState() => new _MedicinDoctorListState();
}

class _MedicinDoctorListState extends State<MedicinDoctorList> {

  Future getAllpost() async {
    var fr = Firestore.instance;
    QuerySnapshot snap = await fr.collection("MedicinDoctorList")
        .getDocuments();
    return snap.documents;
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(
        title: new Text("MedicinDoctorList"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Colors.red,
                Colors.amber,
              ],
            ),
          ),
        ),
      ),

      body: new Container(

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
        child: new FutureBuilder(
            future: getAllpost(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: new Text("Data Loading..."),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 10.0,
                        margin: EdgeInsets.all(5.0),
                        child: Row(
                          children: <Widget>[
                            
                          ],
                        ),
                      );
                    }
                );
              }
            }
        ),
      ),

    );
  }
}



