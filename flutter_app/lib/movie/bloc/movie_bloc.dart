import 'dart:async';
import 'package:bloc/bloc.dart';
import '../movie.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieRepository _movieRepository;

  MovieBloc({required MovieRepository movieRepository})
      : _movieRepository = movieRepository,
        super(InitMovieState());

  //event
  Stream<MovieState> mapEventToState(
    MovieEvent event,
  ) async* {
    if (event is FetchNowPlaying) {
      yield* _mapFetchNowPlayingToState(region: event.region);
    } else if (event is FetchPopular) {
      yield* _mapFetchPopularToState(region: event.region);
    } else if (event is FetchTopRated) {
      yield* _mapFetchTopRatedToState(region: event.region);
    }
  }

//state
  Stream<MovieState> _mapFetchNowPlayingToState(
      {required String region}) async* {
    yield LoadingMovie();
    try {
      final _movieList =
          await _movieRepository.fetchNowPlayingMovieList(region: region);
      yield NowPlayingMovieState(movieList: _movieList);
    } catch (_) {
      yield FailedFetchData();
    }
  }

  Stream<MovieState> _mapFetchPopularToState({required String region}) async* {
    yield LoadingMovie();
    try {
      final _movieList =
          await _movieRepository.fetchPopularMovieList(region: region);
      yield PopularMovieState(movieList: _movieList);
    } catch (_) {
      yield FailedFetchData();
    }
  }

  Stream<MovieState> _mapFetchTopRatedToState({required String region}) async* {
    yield LoadingMovie();
    try {
      final _movieList =
          await _movieRepository.fetchTopRatedMovieList(region: region);
      yield TopRatedMovieState(movieList: _movieList);
    } catch (_) {
      yield FailedFetchData();
    }
  }

  void dispatch(FetchPopular fetchPopular) {}
}
