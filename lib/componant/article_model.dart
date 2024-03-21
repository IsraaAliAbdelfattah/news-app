class ArticleModel {
  final String? image;
  final String titel;
  final String? subtitel;
  ArticleModel(
      {required this.image, required this.subtitel, required this.titel});
  factory ArticleModel.fromjson(json) {
    return ArticleModel(
      image: json['urlToImage'],
      titel: json['title'],
      subtitel: json['description'],
    );
  }
}
