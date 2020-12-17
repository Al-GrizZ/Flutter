import 'package:flutter/material.dart';
import 'package:flutter_app/Resourses/app_strings.dart';
import 'package:flutter_app/LieDates/lie_dates.dart';

class PersonePage extends StatefulWidget {
  final Model item;

  const PersonePage({
    @required this.item,
  });

  @override
  _PersonePage createState() => _PersonePage();
}

class _PersonePage extends State<PersonePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          _BuildInfo(),
          _BuildDescription(),
        ],
      ),
    );
  }

  Widget _BuildInfo() {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.only(top: 2, bottom: 2, right: 10, left: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.indigoAccent[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          _icon_person(),
          SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.item.UserName,
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 5,
                height: 18,
              ),
              Text(
                widget.item.Tlf,
                style: TextStyle(
                    fontSize: 13,),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _BuildDescription() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.only(top: 4, bottom: 4, right: 10, left: 10),
            decoration: BoxDecoration(
              color: Colors.indigoAccent[100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Description:",
                  style: TextStyle(color: Colors.black54),
                ),
                Text(widget.item.Description),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 0,
          width: MediaQuery.of(context).size.width * 0.2,
        ),
      ],
    );
  }

  Widget _icon_person() {
    return Container(
      padding: EdgeInsets.all(4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image(
            image: AssetImage(widget.item.icon),
            width: 100.0,
            height: 100.0,
            fit: BoxFit.fill),
      ),
    );
  }
}
