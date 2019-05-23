import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_research/data/repository.dart';
import 'package:flutter_research/screen/scoped_model/user_model.dart';

class UserModelScreen extends StatefulWidget {
	final Repository _repository;
	
	UserModelScreen(this._repository);
	
	@override
	State<StatefulWidget> createState() => _UserModelScreenState();
}

class _UserModelScreenState extends State<UserModelScreen> {
	UserModel _userModel;
	
	@override
	void initState() {
		_userModel = UserModel(widget._repository);
		super.initState();
	}
	
	@override
	Widget build(BuildContext context) {
		return ScopedModel(
			model: _userModel,
			child: Scaffold(
				appBar: AppBar(
					title: Text('Scoped Model'),
				),
				body: SafeArea(
					child: ScopedModelDescendant<UserModel>(
						builder: (context, child, model) {
							if (model.isLoading) {
								return _buildLoading();
							} else {
								if (model.user != null) {
									return _buildContent(model);
								} else {
									return _buildInit(model);
								}
							}
						}
					),
				),
			),
		);
	}
	
	Widget _buildLoading() {
		return Center(
			child: CircularProgressIndicator(),
		);
	}
	
	Widget _buildContent(UserModel userModel) {
		return Center(
			child: Text('Hello ${userModel.user.name} ${userModel.user.surname}'),
		);
	}
	
	Widget _buildInit(UserModel userModel) {
		return Center(
			child: RaisedButton(
				child: Text('Load user data'),
				onPressed: () {
					userModel.loadUserData();
				},
			),
		);
	}
}
