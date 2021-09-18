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

  getArticlesByName(String search) async {
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
      // List<Article> articles = jsonResponse['articles'] as List<Article>;
      print('Number of articles found: $articlesCount.');
      // print('Titulo del primer articulo: ${articles.first.title}.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
      throw Exception("Request failed with status: ${response.statusCode}.");
    }
  }
}
