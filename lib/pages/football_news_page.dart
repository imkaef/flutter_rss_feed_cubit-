import 'package:dart_rss/domain/rss_item.dart';
import 'package:flutter/material.dart';
import 'package:rss_cubit/api/news_api.dart';
import 'package:rss_cubit/widgets/football_news_widget.dart';
import 'base_news_page/base_news_page.dart';

class FootballNewsPage extends BaseNewsPage {
  const FootballNewsPage({Key? key, required SportRssApi newsProvider})
      : super(key: key, newsProvider: newsProvider);

  @override
  Widget listTileBuilder(RssItem item) {
    return NewsItemFootbalWidget(item: item);
  }
}
