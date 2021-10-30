import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rss_cubit/api/news_api.dart';

import 'package:rss_cubit/utils/utils.dart';
import 'package:rss_cubit/widgets/image_news_widget.dart';

import 'cubit/news_footbal_cubit.dart';

abstract class BaseNewsFootbalPage extends StatelessWidget {
  const BaseNewsFootbalPage({Key? key, required SportRssApi _newsProvider})
      : _newsProvider = newsProvider,
        super(key: key);
  final SportRssApi _newsProvider;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsFootbalCubit(_newsProvider),
      child: BlocBuilder<NewsFootbalCubit, NewsFootbalState>(
        builder: (context, state) {
          if (state is NewsFootbalInitial) {
            context.read<NewsFootbalCubit>().loadNews();
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is NewsLoadedState) {
            context.read<NewsFootbalCubit>().loadNews();
            return RefreshIndicator(
              child: newsBuilder(context, state),
              onRefresh: () => context.read<NewsFootbalCubit>().reloadNews(),
            );
          }
          if (state is NewsFootbalErroeState) {
            return Center(
              child: Text(state.errorMessage),
            );
          }

          return Container();
        },
      ),
    );
  }

  Widget newsBuilder(BuildContext context, NewsLoadedState state) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final item = state.news[index];
        return ListTile(
          leading: item.enclosure != null
              ? ImageNewsWidget(
                  imageUrl: item.enclosure!.url!,
                )
              : Image.asset(
                  'assets/noimage.png',
                  height: 50,
                  width: 80,
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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<SportRssApi>('_newsProvider', _newsProvider));
  }
}
