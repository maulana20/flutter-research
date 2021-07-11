import 'dart:math';

import 'package:division/division.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> urls = [
    "https://lumiere-a.akamaihd.net/v1/images/aladdin-movie-poster_63150511.jpeg",
    "https://lumiere-a.akamaihd.net/v1/images/poster-sea_a749e732.jpeg",
    "https://lumiere-a.akamaihd.net/v1/images/open-uri20150422-12561-v5rukb_96994cde.jpeg"
  ];
  PageController controller =
      PageController(initialPage: 0, viewportFraction: 0.6);
  double currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: PageView.builder(
          controller: controller,
          itemCount: urls.length,
          itemBuilder: (context, index) {
            double different = index - currentPage;
            if (different < 0) {
              different *= -1;
            }
            different = min(1, different);
            return Center(
                child: MovieBox(
              urls[index],
              scale: 1 - (different * 0.3),
            ));
          }),
    );
  }
}

ParentStyle parentStyle = ParentStyle()
  ..width(200)
  ..height(300)
  ..borderRadius(all: 10)
  ..margin(all: 10)
  ..elevation(3)
  ..background.color(Colors.pink);

class MovieBox extends StatelessWidget {
  final String url;
  final double scale;

  MovieBox(this.url, {this.scale = 1});

  @override
  Widget build(BuildContext context) {
    return Parent(
      style: parentStyle.clone()
        ..background.image(url: url, fit: BoxFit.cover)
        ..width(200 * scale)
        ..height(300 * scale),
    );
  }
}
