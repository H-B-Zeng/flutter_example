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

//顯示高分電影清單
class TopRatedMovieState extends MovieState {
  final MovieList movieList;
  TopRatedMovieState(this.movieList);

  @override
  String toString() {
    return "TopRatedMovieState";
  }
}

/// The initial state of the [MovieBloc].
class InitMovieState extends MovieState {
  @override
  String toString() {
    return "InitMovieState";
  }
}

//取得電影清單中
class LoadingMovie extends MovieState {
  @override
  String toString() {
    return "LoadingMovie";
  }
}

//遇到錯誤的狀態
class FailedFetchData extends MovieState {
  @override
  String toString() {
    return "FailedFetchData";
  }
}
