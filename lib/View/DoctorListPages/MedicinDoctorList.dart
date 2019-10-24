import 'package:flutter/material.dart';


class MedicinDoctorList extends StatefulWidget {
  @override
  _MedicinDoctorListState createState() => new _MedicinDoctorListState();
}

class _MedicinDoctorListState extends State<MedicinDoctorList> {
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
                Colors.amber
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
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.deepOrange[400],
              Colors.lightGreen[200],
              Colors.yellow[600],
              Colors.amber[400],
            ],
          ),
        ),


      ),

    );
  }
}



