import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rss_cubit/pages/last_new_page/cubit/news_cubit.dart';
import 'package:rss_cubit/utils/utils.dart';
import 'package:rss_cubit/widgets/image_news_widget.dart';

class LastNewsPage extends StatelessWidget {
  const LastNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsCubit(),
      child: const _LastNewsPage(),
    );
  }
}

class _LastNewsPage extends StatelessWidget {
  const _LastNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
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
            child: newsBuilder(context, state),
            onRefresh: () => context.read<NewsCubit>().reloadNews(),
          );
        }
        if (state is NewsErroeState) {
          return Center(
            child: Text(state.errorMessage),
          );
        }

        return Container();
      },
    );
  }
}

Widget newsBuilder(BuildContext context, NewsLoadedState state) {
  return ListView.builder(
    itemBuilder: (context, index) {
      final item = state.news[index];
      return ListTile(
        leading: ImageNewsWidget(
          imageUrl: item.enclosure!.url!,
        ),
        title: Text(
          item.title!,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        contentPadding: const EdgeInsets.all(15),
        onTap: () => launchLink(item.link!),
      );
    },
    itemCount: state.news.length,
  );
}
