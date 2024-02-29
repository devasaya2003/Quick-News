import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:quick_news/services/constants/constants.dart';
import 'package:quick_news/services/models/news_model.dart';
import 'package:quick_news/services/provider/country_provider.dart';

class APIService {
  Future<NewsModel> fetchNews(BuildContext context) async {
    final String countryCode =
        Provider.of<CountryProvider>(context, listen: false)
            .selectedCountryCode;
    final response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=$countryCode&apiKey=$apiKey"));
    if (response.statusCode == 200) {
      print(response.body);
      return NewsModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load news");
    }
  }
}
