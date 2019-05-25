import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_research/data/photo.dart';
import 'package:http/http.dart' as http;

Future<List<Photo>> fetchPhotos(http.Client client) async {
	final response = await client.get('https://jsonplaceholder.typicode.com/photos');
	
	return compute(parsePhotos, response.body);
}

List<Photo> parsePhotos(String responseBody) {
	final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
	
	return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}
