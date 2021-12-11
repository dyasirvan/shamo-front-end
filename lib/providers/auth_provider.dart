
import 'package:flutter/material.dart';
import 'package:shamo/models/user_model.dart';
import 'package:shamo/services/auth_service.dart';

class AuthProvider with ChangeNotifier{
  late UserModel _user;

  UserModel get user => _user;

  set user(UserModel value) {
    _user = value;
    notifyListeners();
  }

  Future<bool> register (
      {String? name, String? email, String? username, String? password}) async{
    try{
      UserModel userTiga = await AuthService().register(name: name, email: email, username: username, password: password);
      _user = userTiga;
      print(user);
      return true;
    }catch(e){
      print(e.toString());
      return false;
    }
  }

  Future<bool> login (
      {String? email, String? password}) async{
    try{
      UserModel userTiga = await AuthService().login(email: email, password: password);
      _user = userTiga;
      print(user);
      return true;
    }catch(e){
      print(e.toString());
      return false;
    }
  }
}