import 'package:flutter/cupertino.dart';

class Message {
  String text;
  DateTime time;
  bool isMyMessage;

  Message(
      {@required this.text, @required this.time, @required this.isMyMessage});
}
