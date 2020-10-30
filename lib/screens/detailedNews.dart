import 'package:flutter/material.dart';
import 'package:samachar/provider/newsObject.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NewsObject news = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: Column(
          children: [
            news.imgUrl != null ?
            Container(
              child: Image.network(news.imgUrl),
            ):Container(
              width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.3,
      color: Colors.white60,
      child: Icon(Icons.broken_image, size: 60,),
    ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(news.title,  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: news.description != null?Text(news.description, style: TextStyle(fontSize: 18,),):Container(),
            ),
          ],
        ),
      ),
    );
  }
}
