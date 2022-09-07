import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'package:http_request_rest_api_flutter/models/movie.dart';


class HttpService{
  final String apiKey = '1b72f8b75a6b28b56c666bcc945492cf';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';

  Future<List?> getPopularMovies() async{
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if(result.statusCode == HttpStatus.ok){
      print("Sukses");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    }else{
      print("Fail");
      return null;
    }
  }
}