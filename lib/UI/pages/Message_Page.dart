import 'package:flutter/material.dart';
import 'package:flutter_app/LieDates/Model.dart';
import 'package:flutter_app/Resourses/app_strings.dart';

class MessagePage extends StatefulWidget {
  final Model item;

  const MessagePage({
    @required this.item,
  });

  @override
  _MessagePage createState() => _MessagePage();
}


/*
IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),

 */
class _MessagePage extends State<MessagePage> {
  bool _LongPress = false;
  bool _Click = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          title: Center(child: Column(
            children: [
              Text(widget.item.UserName),
              Text(Strings.Online,
                style: TextStyle(fontSize: 14, color: Colors.black54),)
            ],
          ),),
          actions: <Widget>[
            Container(
              width: 58,
              padding: EdgeInsets.all(4),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image(
                    image: AssetImage(widget.item.icon),
                    width: 50.0,
                    height: 50.0,
                    fit: BoxFit.fill),
              ),
            ),

          ],),
        body: InkWell(
          onLongPress: (){
            setState(() {
              _LongPress = !_LongPress;
            });
          },
          child: Row(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery
                      .of(context)
                      .size
                      .width * 0.7,
                ),
                child: Container(
                    margin: EdgeInsets.all(7),
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: Colors.indigo[100],
                      borderRadius: new BorderRadius.circular(10),
                    ),
                    child: Text(widget.item.TextMessage)),
              ),
              _LongPress
                  ? Checkbox(
                value: _Click,
                onChanged: (bool newValue) {
                  setState(() {_Click = newValue;});
                },
              )
                  : SizedBox(
                height: 0,
              ),
            ],
          ),
        )
    );
  }
}
/*
Container(
            color: Colors.red,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 0.0),
                Row(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 0.0),
                            Text(widget.item.UserName),
                          ],
                        ),
                        Text("last seen recently")
                      ],
                    ),
                    Container(
                      color: Colors.black,
                      child: Row(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image(
                              image: AssetImage(widget.item.icon),
                              width: 50.0,
                              height: 50.0,
                              fit: BoxFit.fill),
                        ),
                      ]),
                    ),
                  ],
                ),
              ],
            ),
          ),
 */
