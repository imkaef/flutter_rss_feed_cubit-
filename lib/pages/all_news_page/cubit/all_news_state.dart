part of 'all_news_cubit.dart';

@immutable
abstract class AllNewsState {}

class AllNewsInitial extends AllNewsState {}
class AllNewsLoadedState extends AllNewsState {}
class AllNewsErrorState extends AllNewsState {}
