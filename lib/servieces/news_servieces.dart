import 'package:dio/dio.dart';
import 'package:news_app/componant/article_model.dart';

class Newservice {
  final Dio dio;
  Newservice(this.dio);
  Future<List<ArticleModel>> Getgeneralnews({required String category}) async {
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=8d8a6135a7ae4d03a2944fcef9a9972f&category=$category');
      Map<String, dynamic> jasondata = response.data;
      List<dynamic> articles = jasondata['articles'];
      List<ArticleModel> articleslist = [];
      for (var article in articles) {
        ArticleModel articleModel = ArticleModel(
          image: article['urlToImage'],
          titel: article['title'],
          subtitel: article['description'],
        );
        articleslist.add(articleModel);
      }
      return articleslist;
    } catch (e) {
      return [];
    }
  }
}
