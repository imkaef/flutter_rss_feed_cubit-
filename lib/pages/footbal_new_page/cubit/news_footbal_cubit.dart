import 'package:bloc/bloc.dart';
import 'package:dart_rss/dart_rss.dart';
import 'package:meta/meta.dart';
import 'package:rss_cubit/api/news_api.dart';

part 'news_footbal_state.dart';

class NewsFootbalCubit extends Cubit<NewsFootbalState> {
  NewsFootbalCubit(this._newsProvider) : super(NewsFootbalInitial());

  final SportRssApi _newsProvider;
  
  Future<void> loadNews() async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      emit(NewsLoadedState(await _newsProvider.getNews()));
    } on RssNewsException {
      emit(NewsFootbalErroeState('Sorry we cant download football news'));
    }
  }

  Future<void> reloadNews() async {
    emit(NewsFootbalInitial());
  }
}
