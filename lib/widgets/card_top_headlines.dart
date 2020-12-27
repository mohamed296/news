import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news/providers/news_provider.dart';
import 'package:provider/provider.dart';

class CardTopHeadlines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return CarouselSlider.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(Provider.of<NewsProvider>(context)
                      .topheadline[index]
                      .backposterurl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor.withOpacity(0.5),
                    Theme.of(context).primaryColor.withOpacity(0),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              left: 15,
              right: 20,
              child: Text(
                Provider.of<NewsProvider>(context).topheadline[index].title,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        );
      },
      options: CarouselOptions(
        height: 180.0,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayAnimationDuration: Duration(milliseconds: 400),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
      ),
    );
  }
}
