import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';
import 'model/movie_list.dart';
import 'movie_api_key.dart';

class MovieApiProvider {
  final Client _client;
  String _apiKey = movie_api_key;
  //final _baseUrl = 'http://api.themoviedb.org/3/movie';
  final _baseUrl = 'https://api.themoviedb.org/3/movie/550';

  MovieApiProvider({Client? client}) : _client = client ?? Client();

  Future<MovieList> fetchPopularMovieList({String region = 'TW'}) async {
    String _getUrl = "$_baseUrl/popular?api_key=$_apiKey&page=1&region=$region";
    final response = await _client.get(Uri.parse(_getUrl));
    if (response.statusCode == 200) {
      return MovieList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get popular movie list.');
    }
  }

  Future<MovieList> fetchNowPlayingMovieList({String region = 'TW'}) async {
    String _getUrl = "$_baseUrl/popular?api_key=$_apiKey&page=1&region=$region";
    final response = await _client.get(Uri.parse(_getUrl));
    if (response.statusCode == 200) {
      return MovieList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get now playing movie list.');
    }
  }

  Future<MovieList> fetchTopRatedMovieList({String region = 'TW'}) async {
    String _getUrl = "$_baseUrl/popular?api_key=$_apiKey&page=1&region=$region";
    final response = await _client.get(Uri.parse(_getUrl));
    if (response.statusCode == 200) {
      return MovieList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get top rated movie list.');
    }
  }
}
