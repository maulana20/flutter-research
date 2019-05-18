import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: '',
			home: DefaultTabController(
				length: 3,
				child: Scaffold(
					appBar: AppBar(
						title: Text('Tabs Demo'),
						bottom: TabBar(
							tabs: [
								Tab(icon: Icon(Icons.directions_car)),
								Tab(icon: Icon(Icons.directions_transit)),
								Tab(icon: Icon(Icons.directions_bike)),
							],
						),
					),
					body: TabBarView(
						children: [
							Icon(Icons.directions_car),
							Icon(Icons.directions_transit),
							Icon(Icons.directions_bike),
						],
					),
				),
			),
		);
	}
}
