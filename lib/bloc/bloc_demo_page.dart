import 'package:flutter/material.dart';
import 'package:hello_flutter/bloc/increase_bloc.dart';

class BlockDemoPage extends StatefulWidget {
  BlockDemoPage({Key key}) : super(key: key);

  _BlockDemoPageState createState() => _BlockDemoPageState();
}

class _BlockDemoPageState extends State<BlockDemoPage> {

  var _bloc = IncreaseBloc();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc')),
      body: Center(
        child:ListView (
          children: <Widget>[
            _increaseButton(),
            _counterWidget(),
          ],
        ) 
      )
    );
  }

  Widget _counterWidget() {
    return StreamBuilder<int>(
      initialData: 0,
      stream: _bloc.stream,
      builder: (context,snapshot){
        return Center(
          child:Text("Current Number is ${snapshot.data}")
          );
      });
  }

  Widget _increaseButton() {
    return FlatButton(
      child: Text("increase"),
      onPressed: () {
        _bloc.increase();
      },
    );
  }
}