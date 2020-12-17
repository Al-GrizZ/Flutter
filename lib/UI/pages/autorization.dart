import 'package:flutter/material.dart';
import 'package:flutter_app/Resourses/app_strings.dart';
import 'package:flutter_app/UI/pages/home_page.dart';


class FormText extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyFormState();
}

class _MyFormState extends State {
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(Strings.Autorisation), backgroundColor: Colors.indigoAccent),
        body:Container(
          padding: EdgeInsets.all(10.0),
          child: Form(
             key: _formKey,
             child:
             Column(
               children: <Widget>[
                  Text(Strings.Login, style: TextStyle(fontSize: 19.0),),
                  TextFormField(
                      validator: (value){
                        if (value.isEmpty) return Strings.EnterLogin;
                        else if (value != Strings.ValidatePassword) return Strings.FakeLogin;
                     }),
                  SizedBox(height: 20.0),
                  Text(Strings.Password, style: TextStyle(fontSize: 19.0),),
                  TextFormField(
                      validator: (value){
                        if (value.isEmpty) return Strings.EnterPassword;
                        else if (value != Strings.ValidatePassword) return Strings.FakePassword;
                      }),
                  SizedBox(height: 20.0),
              ButtonTheme(
                buttonColor: Colors.indigoAccent,
                highlightColor: Colors.lightBlueAccent,
                minWidth: 15,
                height: 15,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.all(12),
                  child: RaisedButton(
                    onPressed: (){
                      if(_formKey.currentState.validate())
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text(Strings.SignUp, style: TextStyle(fontSize: 15)),
                    textColor: Colors.white,
                  ),
              )
                ],
              )
          )
       )
    );
  }
}