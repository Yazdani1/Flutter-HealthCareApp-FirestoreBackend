import 'package:flutter/material.dart';
import 'package:flutter_healthcareapp/View/HomePages/HospitalList.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';


class HospitalDetailPages extends StatefulWidget {

  DocumentSnapshot snapshot;
  HospitalDetailPages(this.snapshot);

  @override
  _HospitalDetailPagesState createState() => new _HospitalDetailPagesState();
}

class _HospitalDetailPagesState extends State<HospitalDetailPages> {
  
  Future getallDoctor() async {
    var fr = Firestore.instance;
    QuerySnapshot snap = await fr.collection("MedicinDoctorList")
        .getDocuments();
    return snap.documents;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      //appbar start
      appBar: new AppBar(
        title: new Text("Hospital Details"),
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
      //end appbar

      body: SlidingUpPanel(
        panel: _panel_Doctorlist(),
        color: Colors.deepOrange,
        parallaxEnabled: true,
        parallaxOffset: .5,
        collapsed: _floatingCollapsed(),

        body: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          decoration: BoxDecoration(
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

              Container(
                height: 200.0,
                margin: EdgeInsets.all(4.0),
                child: Card(
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network(widget.snapshot.data["image"],
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.0,),
              Container(
                margin: EdgeInsets.all(6.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.snapshot.data["name"],
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white
                      ),
                    ),
                    SizedBox(height: 5.0,),
                    Text(widget.snapshot.data["address"],
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(6.0),
                height: 80.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    //first container start
                    Container(
                      height: 80.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: <Color>[
                            Colors.red,
                            Colors.amber,
                          ],
                        ),
                      ),
//                      decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(15.0),
//                        gradient: LinearGradient(
//                          begin: Alignment.topRight,
//                          end: Alignment.bottomLeft,
//                          colors: [
//                            Colors.deepOrange[400],
//                            Colors.deepOrange[900],
//                            Colors.green[900],
//                            Colors.pink[400],
//                          ],
//                        ),
//                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(widget.snapshot.data["dtnumber"],
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white
                            ),
                          ),
                          SizedBox(height: 5.0,),
                          Text("Doctor",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                    //first container end
                    //Second container start...
                    Container(
                      height: 80.0,
                      width: 100.0,
                      margin: EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: <Color>[
                            Colors.red,
                            Colors.amber,
                          ],
                        ),
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(widget.snapshot.data["staff"],
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white
                            ),
                          ),
                          SizedBox(height: 5.0,),
                          Text("Staff",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                    //end second container

                    //start third container
                    Container(
                      height: 80.0,
                      width: 100.0,
                      margin: EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: <Color>[
                            Colors.red,
                            Colors.amber,
                          ],
                        ),
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(widget.snapshot.data["Rank"],
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white
                            ),
                          ),
                          SizedBox(height: 5.0,),
                          Text("Rank",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white
                            ),
                          ),

                        ],
                      ),
                    ),
                    //end third container
                    //start fourth container
                    Container(
                      height: 80.0,
                      width: 100.0,
                      margin: EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: <Color>[
                            Colors.red,
                            Colors.amber,
                          ],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(widget.snapshot.data["Operation"],
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white
                            ),
                          ),
                          SizedBox(height: 5.0,),
                          Text("Operation",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                    //end fourth container

                    //start fifth container
                    Container(
                      height: 80.0,
                      width: 100.0,
                      margin: EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: <Color>[
                            Colors.red,
                            Colors.amber,
                          ],
                        ),
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(widget.snapshot.data["Branch"],
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white
                            ),
                          ),
                          SizedBox(height: 5.0,),
                          Text("Branch",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white
                            ),
                          ),

                        ],
                      ),
                    ),
                    //end fifth container


                  ],
                ),
              ),

              //description container start
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 1,
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[
                      Colors.red,
                      Colors.amber,
                    ],
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  child: Text(widget.snapshot.data["des"],
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white
                    ),
                  ),
                ),
              )
              //description container end

            ],
          ),
        ),
      ),

    );
  }

  Widget _panel_Doctorlist() {
    return Container(
      height: 600.0,
      decoration: BoxDecoration(
          color: Colors.deepOrange,
          borderRadius: BorderRadius.circular(15.0)
      ),
      child: Column(
        children: <Widget>[

          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 50,
                height: 3,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12.0))
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0,),
          //medicin doctor list start
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height / 1.50,
            margin: EdgeInsets.all(6.0),
            child: ListView(
              children: <Widget>[
                //First Container
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Medicin Doctor",
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white
                            ),
                          ),
                          Text("See All",
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white
                            ),
                          ),
                        ],),
                      SizedBox(height: 8.0,),
                      _medicinDoctorlist(),
                    ],
                  ),
                ),
                SizedBox(height: 6.0,),

                //end first container
                //second container start
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Medicin Doctor",
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white
                            ),
                          ),
                          Text("See All",
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white
                            ),
                          ),
                        ],),
                      SizedBox(height: 8.0,),
                      _medicinDoctorlist(),
                    ],
                  ),
                ),
                //end second container end

                //start third container
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Medicin Doctor",
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white
                            ),
                          ),
                          Text("See All",
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white
                            ),
                          ),
                        ],),
                      SizedBox(height: 8.0,),
                      _medicinDoctorlist(),
                    ],
                  ),
                ),
                //end third container

                //start fourth cointer
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Medicin Doctor",
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white
                            ),
                          ),
                          Text("See All",
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white
                            ),
                          ),
                        ],),
                      SizedBox(height: 8.0,),
                      _medicinDoctorlist(),
                    ],
                  ),
                ),
                //end fourth countrianer

              ],
            ),
          ),
          //medicin doctor list end


        ],
      ),

    );
  }

  Widget _floatingCollapsed() {
    return Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
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
//      decoration: BoxDecoration(
//        color: Colors.green,
//        borderRadius: BorderRadius.only(
//            topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
//      ),
      child: Center(
        child: Column(
          children: <Widget>[

            SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 50,
                  height: 2,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12.0))
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.0,),
            Text(
              "Doctor List",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _medicinDoctorlist() {
    return Container(
      //margin: EdgeInsets.all(6.0),
      height: 260.0,
      child: FutureBuilder(
          future: getallDoctor(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text("Loading..",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white
                  ),
                ),
              );
            } else {
              return Container(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)
                        ),
                        child: Container(
                          width: 200.0,
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
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 100.0,
                                width: 100.0,
                                margin: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            snapshot.data[index]
                                                .data["image"]
                                        )
                                    )
                                ),
                              ),
                              SizedBox(height: 30.0,),
                              Text(snapshot.data[index].data["name"],
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white
                                ),
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                snapshot.data[index].data["availability"],
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white
                                ),
                              ),
                              Container(
                                width: 150.0,
                                margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                                height: 0.6,
                                color: Colors.white,
                              ),
                              Text(
                                snapshot.data[index].data["experience"],
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white
                                ),
                              ),
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
    );
  }
}


