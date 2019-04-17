
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

class DoubanMoviewPage extends StatefulWidget {
  @override
  _DoubanMoviewPageState createState() => _DoubanMoviewPageState();
}

class _DoubanMoviewPageState extends State<DoubanMoviewPage> {

  List _movieList = [];

  @override
  @override
  void initState() { 
    super.initState();
    _requestDoubanMovie();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(Icons.access_time),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){

            },
          )
        ],
      ),
      body:_mainBody(),
    );
  }

  Widget _mainBody() {
    if(_movieList.length == 0) {
      return _emptyMovieWidget();
    }

    return _movieListView();
  }

  Widget _movieInfoWidget(var movie) {

    var name = movie["title"];
    var gender = movie['genres'].join("/");
    var rating = movie['rating']['average'];

    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              gender,
            ),
            Text(
              "$rating",
            ),
            _actorListWidget(movie)
          ],
        ),
      ),
    );
    
  }

  Widget _actorListWidget(var movie) {
    var actorPostList = List.generate(movie['casts'].length, (int index) =>
        Container(
          margin: EdgeInsets.only(left: index.toDouble() == 0.0 ? 0.0 : 16.0),
          child: CircleAvatar(
              backgroundColor: Colors.white10,
              backgroundImage: NetworkImage(
                  movie['casts'][index]['avatars']['small']
              )
          ),
        ),
    );
    return Row(
      children:actorPostList);
  }

 Widget  _moviePosterWidget(var subject) {
    var posterUrl = subject['images']['large'];
    var posterImage = Image.network(
        posterUrl,
        height: 150,
        width: 100,
        fit: BoxFit.fill,
        );
    var cachedImage = CachedNetworkImage(
      imageUrl: posterUrl,
      placeholder:  (context, url) => new CircularProgressIndicator(),
      height: 150,
      width: 100,
    );
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: cachedImage
    );
    
  }

  Widget _movieCell(var subject) {

    Container container = Container(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: <Widget>[
          _moviePosterWidget(subject),
          _movieInfoWidget(subject),
        ],
      ),
    );
    String altUrlString = subject["alt"];
    GestureDetector dector = GestureDetector(
      child: container,
      onTap: () async {
         if (await canLaunch(altUrlString)) {
            await launch(altUrlString);
          } else {
            throw 'Could not launch $altUrlString';
          }
      },
    );
    return dector;
  }

  Widget _movieListView () {
      ListView listView = ListView.builder(
        itemCount: _movieList.length,
        itemBuilder: (context,index) {
          var movie = _movieList[index];
          return _movieCell(movie);
        }
      );
      return RefreshIndicator(
        child: listView,
        onRefresh: _requestDoubanMovie
      );
  }
  
  Widget _emptyMovieWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("No Movie Here",
            style: TextStyle(color: Colors.blue,
              fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Future<void> _requestDoubanMovie () async {
    var url = "https://api.douban.com/v2/movie/in_theaters";
    var response = await http.get(url);
    if (response.statusCode != 200 ) {
      setState(() {
        _movieList = [];
      });
      return;
    }

    var result = jsonDecode(response.body);
    setState(() {
      _movieList = result["subjects"];
      debugPrint("movies are $_movieList");
    });
  }

}