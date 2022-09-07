import 'package:flutter/material.dart';
import 'package:http_request_rest_api_flutter/service/http_service.dart';
import 'package:http_request_rest_api_flutter/pages/movie_detail.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  late int moviesCount;
  late List movies;
  late HttpService service;
  String imgPath = 'https://image.tmdb.org/t/p/w500';

  Future initialize() async {
    movies = (await service.getPopularMovies())!;
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Popular Movies"),
        ),
        body: ListView.builder(
          itemCount: this.moviesCount,
          itemBuilder: (context, int position) {
            return Card(
              color: Colors.white,
              elevation: 2.0,
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    imgPath + movies[position].posterPath,
                    width: 60,
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(movies[position].title),
                    subtitle: Text(
                      "Rating = " + movies[position].voteAverage.toString(),
                    ),
                    onTap: () {
                        MaterialPageRoute route = MaterialPageRoute(
                            builder: (_) => MovieDetail(movies[position]));
                        Navigator.push(context, route);
                      },
                  ),
                ),
              ]),
            );
          },
        ));
  }
}
