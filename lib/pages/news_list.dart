import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/view_models/news_article_list_view_model.dart';
import 'package:news_app/view_models/news_article_view_model.dart';
import 'package:news_app/widgets/newsLIst.dart';
import 'package:provider/provider.dart';

import 'news_article_details_page.dart';

class NewsListPage extends StatefulWidget {
  @override
  _NewsListPageState createState() => _NewsListPageState();
}

final _controller = TextEditingController();

class _NewsListPageState extends State<NewsListPage> {
  void _showNewsArticleDetails(
      BuildContext context, NewsArticleViewModel article) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NewsArticleDetailsPage(article: article)));
  }

  Widget _buildList(BuildContext context, NewsArticleListViewModel vm) {
    switch (vm.loadingStatus) {
      case LoadingStatus.searching:
        return Align(child: CircularProgressIndicator());
      case LoadingStatus.empty:
        return Align(child: Text('no results foound'));
      case LoadingStatus.completed:
        return Expanded(
            child: NewsList(
                articles: vm.articles,
                onSelected: (article) {
                  _showNewsArticleDetails(context, article);
                }));
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('top news'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            autofocus: true,
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                vm.search(value);
              }
            },
            decoration: InputDecoration(
              labelText: 'enter search term',
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.search),
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  _controller.clear();
                },
              ),
            ),
          ),
          _buildList(context, vm)
        ],
      ),
    );
  }
}
