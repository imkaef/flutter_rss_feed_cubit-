import 'package:dart_rss/dart_rss.dart';
import 'package:flutter/material.dart';


import 'image_news_widget.dart';

class AllNewsWidget extends StatelessWidget {
  const AllNewsWidget({Key? key, required this.item}) : super(key: key);
  final RssItem item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            Text(item.title!),
            Row(
              children: [
                ImageNewsWidget(
                  imageUrl: item.media!.contents[0].url!,
                  height: 100,
                  width: 150,
                ),
                Expanded(
                  child: Text(item.description!),
                )
              ],
            )
          ],
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          color: Colors.greenAccent,
          boxShadow: [
            BoxShadow(color: Colors.green, spreadRadius: 2),
          ],
        ),
      ),
    );
  }
}
