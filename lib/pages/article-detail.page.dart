import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:semana3noticias/models/article.model.dart';

class ArticleDetail extends StatelessWidget {
  final Article article;
  const ArticleDetail({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.title)),

    );
  }
}
