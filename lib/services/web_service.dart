import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/news_article.dart';
import 'package:news_app/utils/constants.dart';

class WebService {
  Future<List<NewsArticle>> fetchHeadLinesByKeyword(String keyword) async {
    final response = await http.get(Constants.headlinesFor(keyword));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['articles'];
      return list.map((json) => NewsArticle.FromJSON(json)).toList();
    } else {
      throw Exception('failed to get specific news');
    }
  }

  Future<List<NewsArticle>> fetchTopHeadLines() async {
    final response = await http.get(Constants.TOP_HEADLINES_URL);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.FromJSON(article)).toList();
    } else {
      throw Exception('failed to get top news');
    }
  }
}
