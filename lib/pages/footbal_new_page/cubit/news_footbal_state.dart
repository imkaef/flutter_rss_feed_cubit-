part of 'news_footbal_cubit.dart';

@immutable
abstract class NewsFootbalState {}

class NewsFootbalInitial extends NewsFootbalState {}

class NewsLoadedState extends NewsFootbalState {
  final List<RssItem> news;

  NewsLoadedState(this.news);
}

class NewsFootbalErroeState extends NewsFootbalState {
  final String errorMessage;

  NewsFootbalErroeState(this.errorMessage);
}
