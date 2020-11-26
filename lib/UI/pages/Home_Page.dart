import 'package:flutter/material.dart';
import 'package:flutter_app/LieDates/Model.dart';
import 'package:flutter_app/Resourses/app_strings.dart';
import 'package:flutter_app/LieDates/Mocks.dart';

import 'Autorization.dart';
import 'Message_Page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  bool _CB = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //backgroundColor: Color(0xFF3ccce3),
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title:
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(Strings.MessageList),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.article),
                onPressed: () {
                  setState(() {
                    _CB = !_CB;
                  });
                },
              ),
              SizedBox(height: 4),
              IconButton(
                icon: Icon(Icons.backspace),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => FormText()));
                },
              ),
            ],
          )
        ]),
      ),
      body: SingleChildScrollView(
        child: Column(children: MocksList.model.map(_BildMessageList).toList()),
      ),
    );
  }

  Widget _BildMessageList(Model item) {
    return InkWell(
      onTap: () {
        setState(() {
          _CB = false;
        });

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => MessagePage(item: item),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        height: 100.0,
        /*decoration: BoxDecoration(
            color: Color(0xFF17A2B8),
          ),*/
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image(
                        image: AssetImage(item.icon),
                        width: 80.0,
                        height: 80.0,
                        fit: BoxFit.fill),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 5, right: 5),
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              item.UserName,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: Text(item.TextMessage,
                                  style: TextStyle(fontSize: 13)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _CB
                    ? Checkbox(
                  value: false,
                  onChanged: (bool newValue) {
                    setState(() {});
                  },
                )
                    : SizedBox(
                  height: 0,
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: Text(item.SendingTime),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
