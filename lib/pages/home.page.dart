import 'package:flutter/material.dart';
import 'package:semana3noticias/models/article.model.dart';
import 'package:semana3noticias/providers/articles.provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ArticleProvider articleProvider = ArticleProvider();
  Future<List<Article>> futureArticles = Future.value([]);
  int pages = 0;

  @override
  void initState() {
    futureArticles =
        articleProvider.getArticlesByName(search: "tesla", page: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inicio"),
      ),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            articleProvider.getArticlesByName(search: "tesla", page: pages++);
          });
        },
        child: Icon(Icons.new_label),
      ),
    );
  }

  _body() {
    return FutureBuilder(
        future: futureArticles,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Text> list = [];
            snapshot.data.forEach((item) => {list.add(Text(item.author))});
            return ListView(
              children: list,
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
