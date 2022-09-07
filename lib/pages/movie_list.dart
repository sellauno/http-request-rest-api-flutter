import 'package:flutter/material.dart';
import 'package:http_request_rest_api_flutter/service/http_service.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  String result = "";
  late HttpService service;

  @override
  void initState(){
    service = HttpService();
    super.initState();
  }
  Widget build(BuildContext context) {
    service.getPopularMovies().then((value) => {
      setState((){
        result = value;
      })
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Movues"),
      ),
      body: Container(
        child: Text(result),
      ),
    );
    }
}