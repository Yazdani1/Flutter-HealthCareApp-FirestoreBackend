import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_healthcareapp/View/DoctorListPages/EndocrinologistDoctorList.dart';
import 'package:flutter_healthcareapp/View/DoctorListPages/MedicinDoctorList.dart';
import 'package:flutter_healthcareapp/View/DoctorListPages/NeurologistDoctorList.dart';
import 'package:flutter_healthcareapp/View/DoctorListPages/PsychiatristDoctorList.dart';


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

          //second container start
          doctortypes(),
          //second container end


        ],
      ),


    );
  }

  Widget doctortypes() {
    return Container(
      margin: EdgeInsets.all(10.0),

      height: MediaQuery
          .of(context)
          .size
          .height / 2,
      child: new Column(
        children: <Widget>[

          //first container start
          new Container(
            height: 150.0,
            child: new Row(
              children: <Widget>[

                new Expanded(
                  flex: 1,
                  child: new Container(
                    decoration: new BoxDecoration(
                      color: Color(0xFF272B4A),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: new Column(
                      children: <Widget>[

                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: new Image.network(
                            "https://images.pexels.com/photos/159211/headache-pain-pills-medication-159211.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                            height: 110.0,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            fit: BoxFit.cover,
                          ),
                        ),
                        new SizedBox(height: 10.0,),

                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (context) =>
                                    PsychiatristDoctorList()));
                          },
                          child: Text("Psychiatrist Doctor",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.lightGreen
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                ),
                new SizedBox(width: 10.0,),

                new Expanded(
                  flex: 1,
                  child: new Container(
                    decoration: new BoxDecoration(
                      color: Color(0xFF272B4A),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: new Column(
                      children: <Widget>[

                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: new Image.network(
                            "https://images.pexels.com/photos/356040/pexels-photo-356040.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                            height: 110.0,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            fit: BoxFit.cover,
                          ),
                        ),
                        new SizedBox(height: 10.0,),

                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (context) =>
                                    EndocrinologistDoctorList()));
                          },
                          child: Text("Endocrinologist Doctor",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.lightGreen
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),


              ],
            ),
          ),
          //first container end

          new SizedBox(height: 10.0,),

          new Container(
            height: 150.0,
            child: new Row(
              children: <Widget>[

                new Expanded(
                  flex: 1,
                  child: new Container(
                    decoration: new BoxDecoration(
                      color: Color(0xFF272B4A),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: new Column(
                      children: <Widget>[

                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: new Image.network(
                            "https://images.pexels.com/photos/42273/doctor-medical-medicine-health-42273.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                            height: 110.0,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            fit: BoxFit.cover,
                          ),
                        ),
                        new SizedBox(height: 10.0,),

                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (context) =>
                                    NeurologistDoctorList()));
                          },
                          child: Text("Neurologist Doctor",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.lightGreen
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                ),
                new SizedBox(width: 10.0,),

                new Expanded(
                  flex: 1,
                  child: new Container(
                    decoration: new BoxDecoration(
                      color: Color(0xFF272B4A),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: new Column(
                      children: <Widget>[

                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: new Image.network(
                            "https://images.pexels.com/photos/4154/clinic-doctor-health-hospital.jpg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                            height: 110.0,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            fit: BoxFit.cover,
                          ),
                        ),
                        new SizedBox(height: 10.0,),

                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (context) =>
                                    MedicinDoctorList()));
                          },
                          child: Text("Medicin Doctor",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.lightGreen
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }


}

