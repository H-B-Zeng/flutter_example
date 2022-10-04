import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class FetchNowPlaying extends MovieEvent {
  final String region;

  const FetchNowPlaying(this.region);

  @override
  String toString() {
    return "Fetch NowPlaying Movie List {region: $region}";
  }
}

class FetchPopular extends MovieEvent {
  final String region;

  const FetchPopular(this.region);

  @override
  String toString() => "Fetch Popular Movie List {region: $region}";
}

class FetchTopRated extends MovieEvent {
  final String region;

  FetchTopRated(this.region);

  @override
  String toString() => "Fetch TopRated Movie List {region: $region}";
}
