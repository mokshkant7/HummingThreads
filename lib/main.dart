import 'package:flutter/material.dart';
import 'package:hummingthread_app/ui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: AuthScreen(),
      home: ChatWindow(
        contactName: "Moksh",
        contactId: 2,
        displayPicture: null,
      ),
    );
  }
}
