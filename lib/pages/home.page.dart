import 'package:flutter/material.dart';
import 'package:semana3noticias/providers/articles.provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ArticleProvider articleProvider = ArticleProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inicio"),
      ),
      body: _body(),
    );
  }

  _body() {
    articleProvider.getArticlesByName("tesla");
    return Text("Texto de prueba");
  }
}
