import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:spotlastest/feed/models/feed_model.dart';
import 'package:spotlastest/post/view/reusable_widgets/cashed_image.dart';

class SliderView extends StatefulWidget {
  final List<Media?> media;
  final Function() onImageDoubleTap;
  const SliderView(
      {super.key, required this.media, required this.onImageDoubleTap});

  @override
  State<SliderView> createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.horizontal,
      children: widget.media
          .map((e) => CashedImageWidget(
              onImageDoubleTap: widget.onImageDoubleTap,
              url: e?.url,
              height: 60.h))
          .toList(),
    );
  }
}
