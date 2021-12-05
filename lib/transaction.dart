import 'package:flutter/material.dart';
class transaction extends StatefulWidget {
  transaction({Key? key}) : super(key: key);

  @override
  _transactionState createState() => _transactionState();
}

class _transactionState extends State<transaction> {
  var acno,cash;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('tranaction'),),
      body:Container(
        child: Center(
          child: Column(
            children: [
              Form(child: Column(
                children: [
                  TextFormField(
                       decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: 'Ac.NO',
                        // hintText: 'Passwoer'
                      ),
                    validator: (val){
                      if(  val == null || val.isEmpty){
                        print("Error");
                        return 'Error mail';
                      }
                     
                    },
                     onSaved:(val)=>acno=val
                  ),
                      TextFormField(
                           decoration: InputDecoration(
                        icon: Icon(Icons.price_change),
                        labelText: 'cash',
                        // hintText: 'Passwoer'
                      ),
                    validator: (val){
                      if(  val == null || val.isEmpty){
                        print("Error");
                        return 'AcNo not eddit';
                      }
                     
                    },
                     onSaved:(val)=>cash=val
                  ),
                       Container(
                      margin: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width -5,
                      height: MediaQuery.of(context).size.height/20,
                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  //    color: Colors.redAccent,
                      child: RaisedButton(onPressed: (){},
                      color: Colors.redAccent,
                        //width: MediaQuery.of(context).size.width -5,
                       elevation:12,
                      child:Text("Tranfare" ,style: TextStyle(
                      color: Colors.white
                      ),)
                      ),

                    )
                ],
              ))
            ],
          ),
        ),
      )
    );
  }
}