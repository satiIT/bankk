import 'package:flutter/material.dart';
class history extends StatefulWidget {
  history({Key? key}) : super(key: key);

  @override
  _historyState createState() => _historyState();
}

class _historyState extends State<history> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("history")),
    )
    ;
  }
}