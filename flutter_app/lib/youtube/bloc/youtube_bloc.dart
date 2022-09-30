import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:youtube_api/youtube_api.dart';
import '../youtube.dart';

class YoutubeBloc extends Bloc<YoutubeEvent, YoutubeState> {
  YoutubeRepository _youtubeRepository;

  YoutubeBloc({required YoutubeRepository youtubeRepository})
      : _youtubeRepository = youtubeRepository,
        super(YoutubeInitialState());

  // YoutubeBloc() : super(YoutubeInitialState()) {
  //   on<YoutubeEvent>((event, emit) {
  //     // TODO: implement event handler
  //   });

  @override
  YoutubeState get initialState => YoutubeInitialState();

  @override
  Stream<YoutubeState> mapEventToState(
    YoutubeEvent event,
  ) async* {
    if (event is SearchYoutubeEvent) {
      yield* _mapSearchToState(event.keyWord);
    }
  }

  Stream<YoutubeState> _mapSearchToState(String keyWord) async* {
    try {
      yield YoutubeLoadingState();
      List<YoutubeAPI> ytResult =
          await _youtubeRepository.search(keyWord: keyWord) as List<YoutubeAPI>;
      yield YoutubeSuccessState(ytResult);
    } catch (_) {
      yield YoutubeFailedState();
    }
  }
}
