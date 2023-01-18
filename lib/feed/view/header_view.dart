import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HeaderView extends StatelessWidget {
  final String title;
  const HeaderView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      width: 100.w,
      color: Colors.white,
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp),
      ),
    );
  }
}
