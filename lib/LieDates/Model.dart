import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Model{
  final String UserName;
  final String TextMessage;
  final String icon;
  final String SendingTime;



  const Model({
    @required this.UserName,
    @required this.TextMessage,
    @required this.icon,
    @required this.SendingTime,
});
}