import 'dart:convert';

import 'package:news_app/constants/api_url.dart';

import '../model/data_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<Article> news = [];
  Future fetchArticleByCategory(String category) async {
    // final response = await http.get(Uri.parse(ApiUrl.categoryHealth));
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=${ApiUrl.apiKey}";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);

      result["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          Article dataModel = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(dataModel);
        }
      });
      return news;
    } else {
      throw Exception("Failed to load data");
    }
  }
}
