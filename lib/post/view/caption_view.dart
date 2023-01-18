import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:spotlastest/feed/models/feed_model.dart';

class CaptionView extends StatefulWidget {
  final Caption? caption;
  final Author? author;
  final int maxLines;
  const CaptionView(
      {super.key,
      required this.caption,
      required this.author,
      required this.maxLines});

  @override
  State<CaptionView> createState() => _CaptionViewState();
}

class _CaptionViewState extends State<CaptionView> {
  String data = "";
  String? preText;
  bool _readMore = true;

  @override
  void initState() {
    data = widget.caption?.text ?? "";
    preText = widget.author?.username;
    super.initState();
  }

  void _onTapLink() {
    setState(() {
      _readMore = !_readMore;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle effectiveTextStyle =
        TextStyle(color: Colors.black, fontSize: 11.sp);
    TextStyle linkStyle =
        TextStyle(color: Colors.grey.shade400, fontSize: 11.sp);
    TextStyle preDataTextStyle = TextStyle(
        color: Colors.black, fontSize: 11.sp, fontWeight: FontWeight.w700);

    TextSpan link = TextSpan(
      text: _readMore ? " more..." : " less",
      style: linkStyle,
      recognizer: TapGestureRecognizer()..onTap = _onTapLink,
    );

    final double maxWidth = SizerUtil.boxConstraints.maxWidth;

    TextSpan? preTextSpan;

    if (preText != null)
      preTextSpan = TextSpan(text: preText! + " ", style: preDataTextStyle);

    final text = TextSpan(
      children: [
        if (preTextSpan != null) preTextSpan,
        TextSpan(text: data, style: effectiveTextStyle)
      ],
    );

    TextPainter textPainter = TextPainter(
        text: link,
        textAlign: TextAlign.start,
        textDirection: TextDirection.ltr,
        maxLines: widget.maxLines);
    textPainter.layout(maxWidth: maxWidth);
    final linkSize = textPainter.size;

    textPainter.text = text;
    textPainter.layout(maxWidth: maxWidth);
    final textSize = textPainter.size;

    int endIndex;

    final pos = textPainter.getPositionForOffset(Offset(
      textSize.width - linkSize.width,
      textSize.height,
    ));

    endIndex = textPainter.getOffsetBefore(pos.offset) ?? 0;
    endIndex -= (preText != null ? preText!.length : 0);
    endIndex -= (_readMore ? " more..." : "less").length - 3;

    var textSpan;
    if (textPainter.didExceedMaxLines) {
      textSpan = TextSpan(
          text: _readMore ? data.substring(0, endIndex) : data,
          style: effectiveTextStyle,
          children: [link]);
    } else {
      textSpan = TextSpan(text: data, style: effectiveTextStyle);
    }

    return Container(
      width: 100.w,
      margin: EdgeInsets.symmetric(horizontal: 3.w),
      child: Text.rich(
        TextSpan(
          children: [
            if (preTextSpan != null) preTextSpan,
            textSpan,
          ],
        ),
        textAlign: TextAlign.start,
        textDirection: TextDirection.ltr,
      ),
    );
  }
}
