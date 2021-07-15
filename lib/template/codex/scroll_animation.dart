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

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final CategoriesScroller categoriesScroller = CategoriesScroller();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsData = [];

  void getPostsData() {
    List<dynamic> responseList = FOOD_DATA;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(Container(
        height: 150,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4, // Shadow position
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post["name"],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    post["brand"],
                    style: TextStyle(fontSize: 12, color: Colors.grey[400]),
                  ),
                  Text(
                    post["price"].toString(),
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Image(
                image: NetworkImage(post["image"]),
                fit: BoxFit.cover,
                width: 100,
              )
            ],
          ),
        ),
      ));
    });
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPostsData();
    controller.addListener(() {
      double value = controller.offset / 199;
      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        height: size.height,
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Loyality Cards",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w700),
                ),
                Text(
                  "Menu",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(height: 10),
            AnimatedOpacity(
              duration: Duration(microseconds: 200),
              opacity: closeTopContainer ? 0 : 1,
              child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  alignment: Alignment.topCenter,
                  width: size.width,
                  height: closeTopContainer ? 0 : size.height * 0.30,
                  child: categoriesScroller),
            ),
            Expanded(
              child: ListView.builder(
                controller: controller,
                physics: BouncingScrollPhysics(),
                itemCount: itemsData.length,
                itemBuilder: (context, index) {
                  double scale = 1.0;
                  if (topContainer > 0.5) {
                    scale = index + 0.5 - topContainer;
                    if (scale < 0) {
                      scale = 0;
                    } else if (scale > 1) {
                      scale = 1;
                    }
                  }
                  return Transform(
                    transform: Matrix4.identity()..scale(scale, scale),
                    alignment: Alignment.bottomCenter,
                    child: Align(
                        heightFactor: 0.65,
                        alignment: Alignment.topCenter,
                        child: itemsData[index]),
                  );
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class CategoriesScroller extends StatelessWidget {
  CategoriesScroller();

  @override
  Widget build(BuildContext context) {
    final double categoryHeight = MediaQuery.of(context).size.height * 0.3;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 150,
                height: categoryHeight,
                margin: EdgeInsets.only(
                  right: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.orange.shade400,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Most\nFavorites",
                          style: TextStyle(fontSize: 25, color: Colors.white)),
                      SizedBox(
                        height: 10,
                      ),
                      Text("20 Items",
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                    ],
                  ),
                ),
              ),
              Container(
                width: 150,
                height: categoryHeight,
                margin: EdgeInsets.only(
                  right: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue.shade400,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Newest",
                          style: TextStyle(fontSize: 25, color: Colors.white)),
                      SizedBox(
                        height: 10,
                      ),
                      Text("20 Items",
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                    ],
                  ),
                ),
              ),
              Container(
                width: 150,
                height: categoryHeight,
                margin: EdgeInsets.only(
                  right: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue.shade400,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Support Savely",
                          style: TextStyle(fontSize: 25, color: Colors.white)),
                      SizedBox(
                        height: 10,
                      ),
                      Text("20 Items",
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

const FOOD_DATA = [
  {
    "name": "Burger",
    "brand": "Hawkers",
    "price": 2.99,
    "image":
        "https://freepngimg.com/thumb/burger/3-2-burger-free-png-image-thumb.png"
  },
  {
    "name": "Cheese Dip",
    "brand": "Hawkers",
    "price": 4.99,
    "image":
        "https://dom-repo-olo-prod.oss-ap-southeast-5.aliyuncs.com/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/d/i/dippingcheesesauce3.png"
  },
  {
    "name": "Cola",
    "brand": "McDonald",
    "price": 1.49,
    "image":
        "https://e7.pngegg.com/pngimages/685/904/png-clipart-fizzy-drinks-coca-cola-diet-coke-rc-cola-coca-cola-food-cola-thumbnail.png"
  },
  {
    "name": "Fries",
    "brand": "McDonald",
    "price": 2.99,
    "image":
        "https://www.freepnglogos.com/uploads/fries-png/premium-french-fries-photos-7.png"
  },
  {
    "name": "Nugget",
    "brand": "McDonald",
    "price": 4.99,
    "image": "https://www.cleanpng.com/static/img/default.png"
  },
  {
    "name": "Sundae Ice Cream",
    "brand": "McDonald",
    "price": 1.99,
    "image":
        "https://nos.jkt-1.neo.id/mcdonalds/foods/August2019/Cmkum3XzOL5YOnBgDMTQ.png"
  }
];
