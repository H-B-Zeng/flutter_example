part of 'movie_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieState _$MovieStateFromJson(Map<String, dynamic> json) => $checkedCreate(
      'MovieState',
      json,
      ($checkedConvert) {
        final val = MovieState(
          status: $checkedConvert(
              'status',
              (v) =>
                  $enumDecodeNullable(_$MovieStatusEnumMap, v) ??
                  MovieStatus.initial),
        );
        return val;
      },
      fieldKeyMap: const {'temperatureUnits': 'temperature_units'},
    );

Map<String, dynamic> _$MovieStateToJson(MovieState instance) =>
    <String, dynamic>{
      'status': _$MovieStatusEnumMap[instance.status]!,
      // 'weather': instance.weather.toJson(),
      // 'temperature_units':
      //     _$TemperatureUnitsEnumMap[instance.temperatureUnits]!,
    };

const _$MovieStatusEnumMap = {
  MovieStatus.initial: 'initial',
  MovieStatus.loading: 'loading',
  MovieStatus.success: 'success',
  MovieStatus.failure: 'failure',
  MovieStatus.playing: 'playing',
  MovieStatus.popularMovie: 'popularMovie',
  MovieStatus.topRatedMovie: 'topRatedMovie',
};



// const _$TemperatureUnitsEnumMap = {
//   TemperatureUnits.fahrenheit: 'fahrenheit',
//   TemperatureUnits.celsius: 'celsius',
// };
