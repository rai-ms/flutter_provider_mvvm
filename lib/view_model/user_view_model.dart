import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel extends ChangeNotifier
{

  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('token', user.token.toString());
    notifyListeners();
    return true;
  }
  Future<UserModel> getUser() async
  {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String ? token = preferences.getString('token');
    return UserModel(
      token: token.toString()
    );
  }

  void remove() async
  {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }

}