import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'all_news_state.dart';

class News24Cubit extends Cubit<AllNewsState> {
  News24Cubit() : super(AllNewsInitial());
}
