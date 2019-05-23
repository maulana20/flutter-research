import 'package:flutter/material.dart';
import 'package:flutter_research/data/repository.dart';
import 'package:flutter_research/screen/vanilla/vanilla_screen.dart';
import 'package:flutter_research/screen/bloc/user_bloc_screen.dart';
import 'package:flutter_research/screen/scoped_model/user_model_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Architecture demo',
			home: HomePage(Repository()),
		);
	}
}

class HomePage extends StatelessWidget {
	final Repository _repository;
	
	HomePage(this._repository);
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar( title: const Text('Choose demo')),
			body: SafeArea(
				child: Padding(
					padding: const EdgeInsets.symmetric(horizontal: 16.00),
					child: Column(
						mainAxisAlignment: MainAxisAlignment.center,
						crossAxisAlignment: CrossAxisAlignment.stretch,
						children: <Widget> [
							RaisedButton(
								child: const Text('Vanilla'),
								onPressed: () {
									openVanilla(context);
								},
							),
							RaisedButton(
								child: const Text('Bloc'),
								onPressed: () {
									openUserBloc(context);
								},
							),
							RaisedButton(
								child: const Text('Scoped Model'),
								onPressed: () {
									openUserModel(context);
								}
							),
						],
					),
				),
			),
		);
	}
	
	void openVanilla(BuildContext context) {
		Navigator.push(context, MaterialPageRoute(builder: (context) => VanillaScreen(_repository)));
	}
	
	void openUserBloc(BuildContext context) {
		Navigator.push(context, MaterialPageRoute(builder: (context) => UserBlocScreen(_repository)));
	}
	
	void openUserModel(BuildContext context) {
		Navigator.push(context, MaterialPageRoute(builder: (context) => UserModelScreen(_repository)));
	}
}
