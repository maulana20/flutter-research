import 'package:flutter/material.dart';
import 'package:flutter_research/data/repository.dart';
import 'package:flutter_research/data/user.dart';
import 'package:flutter_research/screen/bloc/user_bloc.dart';

class UserBlocScreen extends StatefulWidget {
	final Repository _repository;
	
	UserBlocScreen(this._repository);
	
	@override
	State<StatefulWidget> createState() => _UserBlocScreenState();
}

class _UserBlocScreenState extends State<UserBlocScreen> {
	UserBloc _userBloc;
	
	@override
	void initState() {
		_userBloc = UserBloc(widget._repository);
		super.initState();
	}
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Bloc'),
			),
			body: SafeArea(
				child: StreamBuilder<UserState>(
					stream: _userBloc.user,
					initialData: UserInitState(),
					builder: (context, snapshot) {
						if (snapshot.data is UserInitState) {
							return _buildInit();
						}
						if (snapshot.data is UserDataState) {
							UserDataState state = snapshot.data;
							return _buildContent(state.user);
						}
						if (snapshot.data is UserLoadingState) {
							return _buildLoading();
						}
					}
				),
			),
		);
	}
	
	Widget _buildLoading() {
		return Center(
			child: CircularProgressIndicator(),
		);
	}
	
	Widget _buildInit() {
		return Center(
			child: RaisedButton(
				child: Text('Load user data'),
				onPressed: () {
					_userBloc.loadUserData();
				},
			),
		);
	}
	
	Widget _buildContent(User user) {
		return Center(
			child: Text('Hello ${user.name} ${user.surname}'),
		);
	}
	
	@override
	void dispose() {
		_userBloc.dispose();
		super.dispose();
	}
}
