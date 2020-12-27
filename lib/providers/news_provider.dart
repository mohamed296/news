import 'package:flutter/material.dart';
import 'package:news/models/news.dart';
import 'package:news/models/news_handler.dart';

class NewsProvider with ChangeNotifier {
  List<News> topheadline;

  Future<bool> fetchTopHeadlineNews() async {
    try {
      topheadline = await NewsHandler.instance.getTopHeadlines();
      return true;
    } catch (error) {
      return false;
    }
  }
}
