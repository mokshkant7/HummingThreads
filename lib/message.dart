import 'package:flutter/material.dart';

abstract class Message extends StatelessWidget {
  final timeStamp, sent;

  Message({this.timeStamp, this.sent});

  @override
  Widget build(BuildContext context) => Container();
}
