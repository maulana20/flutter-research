import 'dart:async';
import 'package:flutter_research/data/user.dart';

class Repository {
	Future<User> getUser() async {
		await Future.delayed(Duration(seconds: 2));
		return User(name: 'Jhon', surname: 'Smith');
	}
}
