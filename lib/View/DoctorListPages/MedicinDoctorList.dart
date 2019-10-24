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
                        margin: EdgeInsets.all(10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)
                        ),
                        child: new Container(
                          height: 100.0,
                          decoration: BoxDecoration(
                              color: Color(0xFF60216D),
                            borderRadius: BorderRadius.circular(15.0)
                          ),
                          child: new Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[

                              Expanded(
                                flex: 1,
                                child: new Container(
                                  height: 140.0,
                                  width: 140.0,
                                  margin: EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                         snapshot.data[index].data["image"]
                                        )
                                    )
                                  ),
                                )
                              ),
                              SizedBox(width: 10.0,),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[

                                    Text(snapshot.data[index].data["name"],
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white
                                    ),
                                    ),
                                    SizedBox(height: 5.0,),
                                    Text(snapshot.data[index].data["availability"],
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.white
                                    ),
                                    )

                                  ],
                                ),
                              )

                            ],
                          ),
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


