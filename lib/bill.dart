import 'package:flutter/material.dart';
class bill extends StatefulWidget {
  bill({Key? key}) : super(key: key);

  @override
  _billState createState() => _billState();
}

class _billState extends State<bill> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('billers'),),
    
    );
  }
}