import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_news/services/api/api_service.dart';
import 'package:quick_news/services/models/news_model.dart';
import 'package:quick_news/services/provider/country_provider.dart';
import 'package:quick_news/services/provider/news_provider.dart';

class CountryPage extends StatelessWidget {
  const CountryPage({super.key});

  @override
  Widget build(BuildContext context) {
    APIService apiService = APIService();
    NewsModel newsModel;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "Cancel!",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
      ),
      appBar: AppBar(
        title: const Row(
          children: [
            Text('Select Your '),
            Text(
              'Country',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Consumer2<CountryProvider, NewsProvider>(
        builder: (context, countryProvider, newsProvider, child) =>
            ListView.builder(
          itemCount: countryProvider.allCountries.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () async {
                countryProvider.getSelectedCountry(index);
                countryProvider.getSelectedCountryCode(index);
                print('Tapped on country ${countryProvider.selectedCountry}');
                newsModel = await apiService.fetchNews(context);
                var newsProvider =
                    Provider.of<NewsProvider>(context, listen: false);
                newsProvider.getNewsCount(newsModel.articles.length);
                newsProvider.setNewsModel(newsModel);
                print(newsProvider.newsList.length);
                Navigator.pop(context);
              },
              style: ListTileStyle.drawer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              title: Text(
                '${index + 1}. ${countryProvider.allCountries[index]}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            );
          },
        ),
      ),
    );
  }
}
