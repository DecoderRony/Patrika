import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import './newsObject.dart';

class News with ChangeNotifier {
  List<NewsObject> allNews = [];

  List<NewsObject> get news {
    return [...allNews];
  }

  Future<void> getNews() async {
    const url =
        "http://newsapi.org/v2/top-headlines?country=in&apiKey=b47f19cedeaf40638169ac03bcf84cee";
    try {
      var response = await http.get(url);
      var responseData = jsonDecode(response.body) as Map<String, dynamic>;
      List data = responseData['articles'];
      var len = data.length;
      List<NewsObject> loadedNews = [];
      var i = 0;
      while (i < len) {
        loadedNews.add(
          NewsObject(
            source: data[i]['source']['name'],
            title: data[i]['title'],
            description: data[i]['description'],
            imgUrl: data[i]['urlToImage'],
            publishTime: DateTime.parse(data[i]['publishedAt']),
          ),
        );
        i++;
      }
      allNews = loadedNews;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
