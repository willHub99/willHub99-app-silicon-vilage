// ignore_for_file: prefer_const_constructors
import 'package:app_silicon_vilage/widgets/add_widget.dart';
import 'package:app_silicon_vilage/widgets/view_widget.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  int index = 0;

  static const List<Widget> _widgetOptions = [
    AddWidget(),
    ViewWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('App SiliconVilage')),
      ),
      body: Center(
        child: _widgetOptions.elementAt(index),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (context) {
            setState(() {
              index = context;
            });
          },
          selectedItemColor: Colors.blue[400],
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Adicionar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.line_weight),
              label: 'Visualizar',
            ),
          ]),
    );
  }
}
