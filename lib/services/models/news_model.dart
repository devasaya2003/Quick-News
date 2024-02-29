import 'package:quick_news/services/models/news_list_model.dart';

class NewsModel{
  final List<NewsListModel> articles;

  NewsModel({required this.articles});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    var list = json['articles'] as List;
    List<NewsListModel> articlesList =
        list.map((i) => NewsListModel.fromJson(i)).toList();
    return NewsModel(
      articles: articlesList,
    );
  }
}