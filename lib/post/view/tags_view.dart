import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:sizer/sizer.dart';
import 'package:spotlastest/feed/models/feed_model.dart';

class TagsView extends StatefulWidget {
  final List<Tag?> tags;
  final DateTime createdAt;
  const TagsView({super.key, required this.tags, required this.createdAt});

  @override
  State<TagsView> createState() => _TagsViewState();
}

class _TagsViewState extends State<TagsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1.h),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: widget.tags.isNotEmpty
                  ? widget.tags.map((e) => _tag(e)).toList()
                  : [
                      Tag(displayText: 'Outdoors'),
                      Tag(displayText: 'Cheap'),
                      Tag(displayText: 'Live Music'),
                      Tag(displayText: 'Fancy'),
                      Tag(displayText: 'Outdoors'),
                      Tag(displayText: 'Cheap'),
                      Tag(displayText: 'Live Music'),
                      Tag(displayText: 'Fancy')
                    ].map((e) => _tag(e)).toList(),
            ),
          ),
          SizedBox(height: 1.h),
          Padding(
            padding: EdgeInsets.only(left: 3.w),
            child: Text(
              Jiffy(widget.createdAt).fromNow(),
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 11.sp,
                  color: Colors.grey.shade400),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tag(Tag? e) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 0.5.w),
      padding: EdgeInsets.all(5.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 2.5,
              offset: Offset(0, 1)),
        ],
      ),
      child: Text(
        e?.displayText ?? '',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 11.sp,
        ),
      ),
    );
  }
}
