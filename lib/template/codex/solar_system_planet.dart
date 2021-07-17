import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [gradientStartColor, gradientEndColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.3, 0.7]),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Explore",
                          style: TextStyle(
                              fontSize: 40,
                              fontFamily: "Avenir",
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.w900),
                          textAlign: TextAlign.left,
                        ),
                        DropdownButton(
                          items: [
                            DropdownMenuItem(
                              child: Text(
                                "Solar System",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontFamily: "Avenir",
                                    color: Color(0x7cdbf1ff),
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                          onChanged: (value) {},
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 500,
                    child: Swiper(
                      itemCount: planets.length,
                      itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                      layout: SwiperLayout.STACK,
                      pagination: SwiperPagination(
                        builder: DotSwiperPaginationBuilder(
                            activeSize: 15, space: 8),
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                    pageBuilder: (context, a, b) => DetailPage(
                                          planetInfo: planets[index],
                                        )));
                          },
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 80,
                                  ),
                                  Card(
                                      elevation: 8,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(32)),
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(32.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 100,
                                            ),
                                            Text(
                                              planets[index].name,
                                              style: TextStyle(
                                                  fontSize: 40,
                                                  fontFamily: "Avenir",
                                                  color: Color(0xff47455f),
                                                  fontWeight: FontWeight.w900),
                                              textAlign: TextAlign.left,
                                            ),
                                            Text(
                                              "Solar System",
                                              style: TextStyle(
                                                  fontSize: 23,
                                                  fontFamily: "Avenir",
                                                  color: primaryTextColor,
                                                  fontWeight: FontWeight.w900),
                                              textAlign: TextAlign.left,
                                            ),
                                            SizedBox(
                                              height: 32,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Know more",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontFamily: "Avenir",
                                                      color: secondaryTextColor,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  textAlign: TextAlign.left,
                                                ),
                                                Icon(
                                                  Icons.arrow_forward,
                                                  color: secondaryTextColor,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Image(
                                  image: NetworkImage(planets[index].iconImage),
                                  width: 200,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: navigationColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

Color primaryTextColor = Color(0xff414c68);
Color secondaryTextColor = Color(0xffe4979e);
Color titleTextColor = Colors.white;
Color contentTextColor = Color(0xff848686);
Color navigationColor = Color(0xff675185);
Color gradientStartColor = Color(0xff0850ac);
Color gradientEndColor = Color(0xff935489);

class PlanetInfo {
  final int position;
  final String name;
  final String iconImage;
  final String description;
  final List<String> images;

  PlanetInfo(this.position,
      {this.name, this.iconImage, this.description, this.images});
}

List<PlanetInfo> planets = [
  PlanetInfo(1,
      name: "Mercury",
      iconImage:
          "https://i1.wp.com/novocom.top/image/Y2xpcl4LmNGFydGl4LmNvbQ==/wp-content/uploads/2016/10/Planets-clipart-the-cliparts.png",
      description:
          "The smallest planet in our solar system has a big presence in our collective imagination. Scores of science fiction writers have been inspired by Mercury, including Isaac Asimov, C. S. Lewis, Ray Bradbury, Arthur C. Clarke, and H. P. Lovecraft. Television and film writers, too, have found the planet an ideal location for storytelling. In the animated television show Invader Zim, Mercury is turned into a prototype giant spaceship by the extinct Martians. And in the 2007 film Sunshine, the Icarus II spacecraft goes into orbit around Mercury to rendezvous with the Icarus I.",
      images: [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVBFS-Jw5OHyHOAlmkjrAHDNsP11lBB3eLLw&usqp=CAU",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5-easC601nGgZ11607ARy6buOQL52Yq--vw&usqp=CAU",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgfiE6O1to5lnsk45KeVGbUq3OIiYQf8_jig&usqp=CAU"
      ]),
  PlanetInfo(2,
      name: "Jupiter",
      iconImage:
          "https://i1.wp.com/novocom.top/image/Y2xpcl4LmNGFydGl4LmNvbQ==/wp-content/uploads/2016/10/Planets-clipart-the-cliparts.png",
      description:
          "The biggest planet in our solar system, Jupiter also has a large presence in pop culture, including many movies, TV shows, video games, and comics. Jupiter was a notable destination in the Wachowski siblings’ science fiction spectacle Jupiter Ascending, while various Jovian moons provide settings for Cloud Atlas, Futurama, Power Rangers, and Halo, among many others. In the movie Men in Black when Agent J – played by Will Smith – mentions he thought one of his childhood teachers was from Venus, Agent K – played by Tommy Lee Jones – replies that she is actually from one of Jupiter’s moons.",
      images: [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtckOcu7FGpy4B6WVhVJp5HlWptLdnsZBp5w&usqp=CAU",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIAxMwy8gQ5oA4bzx3lHn4saSQiIbqcdkXaQ&usqp=CAU",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWNwtHchwaEfeORI3XN9fUbQeYRTW_-3jDSA&usqp=CAU"
      ]),
];

class DetailPage extends StatelessWidget {
  final PlanetInfo planetInfo;

  DetailPage({this.planetInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: planetInfo.position,
        child: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 250,
                          ),
                          Text(
                            planetInfo.name,
                            style: TextStyle(
                                fontSize: 34,
                                fontFamily: "Avenir",
                                color: primaryTextColor,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "Solar System",
                            style: TextStyle(
                                fontSize: 24,
                                fontFamily: "Avenir",
                                color: primaryTextColor,
                                fontWeight: FontWeight.w300),
                            textAlign: TextAlign.left,
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            planetInfo.description ?? '',
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Avenir",
                                color: contentTextColor,
                                fontWeight: FontWeight.w300),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            color: Colors.black38,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        "Gallery",
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: "Avenir",
                            color: primaryTextColor,
                            fontWeight: FontWeight.w300),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: planetInfo.images.length,
                          itemBuilder: (context, index) {
                            return Card(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Image(
                                  image: NetworkImage(planetInfo.images[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                right: -50,
                child: Image(
                  image: NetworkImage(planetInfo.iconImage),
                  width: 250,
                ),
              ),
              Positioned(
                top: 30,
                left: 30,
                child: Text(
                  planetInfo.position.toString(),
                  style: TextStyle(
                      fontSize: 200,
                      fontFamily: "Avenir",
                      color: primaryTextColor.withOpacity(0.08),
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.left,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
