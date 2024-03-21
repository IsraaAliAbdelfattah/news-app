import 'package:flutter/material.dart';
import 'package:news_app/widgets/category_card.dart';
import 'package:news_app/componant/category_model.dart';
import 'package:news_app/componant/article_model.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});
  final List<CategoryModel> categrycard = const [
    CategoryModel(photo: 'assets/technology.jpg', text: 'Technology'),
    CategoryModel(photo: 'assets/health.jpg', text: 'Health'),
    CategoryModel(photo: 'assets/business.jpg', text: 'Business'),
    CategoryModel(photo: 'assets/science.jpg', text: 'Science'),
    CategoryModel(photo: 'assets/entertainment.jpg', text: 'Entertainment'),
    CategoryModel(photo: 'assets/general.jpg', text: 'General'),
    CategoryModel(photo: 'assets/sports.jpg', text: 'Sports'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categrycard.length,
          itemBuilder: (context, index) {
            return CategoryCard(
              categoryModel: categrycard[index],
            );
          }),
    );
  }
}

class News extends StatelessWidget {
  const News({super.key, required this.articleModel});
  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: articleModel.image != null
                ? Image.network(
                    articleModel.image!,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  )
                : Image.network('')),
        const SizedBox(
          height: 12,
        ),
        Text(
          articleModel.titel,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style:const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.black87,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          articleModel.subtitel ?? '',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style:const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class NewsListView extends StatelessWidget {
  List<ArticleModel> articles = [];
  NewsListView({super.key, required this.articles});
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: News(
              articleModel: articles[index],
            ),
          );
        },
      ),
    );
  }
}
