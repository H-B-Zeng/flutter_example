import 'package:equatable/equatable.dart';
import '../model/movie_list.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class InitMovieState extends MovieState {
  @override
  String toString() => "InitMovieState";
}

class NowPlayingMovieState extends MovieState {
  const NowPlayingMovieState(this.movieList);
  final MovieList movieList;

  @override
  String toString() {
    return "NowPlayingMovieState ${movieList.toString()}";
  }

  @override
  List<Object> get props => [movieList];
}

class PopularMovieState extends MovieState {
  PopularMovieState(this.movieList);
  final MovieList movieList;

  @override
  String toString() {
    return "PopularMovieState";
  }
}

//顯示高分電影清單
class TopRatedMovieState extends MovieState {
  final MovieList movieList;
  TopRatedMovieState({required this.movieList});

  @override
  String toString() => "TopRatedMovieState";
}

//取得電影清單中
class LoadingMovie extends MovieState {
  const LoadingMovie();

  @override
  String toString() => "LoadingMovie";
}

//遇到錯誤的狀態
class FailedFetchData extends MovieState {
  @override
  String toString() => "FailedFetchData";
}
