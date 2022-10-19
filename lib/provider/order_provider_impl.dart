import 'dart:io';

import 'package:abctechapp/constants.dart';
import 'package:abctechapp/logged_user.dart';
import 'package:abctechapp/model/order.dart';
import 'package:abctechapp/provider/order_provider.dart';
import 'package:get/get.dart';

class OrderProviderImpl extends GetConnect implements OrderProvider {
  @override
  Future<Response> portOrder(Order order) => post(
      '${Constants.url}/api/order', order.toMap(),
      headers: {HttpHeaders.authorizationHeader: LoggedUser.getToken() ?? ''});
}
