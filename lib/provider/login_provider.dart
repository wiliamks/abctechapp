import 'package:abctechapp/constants.dart';
import 'package:abctechapp/model/login.dart';
import 'package:get/get_connect.dart';

class LoginProvider extends GetConnect {
  Future<Response> signin(Login body) => post('${Constants.url}/auth/signin', body.toMap());
}
