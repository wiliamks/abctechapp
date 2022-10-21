import 'package:abctechapp/constants.dart';
import 'package:abctechapp/model/error_response.dart';
import 'package:abctechapp/model/order.dart';
import 'package:abctechapp/model/order_created.dart';
import 'package:abctechapp/provider/order_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class OrderService extends GetxService {
  final OrderProvider _provider;

  OrderService(this._provider);

  Future<OrderCreated> createOrder(Order order) async {
    Response response = await _provider.portOrder(order);
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
      return Future.sync(() => OrderCreated(success: true, message: ''));
    } catch (e) {
      e.printError();
      return Future.error(ErrorDescription('Erro não esperado'));
    }
  }
}
