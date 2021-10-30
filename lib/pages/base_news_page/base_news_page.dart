import 'package:dart_rss/domain/rss_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rss_cubit/api/news_api.dart';


import 'cubit/news_cubit.dart';

abstract class BaseNewsPage extends StatelessWidget {
  const BaseNewsPage({Key? key, required SportRssApi newsProvider})
      : _newsProvider = newsProvider,
        super(key: key);
  final SportRssApi _newsProvider;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsCubit(_newsProvider),
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state is NewsInitial) {
            context.read<NewsCubit>().loadNews();
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is NewsLoadedState) {
            context.read<NewsCubit>().loadNews();
            return RefreshIndicator(
              child: listBuilder(context, state),
              onRefresh: () => context.read<NewsCubit>().reloadNews(),
            );
          }
          if (state is NewsErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          }

          return Container();
        },
      ),
    );
  }

  Widget listBuilder(BuildContext context, NewsLoadedState state) {
    return ListView.builder(
      itemCount: state.news.length,
      itemBuilder: (context, index) {
        final item = state.news[index];
        return listTileBuilder(item);
      },
    );
  }

  Widget listTileBuilder(RssItem item);
}
