import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageNewsWidget extends StatelessWidget {
  const ImageNewsWidget(
      {Key? key, required this.imageUrl, this.width, this.height})
      : super(key: key);
  final double? width;
  final double? height;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: CachedNetworkImage(
        placeholder: (context, url) => Image.asset('assets/noimage.png'),
        imageUrl: imageUrl,
        height: height ?? 50,
        width: width ?? 80,
        alignment: Alignment.center,
        fit: BoxFit.fill,
      ),
    );
  }
}
