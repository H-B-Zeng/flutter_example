import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:youtube_api/youtube_api.dart';

@immutable
abstract class YoutubeState extends Equatable {
  const YoutubeState();

  @override
  List<Object> get props => [];
}

class YoutubeInitialState extends YoutubeState {
  @override
  String toString() => 'YoutubeInitialState';
}

class YoutubeLoadingState extends YoutubeState {
  @override
  String toString() => 'YoutubeLoadingState';
}

class YoutubeFailedState extends YoutubeState {
  @override
  String toString() => 'YoutubeFailedState';
}

class YoutubeSuccessState extends YoutubeState {
  final List<YoutubeAPI> ytResult;
  YoutubeSuccessState(this.ytResult);
  @override
  String toString() => 'YoutubeSuccessState';
}
