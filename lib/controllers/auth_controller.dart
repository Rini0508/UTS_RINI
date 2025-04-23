import 'package:flutter/material.dart';

class AuthController with ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  bool login(String username, String password) {
    if (username.isNotEmpty && password.length >= 6) {
      _isLoggedIn = true;
      notifyListeners();
      return true;
    }
    return false;
  }
}
