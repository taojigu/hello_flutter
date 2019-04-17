import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FavoriteWidgetState extends State {
  int _favoriteCount = 4;
  bool _isFavorite = false;

  void _toggleFavorite () {
    setState(() {
        if(_isFavorite) {
          _isFavorite = false;
          _favoriteCount -= 1;
          return;
        }
        _isFavorite = true;
        _favoriteCount += 1;
    });

  }
  Widget build(BuildContext buildContext) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_isFavorite ? 
              Icon(Icons.star):
              Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$_favoriteCount')
          )
        ),
      ],
    );
  }
}

class FavoriteWidget extends StatefulWidget {

  @override
  FavoriteWidgetState createState() => FavoriteWidgetState();
}




