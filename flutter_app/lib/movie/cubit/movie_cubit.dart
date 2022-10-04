import 'package:equatable/equatable.dart';
import 'package:flutter_app/movie/movie.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
// import 'package:movie_repository/weather_repository.dart'
//     show WeatherRepository;

part 'movie_cubit.g.dart';
part 'movie_state.dart';

class MovieCubit extends HydratedCubit<MovieState> {
  MovieCubit(this._movieRepository) : super(MovieState());

  final MovieRepository _movieRepository;

  Future<void> fetchMovieC(String? region) async {
    if (region == null || region.isEmpty) return;

    emit(state.copyWith(status: MovieStatus.loading));

    try {
      final _movieList =
          await _movieRepository.fetchNowPlayingMovieList(region: region);

      emit(
        state.copyWith(
          status: MovieStatus.success,
          // temperatureUnits: units,
          // movieC: movieC.copyWith(temperature: Temperature(value: value)),
        ),
      );
    } on Exception {
      emit(state.copyWith(status: MovieStatus.failure));
    }
  }

  Future<void> refreshMovieC() async {
    if (!state.status.isSuccess) return;
    if (state.movie == Movie.empty) return;
    try {
      final movieC = Movie.fromRepository(
        await _movieRepository.getMovie(),
      );
      // final units = state.temperatureUnits;
      // final value = units.isFahrenheit
      //     ? movieC.temperature.value.toFahrenheit()
      //     : movieC.temperature.value;

      emit(
        state.copyWith(
          status: MovieStatus.success,
          // temperatureUnits: units,
          // movieC: movieC.copyWith(temperature: Temperature(value: value)),
        ),
      );
    } on Exception {
      emit(state);
    }
  }

  // void toggleUnits() {
  //   final units = state.temperatureUnits.isFahrenheit
  //       ? TemperatureUnits.celsius
  //       : TemperatureUnits.fahrenheit;

  //   if (!state.status.isSuccess) {
  //     emit(state.copyWith(temperatureUnits: units));
  //     return;
  //   }

  //   final movieC = state.movieC;
  //   if (movieC != movieC.empty) {
  //     final temperature = movieC.temperature;
  //     final value = units.isCelsius
  //         ? temperature.value.toCelsius()
  //         : temperature.value.toFahrenheit();
  //     emit(
  //       state.copyWith(
  //         temperatureUnits: units,
  //         movieC: movieC.copyWith(temperature: Temperature(value: value)),
  //       ),
  //     );
  //   }
  // }

  @override
  MovieState fromJson(Map<String, dynamic> json) => MovieState.fromJson(json);

  @override
  Map<String, dynamic> toJson(MovieState state) => state.toJson();
}

// extension on double {
//   double toFahrenheit() => (this * 9 / 5) + 32;
//   double toCelsius() => (this - 32) * 5 / 9;
// }
