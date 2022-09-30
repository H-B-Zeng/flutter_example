import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class YoutubeEvent extends Equatable {
  const YoutubeEvent();

  @override
  List<Object> get props => [];
}

class SearchYoutubeEvent extends YoutubeEvent {
  final keyWord;
  SearchYoutubeEvent(this.keyWord);

  @override
  String toString() => 'Search $keyWord on Youtube';
}
