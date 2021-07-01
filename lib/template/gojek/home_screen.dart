import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 130,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xFF138880), Color(0xFF1C9E82)]),
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        height: 100,
                        color: Colors.white),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(30),
                        child: Center(
                          child: Text('Good Afternoon'),
                        ),
                      ),
                      Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "OVO Balance",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Spacer(),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Text("RP",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 10)),
                                  ),
                                  Text(
                                    "0",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                  SizedBox(width: 10),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 5),
                                      color: Colors.grey[300],
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 15,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Divider(
                                thickness: 1,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                          width: 50,
                                          height: 50,
                                          child: Image(
                                              image: NetworkImage(
                                                  "https://raw.githubusercontent.com/hamamulfz/grab_clone_flutter/master/assets/images/pay/pay.png"),
                                              fit: BoxFit.contain)),
                                      SizedBox(height: 5),
                                      Text("Pay",
                                          style: TextStyle(fontSize: 15)),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                          width: 50,
                                          height: 50,
                                          child: Image(
                                              image: NetworkImage(
                                                  "https://raw.githubusercontent.com/hamamulfz/grab_clone_flutter/master/assets/images/pay/topu.png"),
                                              fit: BoxFit.contain)),
                                      SizedBox(height: 5),
                                      Text("Top Up",
                                          style: TextStyle(fontSize: 15)),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                          width: 50,
                                          height: 50,
                                          child: Image(
                                              image: NetworkImage(
                                                  "https://raw.githubusercontent.com/hamamulfz/grab_clone_flutter/master/assets/images/pay/reward.png"),
                                              fit: BoxFit.contain)),
                                      SizedBox(height: 5),
                                      Text("Reward",
                                          style: TextStyle(fontSize: 15)),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Container(
                              width: 50,
                              height: 50,
                              child: Image(
                                  image: NetworkImage(
                                      "https://raw.githubusercontent.com/hamamulfz/grab_clone_flutter/master/assets/images/feature/car.png"),
                                  fit: BoxFit.contain)),
                          SizedBox(height: 5),
                          Text("Car", style: TextStyle(fontSize: 15)),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                              width: 50,
                              height: 50,
                              child: Image(
                                  image: NetworkImage(
                                      "https://raw.githubusercontent.com/hamamulfz/grab_clone_flutter/master/assets/images/feature/bike.png"),
                                  fit: BoxFit.contain)),
                          SizedBox(height: 5),
                          Text("Bike", style: TextStyle(fontSize: 15)),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                              width: 50,
                              height: 50,
                              child: Image(
                                  image: NetworkImage(
                                      "https://raw.githubusercontent.com/hamamulfz/grab_clone_flutter/master/assets/images/feature/food.png"),
                                  fit: BoxFit.contain)),
                          SizedBox(height: 5),
                          Text("Food", style: TextStyle(fontSize: 15)),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                              width: 50,
                              height: 50,
                              child: Image(
                                  image: NetworkImage(
                                      "https://raw.githubusercontent.com/hamamulfz/grab_clone_flutter/master/assets/images/feature/delivery.png"),
                                  fit: BoxFit.contain)),
                          SizedBox(height: 5),
                          Text("Delivery", style: TextStyle(fontSize: 15)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Container(
                              width: 50,
                              height: 50,
                              child: Image(
                                  image: NetworkImage(
                                      "https://raw.githubusercontent.com/hamamulfz/grab_clone_flutter/master/assets/images/feature/rent.png"),
                                  fit: BoxFit.contain)),
                          SizedBox(height: 5),
                          Text("Rent", style: TextStyle(fontSize: 15)),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                              width: 50,
                              height: 50,
                              child: Image(
                                  image: NetworkImage(
                                      "https://raw.githubusercontent.com/hamamulfz/grab_clone_flutter/master/assets/images/feature/giftcard.png"),
                                  fit: BoxFit.contain)),
                          SizedBox(height: 5),
                          Text("Gift Card", style: TextStyle(fontSize: 15)),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                              width: 50,
                              height: 50,
                              child: Image(
                                  image: NetworkImage(
                                      "https://raw.githubusercontent.com/hamamulfz/grab_clone_flutter/master/assets/images/feature/subscription.png"),
                                  fit: BoxFit.contain)),
                          SizedBox(height: 5),
                          Text("Subcription", style: TextStyle(fontSize: 15)),
                        ],
                      ),
                      Container(
                        child: Column(
                          children: [
                            SizedBox(height: 5),
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(30)),
                              child: Icon(
                                Icons.more_horiz,
                                size: 30,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text("More", style: TextStyle(fontSize: 15)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 8,
              color: Colors.grey[300],
            ),
            GridView.count(
              padding: EdgeInsets.all(5),
              childAspectRatio: .75,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              children: List.generate(10, (index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Material(
                    borderRadius: BorderRadiusDirectional.circular(15),
                    elevation: 5,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image.network(
                              "https://image.freepik.com/free-vector/square-food-banner-with-photo_23-2148118766.jpg",
                              fit: BoxFit.contain
                            ),
                          ),
                          SizedBox(height: 5,),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Container(
                              child: Text("Article Title Here", style: TextStyle(fontSize: 10)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  size: 15,
                                ),
                                SizedBox(width: 5,),
                                Text("1 min read", style: TextStyle(fontSize: 10)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
