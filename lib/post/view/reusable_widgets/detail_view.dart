import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:spotlastest/post/view/reusable_widgets/cashed_image.dart';

class DetailView extends StatefulWidget {
  final String? url;
  final String? title;
  final String? subTitle;
  final Widget icon;
  const DetailView(
      {super.key,
      required this.url,
      required this.title,
      required this.subTitle,
      required this.icon});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              CashedImageWidget(
                onImageDoubleTap: () {},
                url: widget.url,
                shape: BoxShape.circle,
                width: 43.sp,
                height: 43.sp,
              ),
              SizedBox(width: 3.w),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 11.5.sp,
                      shadows: [
                        Shadow(
                          blurRadius: 14,
                          color: Colors.black.withOpacity(0.8),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 0.3.h),
                  Text(
                    widget.subTitle ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade300,
                      fontSize: 11.sp,
                      shadows: [
                        Shadow(
                          blurRadius: 14,
                          color: Colors.black.withOpacity(0.8),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 3.w),
            child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.25), blurRadius: 10),
                ]),
                child: widget.icon),
          )
        ],
      ),
    );
  }
}
