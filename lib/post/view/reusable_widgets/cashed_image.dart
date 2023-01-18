import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CashedImageWidget extends StatelessWidget {
  final String? url;
  final BoxFit fit;
  final double? width;
  final double? height;
  final BoxShape shape;
  final Function() onImageDoubleTap;
  const CashedImageWidget(
      {super.key,
      required this.url,
      this.fit = BoxFit.cover,
      this.width,
      this.height,
      this.shape = BoxShape.rectangle,
      required this.onImageDoubleTap});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageBuilder: (context, imageProvider) {
        return GestureDetector(
          onDoubleTap: onImageDoubleTap,
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                boxShadow: shape == BoxShape.circle
                    ? [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 5),
                      ]
                    : null,
                shape: shape,
                image: DecorationImage(image: imageProvider)),
          ),
        );
      },
      imageUrl: url ?? '',
      fit: fit,
      height: height,
      width: width,
    );
  }
}
