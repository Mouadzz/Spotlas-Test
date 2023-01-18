import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:spotlastest/feed/models/feed_model.dart';
import 'package:spotlastest/post/view/reusable_widgets/icon_widget.dart';
import 'reusable_widgets/detail_view.dart';

class SpotDetailView extends StatefulWidget {
  final Spot? spot;
  const SpotDetailView({super.key, required this.spot});

  @override
  State<SpotDetailView> createState() => _SpotDetailViewState();
}

class _SpotDetailViewState extends State<SpotDetailView> {
  bool saved = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      child: DetailView(
        url: widget.spot?.logo?.url,
        title: widget.spot?.name,
        subTitle: widget.spot?.location?.display,
        icon: IconWidget(
            size: 20,
            onTap: () {
              setState(() {
                saved = !saved;
              });
            },
            path: saved ? "assets/Star.svg" : "assets/Star Border.svg",
            color: saved ? Colors.amber : Colors.white),
      ),
    );
  }
}
