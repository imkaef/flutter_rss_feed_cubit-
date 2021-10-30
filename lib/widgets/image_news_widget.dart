import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageNewsWidget extends StatelessWidget {
  const ImageNewsWidget({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    const double width = 80;
    const double height = 50;
    return Padding(
      padding: const EdgeInsets.all(3),
      child: CachedNetworkImage(
        placeholder: (context, url) => Image.asset('assets/noimage.png'),
        imageUrl: imageUrl,
        height: height,
        width: width,
        alignment: Alignment.center,
        fit: BoxFit.fill,
      ),
    );
  }
}
