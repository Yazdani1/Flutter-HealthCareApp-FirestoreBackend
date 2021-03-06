import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'dart:async';
import 'package:flutter_healthcareapp/View/DetailsPage/TopHealthTipsDetails.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {

//  Future getAllPost() async{
//
//    var firestore=Firestore.instance;
//    QuerySnapshot sp=await firestore.collection("posts").getDocuments();
//    return sp.documents;
//  }

  // start Top Health tips firestore


  Future getHealthtips() async {
    var firestore = Firestore.instance;
    QuerySnapshot snapshot = await firestore.collection("TopHealthTips")
        .getDocuments();
    return snapshot.documents;
  }

  Future getTopDoctor() async {
    var firestore = Firestore.instance;
    QuerySnapshot snapshot = await firestore.collection("TopDoctor")
        .getDocuments();
    return snapshot.documents;
  }

  Future<Null> getRefresh() async {
    await Future.delayed(Duration(seconds: 3));

    setState(() {
      getHealthtips();
    });
  }


//  @override
//  void initState() {
//    //health tips firestore
//    subscription = collectionReference.snapshots().listen((datasnap) {
//      setState(() {
//        snapshot = datasnap.documents;
//      });
//      //end health tips firestore
//
//      doctor_subscription = dtcollection.snapshots().listen((dtsnap) {
//        setState(() {
//          dtsnapshot = dtsnap.documents;
//        });
//      });
//    });
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      backgroundColor: Color(0xFF222240),
      //end of appbar
      //end drawer
      //end drawer
      body: new ListView(
        children: <Widget>[
          //start first container -- carosul slider
          new Container(
            margin: EdgeInsets.all(6.0),
            height: 200.0,
            decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(20.0)
            ),
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Carousel(
                boxFit: BoxFit.cover,
                autoplay: true,
                animationCurve: Curves.fastOutSlowIn,
                animationDuration: Duration(milliseconds: 1000),
                dotSize: 8.0,
                dotIncreasedColor: Colors.red,
                dotBgColor: Colors.transparent,
                dotPosition: DotPosition.bottomCenter,
                dotVerticalPadding: 7.0,
                showIndicator: true,
                borderRadius: true,
                indicatorBgPadding: 10.0,
                overlayShadow: true,
                overlayShadowColors: Colors.black.withOpacity(0.4),
                overlayShadowSize: 10.0,
                images: [

                  NetworkImage(
                      'https://images.pexels.com/photos/305564/pexels-photo-305564.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                  NetworkImage(
                      'https://images.pexels.com/photos/139398/thermometer-headache-pain-pills-139398.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                  NetworkImage(
                      'https://images.pexels.com/photos/305565/pexels-photo-305565.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                  ExactAssetImage(
                      'https://images.pexels.com/photos/207601/pexels-photo-207601.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940')
                ],
              ),
            ),
          ),
          //end first container -- carousul slider
          //second container health tips
          new Container(
            margin: EdgeInsets.all(5.0),
            height: 190.0,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                new Container(
                  padding: EdgeInsets.all(10.0),
                  child: new Text("Top Health Tips",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white
                    ),
                  ),
                ),
                new Container(
                  height: 130.0,
                  child: FutureBuilder(
                      future: getHealthtips(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                              child: new CircularProgressIndicator()
                          );
                        } else {
                          return RefreshIndicator(
                            onRefresh: getRefresh,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    elevation: 10.0,
                                    margin: EdgeInsets.only(left: 10.0),
                                    color: Color(0xFF262724),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),

                                    child: new Container(
                                      height: 130.0,
                                      width: 300.0,
                                      decoration: BoxDecoration(
                                        borderRadius: new BorderRadius.circular(
                                            15.0),
                                        gradient: LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                            Colors.green[400],
                                            Colors.brown[900],
                                            Colors.deepOrange[600],
                                            Colors.amber[900],
                                          ],
                                        ),
                                      ),
                                      child: new Row(
                                        children: <Widget>[
                                          new Expanded(
                                            flex: 1,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius
                                                  .circular(
                                                  15.0),
                                              child: new Image.network(
                                                snapshot.data[index]
                                                    .data["image"],
                                                height: 130.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          new SizedBox(width: 10.0,),
                                          new Expanded(
                                            flex: 3,
                                            child: new Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: <Widget>[

                                                Padding(
                                                  padding: const EdgeInsets
                                                      .only(
                                                      top: 5.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .push(
                                                          new MaterialPageRoute(
                                                              builder: (
                                                                  context) =>
                                                                  TopHealthTipsDetails(
                                                                      snapshot
                                                                          .data[index])));
                                                    },
                                                    child: new Text(
                                                      snapshot.data[index]
                                                          .data["title"],
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                          fontSize: 18.0,
                                                          color: Colors.white
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                new SizedBox(height: 5.0,),
                                                new Text(
                                                  snapshot.data[index]
                                                      .data["content"],
                                                  maxLines: 3,
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      color: Colors.white
                                                  ),
                                                ),
                                                new SizedBox(height: 10.0,),
                                                Align(
                                                  alignment: Alignment
                                                      .bottomLeft,
                                                  child: new Container(
                                                    child: new Row(
                                                      children: <Widget>[
                                                        new Icon(
                                                          Icons.remove_red_eye,
                                                          color: Colors.white,
                                                        ),
                                                        new SizedBox(
                                                          width: 5.0,),

                                                        new Text(
                                                          snapshot.data[index]
                                                              .data["view"],
                                                          style: TextStyle(
                                                              fontSize: 16.0,
                                                              color: Colors
                                                                  .white
                                                          ),
                                                        )

                                                      ],
                                                    ),
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

                            ),
                          );
                        }
                      }
                  ),
                ),

                new SizedBox(height: 5.0,)
              ],
            ),
          ),
          //end second container health tips
          //start third container
          new Container(
            margin: EdgeInsets.only(left: 5.0, top: 10.0),
            height: 300.0,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text("Top Doctor List",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white
                      ),
                    ),
                  ),
                ),

                new SizedBox(height: 5.0,),

                new Container(
                  height: 230.0,
                  child: FutureBuilder(
                      future: getTopDoctor(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                              child: new CircularProgressIndicator()
                          );
                        } else {
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  elevation: 10.0,
                                  margin: EdgeInsets.only(left: 10.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0)
                                  ),
                                  color: Color(0xFF272B4A),
                                  child: new Container(
                                    width: 220.0,
                                    decoration: BoxDecoration(
                                      borderRadius: new BorderRadius.circular(
                                          15.0),
                                      gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Colors.green[400],
                                          Colors.brown[900],
                                          Colors.deepOrange[600],
                                          Colors.amber[900],
                                        ],
                                      ),
                                    ),
                                    child: new Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: <Widget>[
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              10.0),
                                          child: new Image.network(
                                            snapshot.data[index].data["image"],
                                            height: 130.0,
                                            width: 220.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        new SizedBox(height: 6.0,),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: new Text(
                                            snapshot.data[index].data["title"],
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.white
                                            ),
                                          ),
                                        ),
                                        new SizedBox(height: 7.0,),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: new Text(
                                            snapshot.data[index].data["type"],
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.amberAccent
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                );
                              }
                          );
                        }
                      }
                  ),
                )

              ],
            ),
          ),
          //end third container
        ],
      ),

//      bottomNavigationBar: Theme(
//
//      data: Theme.of(context).copyWith(
//            canvasColor: Color(0xFF23235A),
//        ),
//        child: new BottomNavigationBar(
//
//            items: [
//              BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.white,),title: new Text("Home",style: TextStyle(color: Colors.white),)),
//              BottomNavigationBarItem(icon: Icon(Icons.dock,color: Colors.white,),title: Text("Health Tips",style: TextStyle(color: Colors.white))),
//              BottomNavigationBarItem(icon: Icon(Icons.remove_red_eye,color: Colors.white,),title: Text("Doctor List",style: TextStyle(color: Colors.white)))
//            ]
//        ),
//      ),

    );
  }
}





