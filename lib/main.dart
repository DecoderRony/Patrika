import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samachar/screens/detailedNews.dart';

import './provider/news.dart';
import './screens/landing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => News()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Samachar Patrika',
        theme: ThemeData.dark(),
        home: LandingScreen(),
        routes: {
          '/detail' : (context) => Detail(),
        },
      ),
    );
  }
}
