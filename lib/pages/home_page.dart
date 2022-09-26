import 'package:abctechapp/controller/assist_controller.dart';
import 'package:abctechapp/model/assist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<AssistController> {
  const HomePage({super.key});

  Widget renderAssist(List<Assist> list) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: ((context, index) =>
            ListTile(title: Text(list[index].name))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de serviços")),
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: const [
                Expanded(
                    child: Text(
                  "Os serviços disponíveis são:",
                  textAlign: TextAlign.center,
                ))
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: TextButton(
                  child: const Text('Recarregar'),
                  onPressed: controller.getAssistList,
                ))
              ],
            ),
            controller.obx((state) => renderAssist(state ?? []),
                onEmpty: const Text('Nenhum'),
                onError: (error) => Text(error.toString())),
          ],
        ),
      ),
    );
  }
}