import 'package:flutter/material.dart';


class PsychiatristDoctorList extends StatefulWidget {
  @override
  _PsychiatristDoctorListState createState() => new _PsychiatristDoctorListState();
}

class _PsychiatristDoctorListState extends State<PsychiatristDoctorList> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(
          title: new Text("PsychiatristDoctorList"),
          backgroundColor: Color(0xFF222240)
      ),

    );
  }
}
