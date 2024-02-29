import 'package:flutter/material.dart';
import 'package:quick_news/services/models/news_model.dart';
import 'package:quick_news/ui/widgets/news_widget.dart';

class NewsProvider extends ChangeNotifier {
  int newsCount = 0;
  String newsImageUrl = '';
  String newsTitle = 'Title';
  String newsDescription = 'Description';
  String newsDate = 'Date';

  List<NewsWidget> newsList = [];

  void setNewsModel(NewsModel newsModel) {
    newsList.clear();
    newsCount = newsModel.articles.length;
    for (var i = 0; i < newsModel.articles.length; i++) {
      newsImageUrl = newsModel.articles[i].urlToImage;
      newsTitle = newsModel.articles[i].title;
      newsDescription = newsModel.articles[i].description;
      newsDate = newsModel.articles[i].publishedAt;
      newsList.add(NewsWidget(
        imageUrl: newsImageUrl,
        title: newsTitle,
        description: newsDescription,
        date: newsDate,
      ));
    }
    notifyListeners();
  }

  void getNewsCount(int count) {
    newsCount = count;
    notifyListeners();
  }
}
