import 'package:flutter/material.dart';
import 'package:flutter_future_jobs/models/user_model.dart';

class UserProvider with ChangeNotifier {
  UserModel _userModel;

  UserModel get user => _userModel;

  set user(UserModel userModel) {
    this._userModel = userModel;
    notifyListeners();
  }
}
