import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:spotlastest/post/view/reusable_widgets/icon_widget.dart';

class ToolBarView extends StatefulWidget {
  final bool isLiked;
  final Function() onLikeTaped;
  const ToolBarView(
      {super.key, required this.isLiked, required this.onLikeTaped});

  @override
  State<ToolBarView> createState() => _ToolBarViewState();
}

class _ToolBarViewState extends State<ToolBarView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      margin: EdgeInsets.symmetric(vertical: 1.8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconWidget(onTap: () {}, size: 21, path: "assets/Map Border.svg"),
          IconWidget(onTap: () {}, size: 21, path: "assets/Comment.svg"),
          IconWidget(
              onTap: () {
                widget.onLikeTaped();
              },
              size: 21,
              shadow: widget.isLiked,
              color: widget.isLiked ? Colors.red : Colors.black,
              path: widget.isLiked
                  ? "assets/Heart.svg"
                  : "assets/Heart Border.svg"),
          IconWidget(
              onTap: () {}, size: 21, path: "assets/Paper Plane Border.svg"),
        ],
      ),
    );
  }
}
