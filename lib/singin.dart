import 'package:bankk/hoomeUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
class singin extends StatefulWidget {
  singin({Key? key}) : super(key: key);

  @override
  _singinState createState() => _singinState();
}

class _singinState extends State<singin> {
  final GlobalKey<FormState> sati = GlobalKey<FormState>();
  var em,pas;
  void singin()async{
     WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
    final ali =sati.currentState;
    print("login me");
     if(ali!.validate()){

      ali!.save();
       UserCredential sa =  await FirebaseAuth.instance.createUserWithEmailAndPassword(email: em, password: pas);
      final User? s = sa.user;
      
     Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> homeUser(ue:  s,)));}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Singin"),),
      body: Form(
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
                      }
                      },
                      onSaved: (value) => pas = value,
                    ),
                   FlatButton(onPressed: singin, child: Text("singin"))
                   ] )
                  )
                  )
                  );
  }
}