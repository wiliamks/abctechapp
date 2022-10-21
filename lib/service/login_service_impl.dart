import 'package:abctechapp/constants.dart';
import 'package:abctechapp/logged_user.dart';
import 'package:abctechapp/model/error_response.dart';
import 'package:abctechapp/model/login.dart';
import 'package:abctechapp/model/user.dart';
import 'package:abctechapp/provider/login_provider.dart';
import 'package:abctechapp/service/login_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginServiceImpl extends GetxService implements LoginService {
  late final LoginProvider provider;

  LoginServiceImpl({required this.provider});

  @override
  Future<User> signIn(Login body) async {
    Response response = await provider.signin(body);
    if (response.hasError) {
      try {
        ErrorResponse error = ErrorResponse.fromMap(response.body);
        return Future.error(ErrorDescription(error.description != null
            ? error.description!
            : Constants.genericError));
      } catch (e) {
        return Future.error(ErrorDescription(Constants.genericError));
      }
    }

    try {
      User result = User.fromMap(response.body);
      LoggedUser.setUser(result);
      LoggedUser.setToken(result.token);
      return Future.sync(() => result);
    } catch (e) {
      e.printError();
      return Future.error(e.toString());
    }
  }
}
