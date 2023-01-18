import 'package:spotlastest/feed/models/feed_model.dart';
import 'package:http/http.dart' as http;

abstract class FeedRepo {
  Future<List<PostModel?>> getFeed(int page);
}

class FeedServices implements FeedRepo {
  @override
  Future<List<PostModel?>> getFeed(int page) async {
    var url =
        Uri.parse("https://dev.api.spotlas.com/interview/feed?page=$page");
    var response =
        await http.get(url, headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      List<PostModel?> feedModel = feedModelFromJson(response.body);
      return feedModel;
    } else {
      throw 'There was an unknown error while processing the request. Please try again.';
    }
  }
}
