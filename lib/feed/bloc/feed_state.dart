part of 'feed_bloc.dart';

@immutable
abstract class FeedState {}

class FeedInitial extends FeedState {}

class FeedLoading extends FeedState {}

class FeedError extends FeedState {
  final String msg;
  FeedError({required this.msg});
}

class FeedLoaded extends FeedState {
  final List<PostModel?> result;
  FeedLoaded({required this.result});
}
