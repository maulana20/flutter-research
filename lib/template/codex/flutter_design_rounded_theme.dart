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

class MainPage extends StatelessWidget {
  final List<RecommendedJobModel> recommendedJobs = [
    RecommendedJobModel(
        "Flutter Mobile Developer",
        "CodeX, UAE",
        "https://www.freeiconspng.com/uploads/twitter-icon-download-18.png",
        lightYellowColor),
    RecommendedJobModel(
        "Adobe XD Designer",
        "CodeX, UAE",
        "https://www.freeiconspng.com/uploads/twitter-icon-png-13-1.png",
        lightGreenColor),
    RecommendedJobModel(
        "Mobile Developer",
        "CodeX, UAE",
        "https://www.freeiconspng.com/uploads/-van-de-laatste-nieuwsberichten-volg-ons-via-twitter-en-facebook-4.png",
        lightPurpleColor),
  ];

  final List<RecentSearchInfo> recentSearhTerms = [
    RecentSearchInfo("flutter, USA", lightYellowColor),
    RecentSearchInfo("flutter, Developer, India", lightPurpleColor),
    RecentSearchInfo("Adobe XD, UAE", lightGreenColor),
    RecentSearchInfo("UX Design, UK", lightYellowColor),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {},
                    ),
                    Stack(
                      children: [
                        IconButton(
                          icon: Icon(Icons.notifications_none),
                          onPressed: () {},
                        ),
                        Positioned(
                          right: 14,
                          top: 10,
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.red),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Jobs\nDasboard",
                            style: TextStyle(
                              fontSize: 28,
                              fontFamily: "Avenir",
                              fontWeight: FontWeight.w900,
                              color: Color(0xff000000),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: LinearProgressIndicator(
                              value: 0.6,
                              backgroundColor: secondColor,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(primaryColor),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Profile Completes",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Avenir",
                              fontWeight: FontWeight.w500,
                              color: Color(0xff8d8d8d),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Lion_d%27Afrique.jpg/550px-Lion_d%27Afrique.jpg"),
                            fit: BoxFit.contain),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 34, vertical: 8),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildInfo("17", "Matching\nJob"),
                    Container(
                      width: 1,
                      height: 50,
                      color: secondColor,
                    ),
                    buildInfo("20", "Employee\nActions"),
                    Container(
                      width: 1,
                      height: 50,
                      color: secondColor,
                    ),
                    buildInfo("26", "Search\nAppreances"),
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Based On Your Profile",
                  style: TextStyle(
                      fontFamily: "Avenir",
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 150,
                padding: EdgeInsets.only(left: 16),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recommendedJobs.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          width: 150,
                          padding: EdgeInsets.all(16),
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: recommendedJobs[index].backgroundColor,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                recommendedJobs[index].jobTitle,
                                softWrap: true,
                                style: TextStyle(
                                    fontFamily: "Avenir",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff434343)),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                recommendedJobs[index].jobLocation,
                                softWrap: true,
                                style: TextStyle(
                                    fontFamily: "Avenir",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff818181)),
                              ),
                            ],
                          ),
                        ),
                        Positioned.fill(
                          top: -3,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(recommendedJobs[index]
                                        .companyImageSource),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Recent Searches",
                  style: TextStyle(
                      fontFamily: "Avenir",
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Wrap(
                  children: List.generate(recentSearhTerms.length, (index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: Chip(
                        label: Text(recentSearhTerms[index].serachTitle),
                        padding: EdgeInsets.all(4),
                        backgroundColor:
                            recentSearhTerms[index].backgroundColor,
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: primaryColor,
                radius: 24,
                child: IconButton(
                  icon: Icon(Icons.home_filled),
                ),
              ),
              IconButton(
                icon: Icon(Icons.person),
              ),
              IconButton(
                icon: Icon(Icons.search),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildInfo(String value, String description) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
                fontFamily: "Avenir",
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: Color(0xffffffff)),
          ),
          Text(
            description,
            style: TextStyle(
                fontFamily: "Avenir",
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xffffffff)),
          ),
        ],
      ),
    );
  }
}

final Color secondColor = Color(0xfff0f0f0);
final Color primaryColor = Color(0xffff7e7e);

final Color lightYellowColor = Color(0xfffff9de);
final Color lightGreenColor = Color(0xffdeffdf);
final Color lightPurpleColor = Color(0xffe8deff);

class RecommendedJobModel {
  String jobTitle;
  String jobLocation;
  String companyImageSource;
  Color backgroundColor;

  RecommendedJobModel(this.jobTitle, this.jobLocation, this.companyImageSource,
      this.backgroundColor);
}

class RecentSearchInfo {
  String serachTitle;
  Color backgroundColor;

  RecentSearchInfo(this.serachTitle, this.backgroundColor);
}
