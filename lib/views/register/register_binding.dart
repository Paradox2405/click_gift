import 'package:get/get.dart';
import 'register_controller.dart';


class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>RegisterController());
  }
}