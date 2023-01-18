import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:spotlastest/feed/models/feed_model.dart';
import 'package:spotlastest/post/view/reusable_widgets/icon_widget.dart';
import 'reusable_widgets/detail_view.dart';

class UserDetailView extends StatefulWidget {
  final Author? author;
  const UserDetailView({super.key, required this.author});

  @override
  State<UserDetailView> createState() => _UserDetailViewState();
}

class _UserDetailViewState extends State<UserDetailView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      child: DetailView(
        url: widget.author?.photoUrl,
        title: widget.author?.username,
        subTitle: widget.author?.fullName,
        icon: IconWidget(
            onTap: () {},
            size: 19,
            path: "assets/Options.svg",
            color: Colors.white),
      ),
    );
  }
}
