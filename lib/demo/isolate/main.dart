import 'package:flutter/material.dart';
import 'package:flutter_research/data/repository.dart';
import 'package:flutter_research/data/photo.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		final title = 'Isolate Demo';
		
		return MaterialApp(
			title: title,
			home: MyHomePage(title: title),
		);
	}
}

class MyHomePage extends StatelessWidget {
	final String title;
	
	MyHomePage({Key key, this.title}): super(key: key);
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar( title: Text(title)),
			body: FutureBuilder<List<Photo>>(
				future: fetchPhotos(http.Client()),
				builder: (context, snapshot) {
					if (snapshot.hasError) print(snapshot.error);
					
					return snapshot.hasData ? PhotosList(photos: snapshot.data) : Center(child: CircularProgressIndicator());
				},
			),
		);
	}
}

class PhotosList extends StatelessWidget {
	final List<Photo> photos;
	
	PhotosList({Key key, this.photos}): super(key: key);
	
	@override
	Widget build(BuildContext context) {
		return GridView.builder(
			gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 2),
			itemCount: photos.length,
			itemBuilder: (context, index) {
				return Image.network(photos[index].thumbnailUrl);
			}
		);
	}
}
