import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:semana3noticias/models/article.model.dart';

class ArticleProvider {
  String _baseUrl = "newsapi.org";
  String _pathEveryThing = "/v2/everything";
  String _searchParam = "q";
  String _sortByParam = "sortBy";
  String _sortByValue = "publishedAt";
  String _apiKeyParam = "apiKey";
  String _apiKeyValue = "49f55356f5b94455822fd21079c5efcb";

  Future<List<Article>> getArticlesByName(String search) async {
    List<Article> articles = [];
    var url = Uri.https(_baseUrl, _pathEveryThing, {
      _searchParam: search,
      _sortByParam: _sortByValue,
      _apiKeyParam: _apiKeyValue
    });

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var articlesCount = jsonResponse['totalResults'];
      jsonResponse['articles']
          .forEach((item) => {articles.add(Article.fromJson(item))});
      print('Number of articles found: $articlesCount.');
    }
    return articles;
  }
}
