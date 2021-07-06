import 'package:flutter/material.dart';
import 'package:news_app/pages/news_list.dart';
import 'package:provider/provider.dart';

import 'view_models/news_article_list_view_model.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fresh news',
      home: ChangeNotifierProvider(
        create: (_) => NewsArticleListViewModel(),
        child: NewsListPage(),
      ),
    );
  }
}
