class Constants {
  static String TOP_HEADLINES_URL =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=5ce18e1fa0744199ae62a9cee05e7f14';

  static String headlinesFor(String keyword) {
    return 'https://newsapi.org/v2/everything?q=$keyword&from=2021-06-28&to=2021-06-28&sortBy=popularity&apiKey=5ce18e1fa0744199ae62a9cee05e7f14';
  }
}
