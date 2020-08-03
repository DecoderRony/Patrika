import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../provider/news.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  var init = true;
  @override
  void didChangeDependencies() {
    if (init) {
      Provider.of<News>(context).getNews();
    }
    init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var news = Provider.of<News>(context).news;

    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        elevation: 0,
        title: Text('Patrika'),
        centerTitle: true,
      ),
      // drawer: Drawer(),
      body: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: news[index].imgUrl != null
                            ? Image.network(
                                news[index].imgUrl,
                                fit: BoxFit.cover,
                                color: Colors.black45,
                                colorBlendMode: BlendMode.darken,
                              )
                            : Container(
                                color: Colors.white60,
                              ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Text(
                          DateFormat('dd/MMM/yyyy')
                              .format(news[index].publishTime),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 10,
                        child: FittedBox(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                news[index].title != null
                                    ? Text(
                                        '- ${news[index].title}',
                                        style: TextStyle(fontSize: 16),
                                      )
                                    : Text('Todays Latest News'),
                                Text(
                                  'By - ${news[index].source}',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              itemCount: news.length,
            ),
          ),
        ),
      ),
    );
  }
}
