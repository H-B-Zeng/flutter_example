import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MovieEvent extends Equatable {
  const MovieEvent();
//MovieEvent({List props = const []});

  @override
  List<Object> get props => [];
}

class FetchNowPlaying extends MovieEvent {
  final String region;

  FetchNowPlaying({required this.region});

  @override
  String toString() {
    return "Fetch NowPlaying Movie List {region: $region}";
  }
}

class FetchPopular extends MovieEvent {
  final String region;

  FetchPopular({required this.region});

  @override
  String toString() {
    return "Fetch Popular Movie List {region: $region}";
  }
}

class FetchTopRated extends MovieEvent {
  final String region;

  FetchTopRated({required this.region});

  @override
  String toString() {
    return "Fetch TopRated Movie List {region: $region}";
  }
}
