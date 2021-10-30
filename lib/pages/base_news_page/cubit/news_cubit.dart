import 'package:bloc/bloc.dart';
import 'package:dart_rss/dart_rss.dart';
import 'package:meta/meta.dart';
import 'package:rss_cubit/api/news_api.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this._newsProvider) : super(NewsInitial());

  final SportRssApi _newsProvider;
  
  Future<void> loadNews() async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      emit(NewsLoadedState(await _newsProvider.getNews()));
    } on RssNewsException {
      emit(NewsErrorState('Sorry we cant download news'));
    }
  }

  Future<void> reloadNews() async {
    emit(NewsInitial());
  }
}
