import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:flutter_healthcareapp/View/DetailsPage/HospitalDetailsPages/HospitalDetailPages.dart';

class HospitalList extends StatefulWidget {
  @override
  _HospitalListState createState() => new _HospitalListState();
}

class _HospitalListState extends State<HospitalList> {

  Future hospitalList() async {
    var firestore = Firestore.instance;
    QuerySnapshot snap = await firestore.collection("HospitalList")
        .getDocuments();
    return snap.documents;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: Container(

        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.deepOrange[400],
              Colors.deepOrange[900],
              Colors.green[900],
              Colors.pink[400],
            ],
          ),
        ),

        child: FutureBuilder(
            future: hospitalList(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 150.0,
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Colors.yellow[400],
                              Colors.green[800],
                              Colors.purple[900],
                              Colors.pink[400],
                            ],
                          ),
                        ),
                        child: Row(
                          children: <Widget>[

                            Expanded(
                              flex: 1,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.network(
                                  snapshot.data[index].data["image"],
                                  height: 150.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 6.0,),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[

                                  Text(snapshot.data[index].data["name"],
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 25.0,
                                        color: Colors.white
                                    ),
                                  ),


                                  SizedBox(height: 5.0,),
                                  Text(snapshot.data[index].data["address"],
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 5.0,),
                                  Text(snapshot.data[index].data["dtnumber"] +
                                      "Specialist Doctor",
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(height: 20.0,),
                                  Container(
                                    height: 40.0,
                                    width: 150.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          20.0),
                                      color: Colors.green,
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(1.0, 6.0),
                                          blurRadius: 5.0,
                                        ),
                                      ],
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              new MaterialPageRoute(
                                                  builder: (context) =>
                                                      HospitalDetailPages(
                                                          snapshot
                                                              .data[index])));
                                        },
                                        child: Text("More Details..",
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.white
                                          ),
                                        ),
                                      ),
                                    ),
                                  )

                                ],
                              ),
                            ),

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



