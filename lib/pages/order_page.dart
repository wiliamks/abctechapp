import 'package:abctechapp/controller/order_controller.dart';
import 'package:abctechapp/model/assist.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OrderPage extends GetView<OrderController> {
  const OrderPage({Key? key}) : super(key: key);

  Widget renderAssists(List<Assist> assists) => ListView.builder(
      shrinkWrap: true,
      itemCount: assists.length,
      itemBuilder: (context, index) =>
          ListTile(title: Text(assists[index].name)));

  Widget buildForm(BuildContext context) => SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(children: const [
                Expanded(
                    child: Text(
                  'Preencha o fomulário de ordem de serviço',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ))
              ]),
              Row(children: [
                const Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(top: 25, bottom: 25),
                        child: Text(
                          'Selecione os serviços a serem prestados',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold),
                        ))),
                Ink(
                    decoration: const ShapeDecoration(
                        shape: CircleBorder(), color: Colors.blueAccent),
                    width: 40,
                    height: 40,
                    child: IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: () => controller.editAssists()))
              ]),
              Obx(
                () => renderAssists(controller.selectedAssists),
              ),
              Row(children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () => controller.finishStartOrder(),
                        child: Obx(
                          () {
                            if (controller.screenState.value ==
                                OrderState.creating) {
                              return const Text('Iniciar');
                            } else {
                              return const Text('Finalizar');
                            }
                          },
                        )))
              ]),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ordem'),
        ),
        body: Container(
            constraints: const BoxConstraints.expand(),
            padding: const EdgeInsets.all(10.0),
            child: controller.obx((state) => buildForm(context),
                onLoading: const Center(child: CircularProgressIndicator()))));
  }
}
