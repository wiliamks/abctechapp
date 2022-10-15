import 'package:abctechapp/model/order.dart';
import 'package:get/get.dart';

abstract class OrderProvider {
  Future<Response> portOrder(Order order);
}
