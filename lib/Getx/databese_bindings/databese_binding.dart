import 'package:get/get.dart';
import 'package:travel_app/Getx/controllers/database_controller.dart';

class DatabeseBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<DatabaseConrtoller>(() => DatabaseConrtoller());
  }

}