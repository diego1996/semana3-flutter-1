import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:intl/intl.dart';
import 'package:semana3noticias/models/article.model.dart';

class ArticleDetail extends StatelessWidget {
  final Article article;

  const ArticleDetail({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.title)),
      body: _body(),
    );
  }

  _body() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 10, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                child: Icon(Icons.share),
                onTap: share,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
          child: Row(
            children: [
              Text(
                  "Fecha: ${DateFormat("dd-MM-yyy").format(article.publishedAt)}")
            ],
          ),
        ),
        article.urlToImage == ''
            ? Image(image: AssetImage('assets/no-image.jpg'))
            : FadeInImage(
                placeholder: AssetImage('assets/loading.gif'),
                image: NetworkImage(article.urlToImage)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                "Autor: ${article.author}",
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Titulo: ${article.title}",
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Descripción: ${article.description}",
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "URL Noticia: ${article.url}",
          ),
        ),
      ],
    );
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: article.title,
        text: article.description,
        linkUrl: article.url,
        chooserTitle: article.title);
  }
}
