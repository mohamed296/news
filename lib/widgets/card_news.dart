import 'package:flutter/material.dart';
import 'package:news/providers/news_provider.dart';
import 'package:news/widgets/news_details_dialog.dart';
import 'package:provider/provider.dart';

class CardNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var news = Provider.of<NewsProvider>(context).topheadline;

    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
              itemExtent: 100,
              itemCount: news.length,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 8,
                  margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.05)
                      .add(
                    EdgeInsets.only(
                      bottom: 13,
                    ),
                  ),
                  child: ListTile(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return NeWsDetailsDialog(
                              imag: news[index].backposterurl,
                              title: news[index].title,
                              details: news[index].content,
                              url: news[index].url);
                        },
                      );
                    },
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                    leading: (news[index].backposterurl != null)
                        ? Container(
                            width: 70,
                            height: 50,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image.network(
                                news[index].backposterurl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : Container(
                            width: 0,
                            height: 0,
                          ),
                    title: Text(
                      news[index].title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
