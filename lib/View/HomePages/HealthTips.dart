import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_pro/carousel_pro.dart';

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

  Future<Null>getRefresh()async{

    await Future.delayed(Duration(seconds: 3));

    setState(() {
      getallHealthtips();
    });

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
                      child:Theme(
                        data: Theme.of(context).copyWith(accentColor: Colors.black),
                        child: new CircularProgressIndicator(),
                      )
                  );
                } else {
                  return RefreshIndicator(
                    onRefresh: getRefresh,
                    backgroundColor: Colors.blueGrey,
                    color: Colors.white,
                    child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 100.0,
                            margin: EdgeInsets.all(9.0),
                            decoration: BoxDecoration(
                              borderRadius: new BorderRadius.circular(15.0),
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Colors.green[400],
                                  //Colors.brown[900],
                                  Colors.deepOrange[600],
                                  Colors.amber[900],
                                ],
                              ),
                            ),
//                          decoration: BoxDecoration(
//                            borderRadius: BorderRadius.circular(15.0),
//                            gradient: LinearGradient(
//                              begin: Alignment.topRight,
//                              end: Alignment.bottomLeft,
//                              colors: [
//                                Colors.deepOrange[600],
//                                Colors.amber[500],
//                                //Color(0xFF60226D)
//                              ],
//                            ),
//                          ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[

                                new Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.all(5.0),
//                                  decoration: BoxDecoration(
//                                    //color: Color(0xFF60226D),
//                                    shape: BoxShape.circle,
//                                  ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text("TIPS",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.amber
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 2.0,),
                                Container(
                                  width: 0.5,
                                  margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                                  height: double.maxFinite,
                                  color: Colors.white,
                                ),

                                new Expanded(
                                  flex: 4,
                                  child: Container(
                                    padding: EdgeInsets.all(6.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: <Widget>[

                                        InkWell(
                                          onTap: () {
                                            customDialog(context,
                                                snapshot.data[index]
                                                    .data["title"],
                                                snapshot.data[index]
                                                    .data["content"]
                                            );
                                          },
                                          child: Text(
                                            snapshot.data[index].data["title"],
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.white
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 6.0,),
                                        Text(snapshot.data[index].data["content"],
                                          maxLines: 3,
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.white
                                          ),
                                        )

                                      ],
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          );
                        }
                    ),
                  );
                }
              }
          )
      ),

    );
  }

  customDialog(BuildContext context, String title, content) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
            ),
            child: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 1,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(15.0),
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
              child: ListView(
                children: <Widget>[

                  new Container(
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
                        dotSize: 7.0,
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
                              'https://images.pexels.com/photos/461428/pexels-photo-461428.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                          NetworkImage(
                              'https://images.pexels.com/photos/1640770/pexels-photo-1640770.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                          NetworkImage(
                              'https://images.pexels.com/photos/4154/clinic-doctor-health-hospital.jpg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                          NetworkImage(
                              'https://images.pexels.com/photos/279470/pexels-photo-279470.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940')
                        ],
                      ),
                    ),
                  ),

//                  ClipRRect(
//                    borderRadius: BorderRadius.circular(20.0),
//                    child: Image.network(
//                      "https://images.pexels.com/photos/271171/pexels-photo-271171.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
//                      height: 150.0,
//                      width: MediaQuery
//                          .of(context)
//                          .size
//                          .width,
//                      fit: BoxFit.cover,
//                    ),
//                  ),
                  SizedBox(height: 6.0,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(title,
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0,),
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(left: 5.0, right: 5.0),
                    height: 0.5,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(content,
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white
                      ),
                    ),
                  ),

                  SizedBox(height: 40.0,),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        height: 50.0,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 0.5,
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(1.0, 6.0),
                              blurRadius: 10.0,
                            ),
                          ],
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[

                            Text("Need Doctor Help?",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white
                              ),
                            ),

                            Icon(
                              Icons.forward, color: Colors.white, size: 25.0,)

                          ],
                        ),
                      ),
                    ),
                  )


                ],
              )
              ,
            )
            ,
          );
        }
    );
  }


}


