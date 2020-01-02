import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_flutter/alert/after_alert_page.dart';

class AlertDemoPage extends StatefulWidget {
  @override
  _AlertDemoPageState createState() => _AlertDemoPageState();
}

class _AlertDemoPageState extends State<AlertDemoPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      this._showAlert(context);
    });
  }

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert'),
        actions: <Widget>[
          new FlatButton(
              child: new Text("Next"),
              onPressed: () {
                Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => new AfterAlertPage())
                );
              },
            ),
        ],
      ),
        
      body: Center(
        child:ListView (
          children: <Widget>[
            _showAlertWidget(context),
          ],
        )
      )
    );
  }

  Widget _showAlertWidget(BuildContext context) {
     return RaisedButton(
       child: Text('ShowAlert'),
       onPressed :() {
         _showAlert(context);
       }
     );
  }

  void _showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          
          title: new Text("Alert Dialog title"),
          content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    );
  }
   
}