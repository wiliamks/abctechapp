import 'dart:convert';

import 'package:abctechapp/model/order_location.dart';

class Order {
  List<int> assists = [];
  OrderLocation? start;
  OrderLocation? end;

  Order({required this.assists, required this.start, required this.end});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'assists': assists,
      'start': start?.toMap(),
      'end': end?.toMap()
    };
  }

  String toJson() => json.encode(toMap());
}
