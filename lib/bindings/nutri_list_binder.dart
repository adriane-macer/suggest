import 'package:get/get.dart';
import 'package:suggest/controllers/nutri_list_controller.dart';


class NutriListBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => NutriListController());
  }
}
