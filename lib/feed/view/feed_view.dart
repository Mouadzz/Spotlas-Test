import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:spotlastest/feed/bloc/feed_bloc.dart';
import 'package:spotlastest/feed/models/feed_model.dart';
import 'package:spotlastest/feed/services/feed_services.dart';
import 'package:spotlastest/post/post.dart';
import 'header_view.dart';

class FeedView extends StatefulWidget {
  const FeedView({super.key});

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  final FeedBloc feedBloc = FeedBloc(FeedServices());
  bool isLoading = false;
  int page = 1;
  List<PostModel?> posts = [];
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    feedBloc.add(GetFeed(page: page));
    _controller = ScrollController()..addListener(_loadMore);
    super.initState();
  }

  @override
  void dispose() {
    feedBloc.close();
    _controller.dispose();
    super.dispose();
  }

  void _loadMore() {
    if (!isLoading && _controller.position.extentAfter == 0) {
      feedBloc.add(GetFeed(page: page));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider.value(
        value: feedBloc,
        child: BlocListener<FeedBloc, FeedState>(
            listener: (context, state) {
              if (state is FeedLoading) {
                setState(() {
                  isLoading = true;
                });
              } else if (state is FeedError) {
                setState(() {
                  isLoading = false;
                });
                log(state.msg);
              } else if (state is FeedLoaded) {
                setState(() {
                  isLoading = false;
                  if (state.result.isNotEmpty) page += 1;
                  posts.addAll(state.result);
                });
              }
            },
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  HeaderView(title: 'Feed'),
                  Expanded(
                    child: ListView.builder(
                      itemCount: posts.length,
                      controller: _controller,
                      itemBuilder: (context, index) {
                        return PostWidget(post: posts[index]);
                      },
                    ),
                  ),
                  if (isLoading)
                    Padding(
                      padding: EdgeInsets.only(top: 3.h, bottom: 6.h),
                      child: Center(
                        child: CupertinoActivityIndicator(
                          radius: 10.sp,
                        ),
                      ),
                    ),
                ],
              ),
            )),
      ),
    );
  }
}
