import 'package:flutter/material.dart';
import 'package:news_app/views/home_page.dart';

void main() {
  runApp(const News_app());
}

class News_app extends StatelessWidget {
  const News_app({super.key});

  @override

  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
