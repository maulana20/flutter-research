import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
	MyApp({Key key}): super(key: key);
	
	@override
	Widget build(BuildContext context) {
		final title = 'Floating App Bar';
		
		return MaterialApp(
			title: title,
			home: Scaffold(
				body: CustomScrollView(
					slivers: <Widget> [
						SliverAppBar(
							title: Text(title),
							floating: true,
							flexibleSpace: Placeholder(),
							expandedHeight: 200,
						),
						SliverList(
							delegate: SliverChildBuilderDelegate(
								(context, index) => ListTile( title: Text('Item #$index') ),
								childCount: 1000,
							),
						),
					],
				),
			),
		);
	}
}
