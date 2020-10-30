import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
            
            child: StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                itemBuilder: (ctx, index) {

                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushNamed('/detail', arguments: news[index]);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        fit: StackFit.expand,
                        overflow: Overflow.clip,

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
                              child: Icon(Icons.broken_image, size: 60,),
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
                          SizedBox(height: 10,),
                          Positioned(
                            bottom: 5,
                            left: 10,
                            child: FittedBox(
                              child: Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.9,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    news[index].title != null
                                        ? news[index].title.length >= 23 ?
                                    Text(
                                      '${news[index].title.substring(0,23)}...',
                                      style: TextStyle(fontSize: 16),
                                    ): Text(
                                      '${news[index].title}',
                                      style: TextStyle(fontSize: 16),
                                    )
                                        : Text('Today\'s Latest News'),
                                    Text(
                                      ' - ${news[index].source}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                staggeredTileBuilder: (int index) =>
                new StaggeredTile.count(2, index.isEven ? 2 : 1),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,

                itemCount: news.length,
            )
          );
      
  }
  ),
  ),
  ),
  ),
  );
}
