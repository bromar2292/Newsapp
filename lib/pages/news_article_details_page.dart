import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/view_models/news_article_view_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsArticleDetailsPage extends StatelessWidget {
  final NewsArticleViewModel article;

  NewsArticleDetailsPage({this.article});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.article.title}'),
      ),
      body: WebView(
        initialUrl: this.article.url,
      ),
    );
  }
}
