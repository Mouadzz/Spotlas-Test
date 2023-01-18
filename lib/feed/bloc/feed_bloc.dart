import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spotlastest/feed/models/feed_model.dart';
import 'package:spotlastest/feed/services/feed_services.dart';

part 'feed_event.dart';
part 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final FeedRepo repo;
  FeedBloc(this.repo) : super(FeedInitial()) {
    on<GetFeed>(_onGetFeed);
  }

  _onGetFeed(GetFeed event, Emitter<FeedState> emit) async {
    emit(FeedLoading());
    try {
      List<PostModel?> result = await repo.getFeed(event.page);
      emit(FeedLoaded(result: result));
    } catch (e) {
      if (e is SocketException || e is HttpException) {
        emit(FeedError(
            msg:
                'It is not possible to connect to the server at this time.\nThe network connection was lost.'));
      } else {
        emit(FeedError(msg: e.toString()));
      }
    }
  }
}
