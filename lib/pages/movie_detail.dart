import 'package:flutter/material.dart';
import 'package:http_request_rest_api_flutter/models/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  String imgPath = "https://image.tmdb.org/t/p/w500";

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    String path;
    String poster;
    if (movie.backdropPath != null) {
      path = imgPath + movie.backdropPath;
    } else {
      path =
          'https:/images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    }
    if (movie.posterPath != null) {
      poster = imgPath + movie.posterPath;
    } else {
      poster =
          'https:/images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    }
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                height: height / 1.5,
                child: Image.network(path),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 16, bottom: 10),
                child: Row(
                  children: [
                    Image.network(poster, width: 40),
                    Text(
                      "  " + movie.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Container(
                child: Text(movie.overview,
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                width: 450,
                padding: EdgeInsets.only(left: 20, right: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
