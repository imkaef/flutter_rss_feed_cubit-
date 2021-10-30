part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoadedState extends NewsState {
  final List<RssItem> news;

  NewsLoadedState(this.news);
}

class NewsErroeState extends NewsState {
  final String errorMessage;

  NewsErroeState(this.errorMessage);
}
