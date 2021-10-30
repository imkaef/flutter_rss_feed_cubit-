import 'package:dart_rss/dart_rss.dart';
import 'package:flutter/material.dart';
import 'package:rss_cubit/utils/utils.dart';

import 'image_news_widget.dart';

class NewsItemFootbalWidget extends StatelessWidget {
  const NewsItemFootbalWidget({Key? key, required this.item}) : super(key: key);
  final RssItem item;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: item.media?.contents.isNotEmpty != null
          ? ImageNewsWidget(
            imageUrl: item.media!.contents[0].url!,
              // imageUrl: item.enclosure!.url!,
            )
          : Image.asset(
              'assets/noimage.png',
              height: 50,
              width: 80,
            ),
      title: Text(
        item.title!,
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.left,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      contentPadding: const EdgeInsets.all(15),
      onTap: () => launchLink(item.link!),
    );
  }
}
