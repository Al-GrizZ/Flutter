import 'package:flutter/material.dart';
import 'package:flutter_app/UI/pages/Message_Page.dart';

import 'Resourses/app_strings.dart';
import 'UI/pages/Autorization.dart';

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(

            body: FormText()
        )
    );
    }
  }
