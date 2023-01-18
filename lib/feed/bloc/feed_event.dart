part of 'feed_bloc.dart';

@immutable
abstract class FeedEvent {}

class GetFeed implements FeedEvent {
  final int page;
  GetFeed({required this.page});
}
