import 'package:flutter/cupertino.dart';
import 'package:news_app/models/news_article.dart';
import 'package:news_app/services/web_service.dart';
import 'package:news_app/view_models/news_article_view_model.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class NewsArticleListViewModel extends ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;

  List<NewsArticleViewModel> articles;

  NewsArticleListViewModel() {
    _populateTopHeadLines();
  }

  Future<void> search(value) async {
    this.loadingStatus = LoadingStatus.searching;
    List<NewsArticle> newsArticle =
        await WebService().fetchHeadLinesByKeyword(value);
    this.articles = newsArticle
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    this.loadingStatus =
        this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }

  Future<void> _populateTopHeadLines() async {
    this.loadingStatus = LoadingStatus.searching;
    List<NewsArticle> newsArticle = await WebService().fetchTopHeadLines();
    this.articles = newsArticle
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    this.loadingStatus =
        this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }
}
