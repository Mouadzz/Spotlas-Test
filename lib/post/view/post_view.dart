import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:spotlastest/feed/models/feed_model.dart';
import 'package:spotlastest/post/view/caption_view.dart';
import 'package:spotlastest/post/view/reusable_widgets/icon_widget.dart';
import 'package:spotlastest/post/view/slider_view.dart';
import 'package:spotlastest/post/view/spot_detail.view.dart';
import 'package:spotlastest/post/view/tags_view.dart';
import 'package:spotlastest/post/view/toolbar_view.dart';
import 'user_detail_view.dart';

class PostWidget extends StatefulWidget {
  final PostModel? post;
  const PostWidget({super.key, required this.post});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget>
    with SingleTickerProviderStateMixin {
  bool isLiked = false;
  late Animation<double> animation;
  late AnimationController controller;
  double scale = 0.0;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    animation = Tween(begin: 0.0, end: 1.1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.linearToEaseOut,
      ),
    )..addListener(() {
        setState(() => scale = animation.value);
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _animate() {
    animation
      ..addStatusListener((AnimationStatus status) {
        if (scale == 1.1) {
          Future.delayed(Duration(milliseconds: 500)).then((value) {
            controller.animateTo(0,
                curve: Curves.linear, duration: Duration(milliseconds: 300));
          });
        }
      });
    controller.forward();
  }

  void onLikeTapped() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Column(
        children: [
          Container(
            height: 60.h,
            child: Stack(
              children: [
                SliderView(
                    onImageDoubleTap: () {
                      if (!isLiked) _animate();
                      onLikeTapped();
                    },
                    media: widget.post?.media ?? []),
                Transform.scale(
                    scale: scale,
                    child: Center(
                        child: IconWidget(
                            onTap: () {},
                            size: 55,
                            shadow: true,
                            color: Colors.red,
                            path: "assets/Heart.svg"))),
                Align(
                    alignment: Alignment.topCenter,
                    child: UserDetailView(author: widget.post?.author)),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: SpotDetailView(spot: widget.post?.spot)),
              ],
            ),
          ),
          ToolBarView(isLiked: isLiked, onLikeTaped: () => onLikeTapped()),
          CaptionView(
              maxLines: 2,
              caption: widget.post?.caption,
              author: widget.post?.author),
          TagsView(
              tags: widget.post?.tags ?? [],
              createdAt: widget.post?.createdAt ?? DateTime.now()),
        ],
      ),
    );
  }
}
