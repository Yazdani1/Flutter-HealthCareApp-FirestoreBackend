import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_healthcareapp/View/HomePages/HealthTips.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';

class EndocrinologistDoctorList extends StatefulWidget {
  @override
  _EndocrinologistDoctorListState createState() =>
      new _EndocrinologistDoctorListState();
}

class _EndocrinologistDoctorListState extends State<EndocrinologistDoctorList> {
  Future getAllpost() async {
    var fr = Firestore.instance;
    QuerySnapshot snap = await fr.collection("MedicinDoctorList")
        .getDocuments();
    return snap.documents;
  }

  var _refreshKey = GlobalKey<RefreshIndicatorState>();

  String snapshot;

  Future<Null> onrefresh() async {
    await Future.delayed(Duration(seconds: 1));
    _refreshKey.currentState?.show(atTop: false);
    setState(() {
      getAllpost();
    });
  }

  double percent = 100;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("EndocrinologistDoctorList"),
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
                  child: HeartbeatProgressIndicator(
                    child: Icon(Icons.library_books,
                      color: Colors.green,
                      size: 60.0,
                    ),
                  ),
                );
              } else {
                return RefreshIndicator(
                  onRefresh: onrefresh,
                  backgroundColor: Colors.green,
                  color: Colors.white,
                  child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Slidable(
                          key: ValueKey(index),
                          actionPane: SlidableDrawerActionPane(),
                          actions: <Widget>[
                            IconSlideAction(
                              caption: 'Archive',
                              color: Colors.deepOrange,
                              icon: Icons.archive,
                              closeOnTap: true,
                            ),
                            IconSlideAction(
                              caption: 'Share',
                              color: Colors.indigo,
                              icon: Icons.share,
                            ),
                          ],
                          secondaryActions: <Widget>[
                            IconSlideAction(
                              caption: 'More',
                              color: Colors.purple,
                              icon: Icons.more_horiz,

                            ),
                            IconSlideAction(
                              caption: 'Delete',
                              color: Colors.red,
                              icon: Icons.delete,
                              onTap: () {
                                Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (context) => HealthTips()));
                              },
                            ),
                          ],
//                        dismissal: SlidableDismissal(
//                          child: SlidableDrawerDismissal(),
//                        ),
                          child: Card(
                            elevation: 5.0,
                            margin: EdgeInsets.all(10.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)
                            ),
                            child: new Container(
                              height: 100.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: <Color>[
                                    Colors.red,
                                    Color(0xFF60216D),
                                  ],
                                ),
                              ),
//                          decoration: BoxDecoration(
//                              color: Color(0xFF60216D),
//                              borderRadius: BorderRadius.circular(15.0)
//                          ),
                              child: new Row(
                                crossAxisAlignment: CrossAxisAlignment
                                    .start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                      flex: 2,
                                      child: new Container(
                                        height: 140.0,
                                        width: 140.0,
                                        margin: EdgeInsets.all(5.0),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: new DecorationImage(
                                                fit: BoxFit.cover,

                                                image: NetworkImage(
                                                  snapshot.data[index]
                                                      .data["image"],
                                                )
                                            )
                                        ),
                                      )
                                  ),
                                  SizedBox(width: 10.0,),
                                  
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: <Widget>[


                                        Text(snapshot.data[index].data["name"],
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white
                                          ),
                                        ),
                                        SizedBox(height: 5.0,),
                                        Text(
                                          snapshot.data[index]
                                              .data["availability"],
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.white
                                          ),
                                        )

                                      ],
                                    ),
                                  ),

                                  new SizedBox(width: 10.0,),

                                  Container(
                                    width: 0.5,
                                    margin: EdgeInsets.only(
                                        top: 5.0, bottom: 5.0),
                                    height: double.maxFinite,
                                    color: Colors.grey,
                                  ),

                                  Expanded(
                                    flex: 2,
                                    child: new Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: <Widget>[

                                        Text(
                                          snapshot.data[index]
                                              .data["experience"],
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white
                                          ),
                                        ),
                                        SizedBox(height: 5.0,),
                                        Text("Experience",
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
                            )
                            ,
                          )
                          ,
                        );
                      }
                  ),
                );
              }
            }
        ),
      ),


    );
  }
}
