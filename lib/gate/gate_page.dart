import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_flutter/gate/home_page.dart';

class GatePage extends StatefulWidget {
  @override
  _GatePageState createState() => _GatePageState();
}

class _GatePageState extends State<GatePage> {

  int _currentBottomItemIndex = 0;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gate'),
      ),
      body: _currentBodyWidget(this._currentBottomItemIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentBottomItemIndex,
        items: [
          BottomNavigationBarItem(
            title:Text('Home'),
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Setting'),
          )
        ],
        onTap: (int bottomItemIndex) {
          setState(() {
            _currentBottomItemIndex = bottomItemIndex;
          });
        },
      ),
    );
  }
  Widget _currentBodyWidget(int bottomIndex) {
    return HomePage();
    if (0 == bottomIndex) {
      return ListView(
        children: <Widget>[

        ],
      );
    }
  }
}