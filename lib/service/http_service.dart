import 'package:http/http.dart' as http;
import 'dart:io';

class HttpService{
  final String apiKey = '1b72f8b75a6b28b56c666bcc945492cf';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';

  Future<String> getPopularMovies() async{
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if(result.statusCode == HttpStatus.ok){
      print("Sukses");
      String response = result.body;
      return response;
    }else{
      print("Fail");
      return 'null';
    }
  }
}