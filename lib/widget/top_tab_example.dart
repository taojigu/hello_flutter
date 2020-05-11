import 'package:flutter/material.dart';

class TopTabExample1 extends StatefulWidget {
  @override
  _TopTabExample1State createState() => _TopTabExample1State();
}

class _TopTabExample1State extends State<TopTabExample1> {

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 3,vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        bottom: TabBar(
          tabs: [
            Tab(icon:Icon(Icons.call)),
          ]
        ),
      ),
      body: Container(),
    );
  }
}