import 'package:flutter/cupertino.dart';
import 'package:instagram_flutter/models/user_mode.dart';
import 'package:instagram_flutter/resource/auth_methods.dart';

class UserProvider with ChangeNotifier {
  User? _user;

  User get getUser => _user!;

  Future<void> refreshUser() async {
    User user = await AuthMethods().getUserDetails();
    _user = user;
    notifyListeners();
  }
}
