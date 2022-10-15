import 'package:abctechapp/model/assist.dart';
import 'package:abctechapp/service/assist_service.dart';
import 'package:get/get.dart';

class AssistController extends GetxController with StateMixin<List<Assist>> {
  late AssistService _service;
  List<Assist> allAssists = [];
  List<Assist> selectedAssist = [];

  @override
  void onInit() {
    super.onInit();
    _service = Get.find<AssistService>();
    getAssistList();
  }

  @override
  void onReady() {
    super.onReady();
    selectedAssist = Get.arguments;
  }

  void getAssistList() {
    change([], status: RxStatus.loading());
    _service.getAssists().then((value) {
      allAssists = value;
      change(value, status: RxStatus.success());
    }).onError((error, stackTrace) {
      change([], status: RxStatus.error(error.toString()));
    });
  }

  void finishSelectAssist() {
    Get.back();
  }

  void selectAssist(int index) {
    Assist assist = allAssists[index];
    int indexFound =
        selectedAssist.indexWhere((element) => element.id == assist.id);
    if (indexFound == -1) {
      selectedAssist.add(assist);
    } else {
      selectedAssist.removeAt(indexFound);
    }
    change(allAssists, status: RxStatus.success());
  }

  bool isSelected(int index) {
    Assist assistance = allAssists[index];
    int indexFound =
        selectedAssist.indexWhere((element) => element.id == assistance.id);
    if (indexFound >= 0) {
      return true;
    }
    return false;
  }
}
