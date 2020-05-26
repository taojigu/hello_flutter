import 'package:flutter/material.dart';

class InhertedWidgetDemo extends StatefulWidget {
  @override
  _InhertedWidgetDemoState createState() => _InhertedWidgetDemoState();
}

class _InhertedWidgetDemoState extends State<InhertedWidgetDemo> {

  int _clickCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: ListView (
        children: <Widget>[
          Text('Index show in TopLayer: $_clickCount'),
          RaisedButton (
            child: Text('Add'),
            onPressed: () {
              setState(() {
                _clickCount ++;
              });
            },
          ),
          DemoInheritedWidget(
            child: DeeperWidget(),
            currentIndex: _clickCount,
          ),
          
        ],
      ),
    );
  }

}


class DeeperWidget extends StatefulWidget {
  @override
  _DeeperWidgetState createState() => _DeeperWidgetState();
}

class _DeeperWidgetState extends State<DeeperWidget> {
  @override
  Widget build(BuildContext context) {
    DemoInheritedWidget demoWidget = context.findAncestorWidgetOfExactType<DemoInheritedWidget>();
    return Center (
      child:Text('Find Index From Acestor is ${demoWidget.currentIndex}')
    );
  }
}


class DemoInheritedWidget extends InheritedWidget {
  final int currentIndex;

  DemoInheritedWidget( {
    this.currentIndex,
    Widget child
  }
  ):super (
    child:child,
  );
  @override
  bool updateShouldNotify(DemoInheritedWidget oldWidget) {
    return this.currentIndex == oldWidget.currentIndex;
  }

}

