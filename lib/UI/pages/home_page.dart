import 'package:flutter/material.dart';
import 'package:flutter_app/Resourses/app_strings.dart';
import 'package:flutter_app/LieDates/lie_dates.dart';

import 'autorization.dart';
import 'message_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  bool _CB = false;

  //List<Model> listDate = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //backgroundColor: Color(0xFF3ccce3),
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(Strings.MessageList),
            Row(
              children: [
                IconButton(
                  icon: Icon(_CB ? Icons.backspace : Icons.article),
                  onPressed: () {
                    setState(
                      () {
                        _CB = !_CB;
                      },
                    );
                  },
                ),
                SizedBox(height: 4),
                IconButton(
                  icon: Icon(
                      _CB ? Icons.assignment_turned_in_sharp : Icons.backspace),
                  onPressed: () {
                    _CB
                        ? setState(() {
                            _DeleteDialog();
                            _CB = !_CB;
                          })
                        : Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FormText()));
                  },
                ),
              ],
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: Mocks.model.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return _BildMessageList(Mocks.model[index]);
        },
      ),
      //SingleChildScrollView(child:Column(children: MocksList.model.map(_BildMessageList).toList()),),
    );
  }

  Widget _BildMessageList(Model item) {
    return InkWell(
      onTap: () async {
        setState(() {
          _CB = false;
          _DefaultValue();

          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (_) => MessagePage(item: item),
                ),
              )
              .then((value) => setState(() {}));
        });
      },
      child: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        height: 100.0,
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
                              child: Text(item.MessageList.first.Message,
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
                        value: item.CheckBoxb,
                        onChanged: (bool newValue) {
                          setState(() {
                            item.CheckBoxb = newValue;
                          });
                        },
                      )
                    : SizedBox(
                        height: 0,
                      ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: Text(item.MessageList.first.SendingTime),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _DeleteDialog() {
    for (int i = 0; i < Mocks.model.length; i++) {
      if (Mocks.model[i].CheckBoxb) {
        Mocks.model.removeAt(i);
        i--;
      }
    }
  }

  void _DefaultValue() {
    for (int i = 0; i < Mocks.model.length; i++) {
      if (Mocks.model[i].CheckBoxb) {
        Mocks.model[i].CheckBoxb = false;
      }
    }
  }
}
