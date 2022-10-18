import 'package:abctechapp/model/user.dart';

class LoggedUser {
  static User? _user;
  static String? _token;

  static void setUser(User user) {
    _user = user;
  }

  static String? setToken(String token) {
    _token = token;
  }

  static String? getToken() => _token;

  static User? get() => _user;
}