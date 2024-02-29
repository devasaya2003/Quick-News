import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:quick_news/services/constants/constants.dart';


class CountryProvider extends ChangeNotifier {
  UnmodifiableListView<dynamic> get allCountries =>
      UnmodifiableListView(countries);

  UnmodifiableListView<dynamic> get allCountryCodes =>
      UnmodifiableListView(countryCodes);

  String selectedCountry = countries[0];
  String selectedCountryCode = countryCodes[0];

  void getSelectedCountry(int index) {
    selectedCountry = countries[index];
    notifyListeners();
  }

  void getSelectedCountryCode(int index) {
    selectedCountryCode = countryCodes[index];
    notifyListeners();
  }
}
