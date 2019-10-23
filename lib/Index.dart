import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_healthcareapp/View//HomePages/Home.dart';
import 'package:flutter_healthcareapp/View/DetailsPage/TopHealthTipsDetails.dart';
import 'package:flutter_healthcareapp/View//HomePages/DoctorList.dart';
import 'package:flutter_healthcareapp/View//HomePages/HealthTips.dart';


class Index extends StatefulWidget {
  @override
  _IndexState createState() => new _IndexState();
}

class _IndexState extends State<Index> {

  int _selectPage=0;
  final pageOptions=[
    Home(),
    DoctorList(),
    HealthTips(),
    DoctorList(),
    HealthTips(),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(
          title: new Text("Health Care"),
          backgroundColor: Color(0xFF222240)
      ),

      //start drawer
      drawer: new Drawer(
        child: new Container(
          color: Color(0xFF222240),
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: new Text("Health Care",
                  style: TextStyle(
                      fontSize: 20.0
                  ),
                ),
                accountEmail: null,
                decoration: new BoxDecoration(
                    color: Color(0xFF272B4A)
                ),
              ),
              ListTile(
                title: Text("Home",
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white
                  ),
                ),
                leading: Icon(Icons.home, color: Colors.white,),
              ),
            ],
          ),
        ),
      ),



      body: pageOptions[_selectPage],


      backgroundColor: Color(0xFF222240),
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: Colors.amber,
        backgroundColor: Color(0xFF222240),
        color: Color(0xFF272B4A),
        index: 2,
        animationDuration: Duration(milliseconds: 100),
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white,),
          Icon(Icons.view_headline, size: 30, color: Colors.white,),
          Icon(Icons.compare_arrows, size: 30, color: Colors.white,),
          Icon(Icons.remove_red_eye, size: 30, color: Colors.white,),
          Icon(Icons.print, size: 30, color: Colors.white,),
        ],

        onTap: (int index){
          setState(() {
            _selectPage=index;
          });
        },
      ),

    );
  }
}



