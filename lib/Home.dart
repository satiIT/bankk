//import 'dart:js';

import 'package:bankk/singin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'hoomeUser.dart';
class Home extends StatefulWidget {
  Home({Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> sati = GlobalKey<FormState>();
  var em, pas;
  void login() async{
      WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
    final ali =sati.currentState;
    print("login me");
     if(ali!.validate()){

      ali!.save();
      //print(em);
      //print("   "+pas);  
      try {

      UserCredential sa =  await FirebaseAuth.instance.signInWithEmailAndPassword(email: em, password: pas);
      final User? s = sa.user;
      print('as${sa}');
     print("Try code");
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>homeUser(ue: s,)
     )
     );
     }
     catch(error){
       print("catch code");
            print(error.toString());
     }
     }
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Bankk')),
          bottom: TabBar(
            tabs: [
              Tab(
                // text: "Acount",
                child: Text(
                  "Account",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Tab(
                // text: "Mobile",
                child: Text(
                  "Mobile",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              )
            ],
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Form(
                key: sati,
                  child: Container(
                margin: EdgeInsets.all(12),
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        icon: Icon(Icons.account_box_outlined),
                        border: UnderlineInputBorder(),
                        labelText: 'Ac.No',
                        //   hintText: 'AC.NO'
                      ),
                    validator: (val) {
                       print('em val');
                      if(  val == null || val.isEmpty){
                        print("Error");
                        return 'Error mail';
                      }
                            //? print("Error email")
                         //   : print("good email");
                      },
                      onSaved: (value){
                        em=value;
                        print('edd');

                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        icon: Icon(Icons.password_outlined),
                        labelText: 'Password',
                        // hintText: 'Passwoer'
                      ),
                  //    validator:(val){  if(  val.isEmpty){
                  //      return 'Error pas';
                  ///    }
                   //   },
                      validator: (val) {
                       print('em val');
                      if(  val == null || val.isEmpty){
                        print("Error");
                        return 'Error pass';
                      }},
                      onSaved: (value) => pas = value,
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width -5,
                      height: MediaQuery.of(context).size.height/20,
                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  //    color: Colors.redAccent,
                      child: RaisedButton(onPressed: login,
                      color: Colors.redAccent,
                        //width: MediaQuery.of(context).size.width -5,
                       elevation:12,
                      child:Text("login" ,style: TextStyle(
                      color: Colors.white
                      ),)
                      ),

                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlatButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>singin()));
                        }, child: Text("New Registration?")),
                        FlatButton(onPressed: (){}, child: Text("forgeet password?")),
                      ],
                    ),
                    Container(
                     alignment: AlignmentDirectional.centerEnd,
                      decoration: BoxDecoration(
                        
                      ),

                      child: FlatButton.icon(onPressed: (){}, icon: Icon(Icons.qr_code,), label: Text("Share Your",style: TextStyle(
                        
                      ),
                      textAlign: TextAlign.left,)))
          
                  ],
                ),
              )
              )
            ],
          ),
        ),
          bottomNavigationBar: Container(
            color: Colors.redAccent,
            child: BottomNavigationBar(
                 backgroundColor: Colors.redAccent,
              items: const <BottomNavigationBarItem>[
                
                BottomNavigationBarItem(
                  icon: Icon(Icons.facebook),
                  label: 'Facebook',
                ),
                BottomNavigationBarItem(
                  
               
                  icon: Icon(Icons.email),
                  label: 'Mail',
                ),
                // BottomNavigationBarItem(
                //   icon: Icon(Icons.message),
                //   label: 'message',
                // ),
                  BottomNavigationBarItem(
                  icon: Icon(Icons.location_city_outlined),
                  label: 'locate Us',
                ),
                  BottomNavigationBarItem(
                  icon: Icon(Icons.message),
                  label: 'srvey',
                ),
                  BottomNavigationBarItem(
                  icon: Icon(Icons.call),
                  label: 'Mail',
                ),
              ],
              // currentIndex: _selectedIndex,
              selectedItemColor: Colors.amber[800],
              //onTap: ,
            ),
          ),
      ),
    );
  }
}
