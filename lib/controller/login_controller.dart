import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:abctechapp/model/login.dart';
import 'package:abctechapp/model/user.dart';
import 'package:abctechapp/service/login_service.dart';

class LoginController extends GetxController with StateMixin<User> {
  late final LoginService _service;
  final input = TextEditingController();
  final password = TextEditingController();

  LoginController(this._service);

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.success());
  }

  void login() async {
    change(null, status: RxStatus.loading());
    try {
      User user = await _service.signIn(Login(input: input.text, password: password.text));
      change(user, status: RxStatus.success());
      Get.toNamed('/order');
    } catch (error) {
      change(null, status: RxStatus.error(error.toString()));
    }
  }
}
