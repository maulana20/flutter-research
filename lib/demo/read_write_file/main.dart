import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_research/data/counter_storage.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(
	MaterialApp(
		title: 'Reading and Writing Files',
		home: FlutterDemo(storage: CounterStorage()),
	),
);

class FlutterDemo extends StatefulWidget {
	final CounterStorage storage;
	
	FlutterDemo({Key key,@required this.storage}): super(key: key);
	
	@override
	_FlutterDemoState createState() => _FlutterDemoState();
}

class _FlutterDemoState extends State<FlutterDemo> {
	int _counter;
	
	@override
	void initState() {
		super.initState();
		widget.storage.readCounter().then((int value) {
			setState(() {
				_counter = value;
			});
		});
	}
	
	Future<File> _incrementCounter() {
		setState(() {
			_counter++;
		});
		
		return widget.storage.writeCounter(_counter);
	}
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar( title: Text('Reading and Writing Files')),
			body: Center(
				child: Text('Button tapped $_counter time${_counter == 1 ? '' : 's'}.'),
			),
			floatingActionButton: FloatingActionButton(
				onPressed: _incrementCounter,
				tooltip: 'Increment',
				child: Icon(Icons.add),
			),
		);
	}
}
