import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'news24_state.dart';

class News24Cubit extends Cubit<News24State> {
  News24Cubit() : super(News24Initial());
}
