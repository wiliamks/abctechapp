import 'dart:developer';
import 'dart:io';

import 'package:abctechapp/constants.dart';
import 'package:abctechapp/logged_user.dart';
import 'package:abctechapp/provider/assist_provider.dart';
import 'package:get/get_connect.dart';

class AssistProvider extends GetConnect implements AssistProviderInterface {
  @override
  Future<Response> getAssists() {
    String? token = LoggedUser.getToken();
    log('Token: $token');
    return get('${Constants.url}/api/assistance', headers: {
      HttpHeaders.authorizationHeader: token ?? ''
    });
  }
}
