import 'package:flutter/material.dart';
import 'package:flutter_app/UI/pages/message_page.dart';

import 'Resourses/app_strings.dart';
import 'UI/pages/autorization.dart';

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
