import 'package:flutter/material.dart';
import 'listview_demo_page.dart';
import 'layout/lake_page.dart';
import 'douban/douban_movie_page.dart';

class RegularWidgetDemoPage extends StatefulWidget {
  @override
  _RegularWidgetDemoPageState createState() => _RegularWidgetDemoPageState();
}

class _RegularWidgetDemoPageState extends State<RegularWidgetDemoPage> {



  Widget _pushRouterListViewPageButton () {
    return RaisedButton(
      child: Text("RouterPush"),
      onPressed: () {
         Navigator.pushNamed(context, "/listViewDemoPage");
      },
    );
  }

  Widget _eventTextFiledContainer () {
    return  Container(
              padding: EdgeInsets.symmetric(horizontal: 30,
              vertical: 3),
              child: TextField(
                enabled: true,
                decoration: const InputDecoration(
                  labelText: 'Event name',
                  hintText: 'Input EventName',
                  hasFloatingPlaceholder: true,
                  border: OutlineInputBorder(),
                ),
                style: Theme.of(context).textTheme.display1,
                onChanged: (text){
                  debugPrint("text is $text");
                },
              )
            );
  }


  @override
  Widget build(BuildContext context) {
    var bodyChildren = <Widget>[
            RaisedButton(
              child: const Text('FlatButton',
              style: TextStyle(color:Colors.yellow)),
              color: Colors.brown,
              onPressed: () {
              // Perform some action
              debugPrint("FlatButton Clicked");
              },
            ),
            RaisedButton(
              child: Icon(Icons.access_time),
              color: Colors.brown,
              onPressed: () {
              // Perform some action
              debugPrint("FlatButton ICon Cliked");
              }
            ),
            _eventTextFiledContainer(),
            _dialogButton(),
            _pushListViewPageButton(),
            _pushRouterListViewPageButton(),
            _pushLakeButton(),
            _pushDoubanButton()
          ];
      return Scaffold(
        appBar: AppBar(
          title: Text("RegularWidget"),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: bodyChildren
          ),
        ),
      );
      
    }
                        
    _pushDoubanButton() {
      return RaisedButton(
        child: Text("Douban Movie"),
        onPressed: () {
          Navigator.push(context, 
          new MaterialPageRoute(builder: (context) => new DoubanMoviewPage())  
          );
        }
      );

    }
            
    _pushLakeButton() {
      return RaisedButton(
        child: Text("Lake"),
        onPressed: () {
          Navigator.push(context, 
          new MaterialPageRoute(builder: (context) => new LakePage())  
          );
        }
      );
    }

    Widget _dialogButton () {
      return RaisedButton(
            child: const Text('ALERT WITH TITLE'),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => new AlertDialog(
                  title: new Text("Dialog Title"),
                  content: new Text("This is my content"),
                  actions:<Widget>[
                    new FlatButton(child:new Text("CANCEL"), onPressed: (){
                      Navigator.of(context).pop();
                    },),
                    new FlatButton(
                      child:new Text("OK"), 
                      onPressed: (){
                      Navigator.of(context).pop();
                    },
                    )
                  ]
                )
              );
            }
          );
    }

    Widget _pushListViewPageButton() {
      return RaisedButton(
        child: Icon(Icons.arrow_upward),
        onPressed: () {
          Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => new ListViewDemoPage()),
          );
        },
      );
    }
}