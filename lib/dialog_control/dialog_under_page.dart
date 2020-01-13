import 'package:flutter/material.dart';
import 'package:hello_flutter/dialog_control/dialog_control_page.dart';

class DialogUnderPage extends StatefulWidget {
  DialogUnderPage({Key key}) : super(key: key);
  

  @override
  _DialogUnderPageState createState() => _DialogUnderPageState();
}

class _DialogUnderPageState extends State<DialogUnderPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('下层dialog')),
      body: Center(
        child:ListView (
          children: <Widget>[
            _showDialogButton(context),
          ],
        ) 
      )
    );
  }

  Widget _showDialogButton(context) {
    Function(BuildContext) onCancel = (ctx) {
      Navigator.of(ctx).pop();
    };
    return RaisedButton(
      child: Text('showDialog'),
      onPressed: () {
        showDialog(
          context: context,
          builder: (dialogContext) {
            return AlertDialog(
              title: Text('被控Dailog'),
              content: Text('可以下一个界面控制'),
              actions: <Widget>[
                new FlatButton(
                onPressed: () {
                  MaterialPageRoute pageRouter = new MaterialPageRoute(
                      builder: (ctx) {
                        return DialogControlPage(
                          preContext:dialogContext,
                          onDialogControl:onCancel,
                        );
                      }
                    );
                    DialogControlPage.thisPageRouter = pageRouter;
                   Navigator.push(
                    context, 
                    pageRouter,
                   );
                },
                child: new Text("确认"),
              ),
              new FlatButton(
                onPressed: () {
                  onCancel(context);
                },
                child: new Text("取消"),
              ),
              ],
            );
          },
        );
      },
    );
  }

}