import 'package:bloc/bloc.dart';
import 'package:dart_rss/dart_rss.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'news_state.dart';

const _sportsRuRss = 'https://www.sports.ru/rss/rubric.xml?s=208';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  Future<void> loadNews() async {
    try {
      final responce = await http.Client().get(Uri.parse(_sportsRuRss));
      final rssBody = RssFeed.parse(responce.body);
      emit(NewsLoadedState(rssBody.items));
    } catch (e) {
      emit(NewsErroeState(e.toString()));
    }
  }

  Future<void> reloadNews() async {
    emit(NewsInitial());
  }
}
