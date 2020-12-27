import 'package:flutter/material.dart';
import 'package:news/providers/news_provider.dart';
import 'package:news/widgets/backgrond.dart';
import 'package:news/widgets/card_news.dart';
import 'package:news/widgets/card_top_headlines.dart';
import 'package:news/widgets/header_homescrean.dart';
import 'package:provider/provider.dart';

class HomeScrean extends StatefulWidget {
  static const String routeName = '/home';
  @override
  _HomeScreanState createState() => _HomeScreanState();
}

class _HomeScreanState extends State<HomeScrean> {
  bool firstrun, successful;
  @override
  void initState() {
    super.initState();
    firstrun = true;
    successful = false;
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (firstrun) {
      bool done = await Provider.of<NewsProvider>(context, listen: false)
          .fetchTopHeadlineNews();
      setState(() {
        successful = done;
        firstrun = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackGrond(),
          SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: (firstrun)
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : (successful)
                      ? Column(
                          children: [
                            HeaderHomeScrean(),
                            CardTopHeadlines(),
                            SizedBox(
                              height: 18,
                            ),
                            CardNews(),
                          ],
                        )
                      : Center(
                          child: Text("Error"),
                        ),
            ),
          )
        ],
      ),
    );
  }
}
