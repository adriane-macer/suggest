import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suggestion_app/bindings/veg_binder.dart';
import 'package:suggestion_app/controllers/disease_conrtoller.dart';
import 'package:suggestion_app/models/veg.dart';
import 'package:suggestion_app/presentations/veg_screen.dart';

class DiseaseScreen extends GetView<DiseaseController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.disease?.name ?? ""),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            if (controller.disease != null)
              Image.asset(controller.disease!.photo),
            const SizedBox(
              height: 20,
            ),
            Text(
              controller.disease?.name ?? "",
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 10),
            Text(controller.disease?.description ?? ""),
            const SizedBox(height: 20.0),
            Text(
              "Suggested Food",
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(height: 10),
            if (controller.disease != null)
              ...controller.disease!.foods!.map((value) {
                // how to show a card that has a the details of the veg which will open to the Veg Screen of that veg?  link that

                return _foodWidget(context, vegName: value);
              }),
          ],
        ),
      ),
    );
  }

  Widget _foodWidget(BuildContext context, {required String vegName}) {
    final Veg? veg = controller.getVeg(vegName: vegName);

    final currentRoute = Get.routing.current;
    debugPrint("DiseaseScreen._foodWidget: currentRoute: $currentRoute");

    final bool isDiseaseRoot = currentRoute.startsWith("/disease");
    final Color? textColor = isDiseaseRoot ? Colors.blue : null;

    if (veg != null) {
      return InkWell(
        onTap: () {
          Get.to(() => VegScreen(), arguments: veg, binding: VegBinding());
        },
        child: Text(
          veg.name,
          style: TextStyle(color: textColor),
        ),
      );
    }
    return SizedBox();
  }
}
