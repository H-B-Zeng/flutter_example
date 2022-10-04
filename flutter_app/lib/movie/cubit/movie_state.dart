part of 'movie_cubit.dart';

enum MovieStatus {
  initial,
  loading,
  success,
  failure,
  playing,
  popularMovie,
  topRatedMovie,
}

extension MovieStatusX on MovieStatus {
  bool get isInitial => this == MovieStatus.initial;
  bool get isLoading => this == MovieStatus.loading;
  bool get isSuccess => this == MovieStatus.success;
  bool get isFailure => this == MovieStatus.failure;
  bool get playing => this == MovieStatus.playing;
  bool get popularMovie => this == MovieStatus.popularMovie;
  bool get topRatedMovie => this == MovieStatus.topRatedMovie;
}

@JsonSerializable()
class MovieState extends Equatable {
  MovieState({
    this.status = MovieStatus.initial,
  });

  final MovieStatus status;

  MovieState copyWith({
    MovieStatus? status,
  }) {
    return MovieState(
      status: status ?? this.status,
    );
  }

  factory MovieState.fromJson(Map<String, dynamic> json) =>
      _$MovieStateFromJson(json);

  Map<String, dynamic> toJson() => _$MovieStateToJson(this);

  @override
  List<Object> get props => [status];
}

// class NowPlayingMovieState extends MovieState {
//   final MovieList movieList;
//   NowPlayingMovieState({required this.movieList});

//   @override
//   String toString() {
//     return "NowPlayingMovieState ${movieList.toString()}";
//   }
// }
