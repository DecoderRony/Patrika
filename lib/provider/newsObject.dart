import 'package:flutter/material.dart';

class NewsObject with ChangeNotifier {
  String source;
  String author;
  String title;
  String description;
  String imgUrl;
  DateTime publishTime;

  NewsObject({
    this.author,
    this.description,
    this.imgUrl,
    this.publishTime,
    this.source,
    this.title,
  });
}
