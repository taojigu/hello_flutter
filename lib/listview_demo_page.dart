import 'package:flutter/material.dart';

class ListViewDemoPage extends StatefulWidget {
  @override
  _ListViewDemoPageState createState() => _ListViewDemoPageState();
}

class _ListViewDemoPageState extends State<ListViewDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListViewDemo"),
      ),
      body: _demoListView(),
    );
  }

  Widget _demoListView () {
    return Center(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context,index) {
          return GestureDetector(
            child:Text("Line $index"),
            onTap: () {
              debugPrint("Line $index is tapped");
            },
          );
        },
      )
    );
  }
}

