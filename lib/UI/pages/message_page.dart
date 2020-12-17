import 'package:flutter/material.dart';
import 'package:flutter_app/Resourses/app_strings.dart';
import 'package:flutter_app/LieDates/lie_dates.dart';

import 'package:flutter_app/UI/pages/persone_page.dart';

class MessagePage extends StatefulWidget {
  final Model item;

  const MessagePage({
    @required this.item,
  });

  @override
  _MessagePage createState() => _MessagePage();
}

class _MessagePage extends State<MessagePage> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            }),
        title: Center(
          child: Column(
            children: [
              Text(widget.item.UserName),
              Text(
                Strings.Online,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              )
            ],
          ),
        ),
        actions: <Widget>[
          _IconPersone(),
        ],
      ),
      body: SafeArea(
        right: false,
        left: false,
        top: false,
        bottom: true,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  reverse: true,
                  itemCount: widget.item.MessageList.length,
                  itemBuilder: (_, int index) {
                    return _buildMessage(widget.item.MessageList[index]);
                  }),
            ),
            _SendZone(),
          ],
        ),
      ),
    );
  }

  Widget _IconPersone() {
    return InkWell(
      onTap: () async {
        setState(() {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (_) => PersonePage(item: widget.item),
                ),
              )
              .then((value) => setState(() {}));
        });
      },
      child: Container(
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
    );
  }

  Widget _SendZone() {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.indigo[50],
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 2, left: 10, right: 10, bottom: 7),
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: "Message",
                  hintStyle: TextStyle(
                    color: Colors.indigo[160],
                  ),
                ),
                controller: myController,
                onSubmitted: (String value) {
                  print(value);
                },
              ),
            ),
          ),
          _SendButton(),
        ],
      ),
    );
  }

  Widget _SendButton() {
    return Container(
      margin: EdgeInsets.only(right: 2),
      child: TextButton(
          onPressed: () {
            DateTime format = DateTime.now();

            setState(() {
              if (!myController.text.isEmpty) {
                DateTime time = DateTime.now();
                String times;
                if (time.hour < 10) {
                  times = "0" + time.hour.toString() + ":";
                } else
                  times = time.hour.toString() + ":";
                if (time.minute < 10) {
                  times = times + "0" + time.minute.toString();
                } else
                  times = times + time.minute.toString();

                widget.item.MessageList.insert(
                  0,
                  ModelMessageList(
                    Message: myController.text,
                    Who: "",
                    SendingTime: times,
                  ),
                );
              }
            });
            myController.text = "";
          },

          child: Text("Send")),
    );
  }

  Widget _buildMessage(ModelMessageList item) {
    return Container(
      child: item.Who == "he"
          ? _BuildMessageLeft(item.Message, item.SendingTime)
          : _BuildMessageRight(item.Message, item.SendingTime),
    );
  }

  Widget _BuildMessageLeft(String Message, String SendingTime) {
    return Row(
      children: [
        _BuildMessage2(Message),
        Text(SendingTime),
        Spacer(),
      ],
    );
  }

  Widget _BuildMessageRight(String Message, String SendingTime) {
    return Row(
      children: [
        Spacer(),
        Text(SendingTime),
        _BuildMessage2(Message),
      ],
    );
  }

  Widget _BuildMessage2(String item) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.7,
      ),
      child: Container(
          margin: EdgeInsets.all(7),
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: Colors.indigo[100],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(item)),
    );
  }
}
