//import 'dart:js';

//import 'dart:js';

import 'package:bankk/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'bill.dart';
import 'history.dart';
import 'transaction.dart';

class homeUser extends StatefulWidget {
  final User? ue;
  homeUser({Key? key, required this.ue}) : super(key: key);

  @override
  _homeUserState createState() => _homeUserState();
}

class _homeUserState extends State<homeUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.ue!.email.toString()),
              Container(
                // padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0)),
                    color: Colors.white),
                // color: Colors.white,
                height: 35, //MediaQuery.of(context).size.height,
                // decoration: BoxDecoration(borderRadius: Border.all(color: Colors.white10 ,width: 1.0, BorderStyle.values())),
                child: FlatButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                  child: Text("logout"),
                ),
              )
            ],
          ),
        ),
        body: Container(
          child: GridView.count(
            crossAxisSpacing: 1,
            mainAxisSpacing: 3,
            crossAxisCount: 3,
            childAspectRatio: 3 / 2,
            padding: EdgeInsets.all(8.0),
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0)),
                    color: Colors.red),
                margin: EdgeInsets.all(5),
                //color: Colors.redAccent,
                width: MediaQuery.of(context).size.width / 1.5,
                child: Center(
                  child: InkWell(
                         onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>transaction()));
                    },
                    child: Text(
                      "Transaction",
                       style: TextStyle(color: Colors.black,
                     // backgroundColor: Colors.white70,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0)),
                    color: Colors.red),
                margin: EdgeInsets.all(5),
                //color: Colors.redAccent,
                width: MediaQuery.of(context).size.width / 1.5,
                child: Center(
                
                  child: InkWell(
                    
                         onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>bill()));
                    },
                    child: Text(
                      "Billers",
                     style: TextStyle(color: Colors.black,
                     // backgroundColor: Colors.white70,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0)),
                    color: Colors.red),
                margin: EdgeInsets.all(5),
                //color: Colors.redAccent,
                width: MediaQuery.of(context).size.width / 1.5,
                child: Center(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>history()));
                    },
                    child: Text(
                      "Hestory",
                      style: TextStyle(color: Colors.black,
                     // backgroundColor: Colors.white70,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
