// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_typing_uninitialized_variables, non_constant_identifier_names, unused_element
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddWidget extends StatefulWidget {
  const AddWidget({Key? key}) : super(key: key);

  @override
  State<AddWidget> createState() => _AddWidgetState();
}

class _AddWidgetState extends State<AddWidget> {
  TextEditingController _textEditingController = TextEditingController();

  CollectionReference number = FirebaseFirestore.instance.collection('app');

  var value;

  Future<void> _updateValueTextButton() {
    value = _textEditingController.text;
    _textEditingController.clear();
    return number
        .add({'number': value})
        .then((value) => print("Number Add"))
        .catchError((error) => print("Failed add Number $error"));
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_literals_to_create_immutables
    return Center(
        child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                TextField(
                  textAlign: TextAlign.center,
                  controller: _textEditingController,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Insira um número Válido',
                  ),
                ),
                Container(height: 10),
                TextButton(
                    onPressed: _updateValueTextButton,
                    child: Icon(Icons.add),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.all(20),
                      primary: Colors.white,
                      backgroundColor: Colors.blue[200],
                      fixedSize: Size(100, 60),
                    ))
              ],
            )));
  }
}
