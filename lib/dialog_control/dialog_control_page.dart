import 'package:flutter/material.dart';

class DialogControlPage extends StatefulWidget {
  final Function(BuildContext) onDialogControl;
  final BuildContext preContext;
  static MaterialPageRoute thisPageRouter;

  DialogControlPage(
    {
      Key key,
      this.onDialogControl,
      this.preContext,
    }) : super(key: key);

  @override
  _DialogControlPageState createState() => _DialogControlPageState();
}

class _DialogControlPageState extends State<DialogControlPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dialog 控制')),
      body: Center(
        child:ListView (
          children: <Widget>[
            _hideUnderDialogButton(context),
            _popDialogButton(context),
          ],
        ) 
      )
    );
  }

  Widget _hideUnderDialogButton(context) {
    return RaisedButton(
      child: Text('Hide'),
      onPressed: () {
        widget.onDialogControl(widget.preContext);
      },
    );
  }

  Widget _popDialogButton(context) {
    return RaisedButton(
      child: Text('PopDialog'),
      onPressed: () {
        NavigatorState naviState = Navigator.of(context);
        naviState.removeRouteBelow(DialogControlPage.thisPageRouter);
      },
    );
  }
}