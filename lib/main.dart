import 'package:flutter/material.dart';
import 'package:news/providers/news_provider.dart';
import 'package:news/screens/homescrean.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.red[900],
          accentColor: Colors.white,
          fontFamily: 'MontserratAlternates',
        ),
        home: HomeScrean(),
        routes: {
          HomeScrean.routeName: (context) => HomeScrean(),
        },
      ),
    );
  }
}
