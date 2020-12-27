import 'package:dio/dio.dart';
import 'package:news/helpers/api_key.dart';
import 'package:news/models/news.dart';

class NewsHandler {
  static NewsHandler _instance = NewsHandler._private();
  NewsHandler._private();
  static NewsHandler get instance => _instance;

  Dio _dio = Dio();

  Future<List<News>> getTopHeadlines() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=${ApiKeys.apikey}';

    Response response = await _dio.get(url);
    List<News> news = (response.data['articles'] as List).map((newstop) {
      return News.fromjson(newstop);
    }).toList();

    return news;
  }
}
