import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samachar/provider/themeState.dart';
import 'package:samachar/screens/detailedNews.dart';

import './provider/news.dart';
import './screens/landing.dart';

void main() {
  runApp(
      ChangeNotifierProvider(create: (context) => ThemeState(ThemeData.dark()), child: MyApp(),),);
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeState>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => News()),
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Samachar Patrika',
        theme: theme.getTheme(),
        home: LandingScreen(),
        routes: {
          '/detail' : (context) => Detail(),
        },
      ),
    );
  }
}
