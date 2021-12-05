import 'package:flutter/material.dart';
import 'Home.dart';
void main()=>runApp(MyApp());
 class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      
   title: "Bankak",
   theme: ThemeData(primarySwatch: Colors.red),
   home:Home(),
   debugShowCheckedModeBanner: false,
    );
 
  }
}