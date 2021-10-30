import 'package:dart_rss/dart_rss.dart';
import 'package:http/http.dart' as http;
import 'api_exception.dart';

abstract class SportRssApi {
  static const _baseUrl = 'https://www.sport.ru/rssfeeds/';
  final _client = http.Client();
  Future<List<RssItem>> getNews();
}

class FootbalNewsProvider extends SportRssApi {
  final _lastNews = 'football.rss';
  @override
  Future<List<RssItem>> getNews() async {
    try {
      final responce =
          await _client.get(Uri.parse(SportRssApi._baseUrl + _lastNews));
      if (responce.statusCode == 200) {
        return RssFeed.parse(responce.body).items;
      }
      throw RssNewsException();
    } on http.ClientException {
      throw RssNewsException('ClientException');
    }
  }
}

class AllNewsProvider extends SportRssApi {
  final _lastNews = 'news.rss';
  @override
  Future<List<RssItem>> getNews() async {
    try {
      final responce =
          await _client.get(Uri.parse(SportRssApi._baseUrl + _lastNews));
      if (responce.statusCode == 200) {
        return RssFeed.parse(responce.body).items;
      }
      throw RssNewsException();
    } on http.ClientException {
      throw RssNewsException('ClientException');
    }
  }
}
