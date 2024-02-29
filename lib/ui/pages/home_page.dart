import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_news/services/api/api_service.dart';
import 'package:quick_news/services/models/news_model.dart';
import 'package:quick_news/services/provider/country_provider.dart';
import 'package:quick_news/services/provider/news_provider.dart';
import 'package:quick_news/ui/pages/country_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NewsModel? newsModel;
  APIService apiService = APIService();
  // List<NewsModel> news = [];

  fetchNews() async {
    newsModel = await apiService.fetchNews(context);
    if (mounted) {
      // Check if the widget is still in the tree
      var newsProvider = Provider.of<NewsProvider>(context, listen: false);
      newsProvider.getNewsCount(newsModel!.articles.length);
      newsProvider.setNewsModel(newsModel!);
      print(newsProvider.newsList.length);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<CountryProvider, NewsProvider>(
      builder: (context, countryProvider, newsProvider, child) => Scaffold(
          backgroundColor: Colors.grey.shade200,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const CountryPage();
              }));
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Select Your Country",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          ),
          appBar: AppBar(
            toolbarHeight: 60,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Quick',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'News',
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                ),
                SizedBox(width: 5),
                Text(
                  ":",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  '${countryProvider.selectedCountry}',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            ),
          ),
          body: ListView.builder(
            itemCount: newsProvider.newsList.length,
            itemBuilder: (context, index) {
              return newsProvider.newsList[index];
            },
          )),
    );
  }
}
