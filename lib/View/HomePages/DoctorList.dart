import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';


class DoctorList extends StatefulWidget {
  @override
  _DoctorListState createState() => new _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      backgroundColor: Color(0xFF222240),

      body: new ListView(
        children: <Widget>[
          //first container start
          new Container(
            margin: EdgeInsets.all(5.0),
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
                      'https://images.pexels.com/photos/305568/pexels-photo-305568.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                  NetworkImage(
                      'https://images.pexels.com/photos/725998/pexels-photo-725998.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                  NetworkImage(
                      'https://images.pexels.com/photos/40559/medic-hospital-laboratory-medical-40559.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                  NetworkImage(
                      'https://images.pexels.com/photos/965989/pexels-photo-965989.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                  NetworkImage(
                    'https://images.pexels.com/photos/264591/pexels-photo-264591.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
                  ),
                  NetworkImage(
                    'https://images.pexels.com/photos/264829/pexels-photo-264829.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
                  ),

                ],
              ),
            ),
          ),
          //first container end..
          
        ],
      ),



    );
  }
}

