import 'package:flutter/material.dart';
import 'package:semana3noticias/pages/home.page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App de Noticias",
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
