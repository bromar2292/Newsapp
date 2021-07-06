class NewsArticle {
  final String title;
  final String description;
  final String urlToImage;
  final String url;

  NewsArticle({this.title, this.url, this.description, this.urlToImage});

  factory NewsArticle.FromJSON(Map<String, dynamic> json) {
    return NewsArticle(
        title: json['title'],
        url: json['url'],
        description: json['description'],
        urlToImage: json['urlToImage']);
  }
}
