import 'package:get/get.dart';
import 'package:universities/presentation/views/detail/detail_controller.dart';

class DetailBindings extends Bindings{
  @override
  void dependencies() {
    Get.put<DetailController>(DetailController());
  }
}