import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_pro/carousel_pro.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Health Care"),
        backgroundColor: Color(0xFF222240)
      ),
      backgroundColor: Color(0xFF222240),
      //end of appbar

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
                )
                
              ],
            ),
          ),
        ),
        //end drawer
      body: new ListView(
        children: <Widget>[
          //start first container -- carosul slider
          new Container(
            margin: EdgeInsets.all(5.0),
            height: 200.0,
            decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(20.0)
            ),


              
              child: Container(
                width: MediaQuery.of(context).size.width,
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
                    NetworkImage('https://images.pexels.com/photos/305564/pexels-photo-305564.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                    NetworkImage('https://images.pexels.com/photos/139398/thermometer-headache-pain-pills-139398.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                    NetworkImage('https://images.pexels.com/photos/305565/pexels-photo-305565.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                    NetworkImage('https://images.pexels.com/photos/207601/pexels-photo-207601.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940')
                  ],
                ),
              ),
          ),
          //end first container -- carousul slider



        ],
      ),
    );
  }
}





