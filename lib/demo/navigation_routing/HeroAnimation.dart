import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Transition Demo',
			home: HomeScreen(),
		);
	}
}

class HomeScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Main Screen'),
			),
			body: GestureDetector(
				child: Hero(
					tag: 'imageHero',
					child: Image.network('https://picsum.photos/250?image=9'),
				),
				onTap: () {
					Navigator.push(context, MaterialPageRoute(builder: (_) { return DetailScreen(); } ));
				},
			),
		);
	}
}

class DetailScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Main Screen'),
			),
			body: GestureDetector(
				child: Hero(
					tag: 'imageHero',
					child: Image.network('https://picsum.photos/250?image=9'),
				),
				onTap: () {
					Navigator.pop(context);
				}
			),
		);
	}
}
