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



    );
  }
}


