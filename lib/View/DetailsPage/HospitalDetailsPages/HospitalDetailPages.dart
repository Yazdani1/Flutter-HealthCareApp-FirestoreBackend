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
        collapsed: _floatingCollapsed(),

        body: Container(

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


}


