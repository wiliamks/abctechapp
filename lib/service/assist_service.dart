import 'package:abctechapp/constants.dart';
import 'package:abctechapp/model/assist.dart';
import 'package:abctechapp/model/error_response.dart';
import 'package:abctechapp/provider/assist_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssistService extends GetxService {
  late final AssistProviderInterface assistProvider;

  AssistService({required this.assistProvider});

  Future<List<Assist>> getAssists() async {
    Response response = await assistProvider.getAssists();

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
      List<Assist> listResult =
          response.body.map<Assist>((item) => Assist.fromMap(item)).toList();
      return Future.sync(() => listResult);
    } catch (e) {
      e.printError();
      return Future.error(e.toString());
    }
  }
}
