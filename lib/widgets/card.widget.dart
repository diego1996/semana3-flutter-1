import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:semana3noticias/models/article.model.dart';

class CardWidget extends StatelessWidget {
  final Article article;

  const CardWidget({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 10, 0, 10),
                child: Row(
                  children: [
                    Text(DateFormat("dd-MM-yyy").format(article.publishedAt))
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
                child: Text(
                  article.title,
                ),
              ),
              /*Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                article.description,
              ),
            ),*/
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.black26, borderRadius: BorderRadius.circular(5)),
        ),
      ),
    );
  }
}
