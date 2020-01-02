
import 'package:flutter/material.dart';

class AfterAlertPage extends StatefulWidget {
  AfterAlertPage({Key key}) : super(key: key);

  @override
  _AfterAlertPageState createState() => _AfterAlertPageState();
}

class _AfterAlertPageState extends State<AfterAlertPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NetPage')),
      body: Center(
        child: Text('NextPage'),
      )
    );
  }
}