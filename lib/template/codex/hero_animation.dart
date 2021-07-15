import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class HeroModel {
  String name;
  String image;
  String detail;

  HeroModel({this.name, this.image, this.detail});
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<HeroModel> heroList = [
    HeroModel(
        name: "Iron Man",
        image: "https://pngimg.com/uploads/ironman/ironman_PNG66.png",
        detail:
            "Iron Man is a superhero appearing in American comic books published by Marvel Comics. The character was co-created by writer and editor Stan Lee, developed by scripter Larry Lieber, and designed by artists Don Heck and Jack Kirby. The character made his first appearance in Tales of Suspense #39 (cover dated March 1963), and received his own title in Iron Man #1 (May 1968)"),
    HeroModel(
        name: "Captain America",
        image:
            "https://pngimg.com/uploads/captain_america/captain_america_PNG57.png",
        detail:
            "Captain America is a superhero appearing in American comic books published by Marvel Comics. Created by cartoonists Joe Simon and Jack Kirby, the character first appeared in Captain America Comics #1 (cover dated March 1941) from Timely Comics, a predecessor of Marvel Comics"),
    HeroModel(
        name: "Thor",
        image:
            "https://www.pngkey.com/png/full/445-4459677_learn-more-about-your-mission-mcu-png-thor.png",
        detail:
            "In Germanic mythology, Thor (/θɔːr/; from Old Norse: Þórr) is a hammer-wielding god associated with lightning, thunder, storms, sacred groves and trees, strength, the protection of mankind and also hallowing and fertility. Besides Old Norse Þórr, the deity occurs in Old English as Þunor, in Old Frisian as Thuner, in Old Saxon as Thunar, and in Old High German as Donar, all ultimately stemming from the Proto-Germanic theonym *Þun(a)raz, meaning 'Thunder'."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Marvel Cinematic Universe",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2),
              ),
              Text(
                "Super Heroes",
                style: TextStyle(fontSize: 24, letterSpacing: 2),
              ),
              Expanded(
                  child: PageView.builder(
                      itemCount: heroList.length,
                      itemBuilder: (context, index) => HeroCard(
                            heroModel: heroList[index],
                          )))
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var roundnessFactor = 50.0;
    var roundCurve = 0.33;

    Path path = Path();

    path.moveTo(0, size.height * roundCurve);
    path.lineTo(0, size.height - roundnessFactor);
    path.quadraticBezierTo(0, size.height, roundnessFactor, size.height);

    path.lineTo(size.width - roundnessFactor, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - roundnessFactor);

    path.lineTo(size.width, roundnessFactor * 2);
    path.quadraticBezierTo(
        size.width, 0, size.width - roundnessFactor * 4.2, roundnessFactor * 2);

    path.lineTo(roundnessFactor, size.height * roundCurve);
    path.quadraticBezierTo(0, size.height * roundCurve * 1.2, 0,
        size.height * roundCurve + roundnessFactor * 2);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class HeroCard extends StatelessWidget {
  HeroModel heroModel;

  HeroCard({this.heroModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        /*Navigator.push(context,
                              MaterialPageRoute(builder: (context) => DetailPage()));*/
        Navigator.push(
            context,
            PageRouteBuilder(
                pageBuilder: (context, a, b) => DetailPage(
                      heroModel: heroModel,
                    )));
      },
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: DashboardClipper(),
              child: Hero(
                tag: "background",
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.orange, Colors.deepOrangeAccent],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight)),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.8 * 0.3),
              child: Image(
                image: NetworkImage(heroModel.image),
                height: 280,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  heroModel.name,
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2),
                ),
                Text(
                  "Click for detail",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final HeroModel heroModel;

  DetailPage({this.heroModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Hero(
              tag: "background",
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.orange, Colors.deepOrangeAccent],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight)),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                image: NetworkImage(heroModel.image),
                width: 200,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  heroModel.detail,
                  maxLines: 7,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14, color: Colors.white, letterSpacing: 2),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 10.0),
            child: OutlineButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Icon(Icons.close),
            ),
          )
        ],
      ),
    );
  }
}
