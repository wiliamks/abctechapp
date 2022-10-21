import 'package:abctechapp/model/login.dart';
import 'package:abctechapp/model/user.dart';

abstract class LoginService {
  Future<User> signIn(Login body);
}