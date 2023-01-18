import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class IconWidget extends StatefulWidget {
  final int size;
  final String path;
  final Color color;
  final bool shadow;
  final Function() onTap;
  const IconWidget(
      {super.key,
      required this.size,
      required this.path,
      this.color = Colors.black,
      required this.onTap,
      this.shadow = false});

  @override
  State<IconWidget> createState() => _IconWidgetState();
}

class _IconWidgetState extends State<IconWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        decoration: BoxDecoration(
            boxShadow: widget.shadow
                ? [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1), blurRadius: 8),
                  ]
                : null),
        height: widget.size.sp,
        width: widget.size.sp,
        child: SvgPicture.asset(
          widget.path,
          color: widget.color,
        ),
      ),
    );
  }
}
