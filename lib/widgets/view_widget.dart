// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewWidget extends StatefulWidget {
  const ViewWidget({Key? key}) : super(key: key);

  @override
  _ViewWidgetState createState() => _ViewWidgetState();
}

class _ViewWidgetState extends State<ViewWidget> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('app-silicon-vilage').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          shrinkWrap: true,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return Align(
                alignment: Alignment.center,
                child: Text(
                  'Number Add: ' + data["number"].toString(),
                ));
          }).toList(),
        );
      },
    );
  }
}
