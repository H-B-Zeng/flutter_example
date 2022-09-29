import 'package:equatable/equatable.dart';
import '../model/movie_list.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MovieState extends Equatable {
  const MovieState();
//MovieState({List props = const []});

  @override
  List<Object> get props => [];
}

class TopRatedMovieState extends MovieState {
  final MovieList movieList;
  TopRatedMovieState(this.movieList);

  @override
  String toString() {
    return "TopRatedMovieState";
  }
}

class InitMovieState extends MovieState {
  @override
  String toString() {
    return "InitMovieState";
  }
}

class LoadingMovie extends MovieState {
  @override
  String toString() {
    return "LoadingMovie";
  }
}

class FailedFetchData extends MovieState {
  @override
  String toString() {
    return "FailedFetchData";
  }
}
