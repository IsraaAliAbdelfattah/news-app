import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../componant/article_model.dart';
import '../servieces/news_servieces.dart';
import 'categories_list_view.dart';

class NewListViewBuilder extends StatefulWidget {
  const NewListViewBuilder({super.key, required this.category});
  final String category;
  @override
  State<NewListViewBuilder> createState() => _NewListViewBuilderState();
}

class _NewListViewBuilderState extends State<NewListViewBuilder> {
  var future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = Newservice(Dio()).Getgeneralnews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListView(articles: snapshot.data!);
        } else if (snapshot.hasError) {
         const Center(
            child: Text('there \'s an error please try again later'),
          );
        }

        return const SliverToBoxAdapter(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
