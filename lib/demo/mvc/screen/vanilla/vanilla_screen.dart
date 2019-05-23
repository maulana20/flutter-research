import 'package:flutter/material.dart';
import 'package:flutter_research/data/repository.dart';
import 'package:flutter_research/data/user.dart';

class VanillaScreen extends StatefulWidget {
	final Repository _repository;
	
	VanillaScreen(this._repository);
	
	@override
	State<StatefulWidget> createState() => _VanillaScreenState();
}

class _VanillaScreenState extends State<VanillaScreen> {
	bool _isLoading = false;
	User _user;
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Vanilla'),
			),
			body: SafeArea(
				child: _isLoading ? _buildLoading() : _buildBody(),
			),
		);
	}
	
	Widget _buildLoading() {
		return Center(
			child: CircularProgressIndicator(),
		);
	}
	
	Widget _buildBody() {
		if (_user != null) {
			return _buildContent();
		} else {
			return _buildInit();
		}
	}
	
	Widget _buildContent() {
		return Center(
			child: Text('Hello ${_user.name} ${_user.surname}'),
		);
	}
	
	Widget _buildInit() {
		return Center(
			child: RaisedButton(
				child: Text('Load user data'),
				onPressed: () {
					setState(() {
						_isLoading = true;
					});
					widget._repository.getUser().then((user) {
						setState(() {
							_isLoading = false;
							_user = user;
						});
					});
				},
			),
		);
	}
}
