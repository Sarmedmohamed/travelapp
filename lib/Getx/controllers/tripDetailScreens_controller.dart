
import 'package:floor/floor.dart';
import 'package:get/get.dart';
import 'package:travel_app/DataBase/Trivel_Dao.dart';
import 'package:travel_app/DataBase/database.dart';

class TripDetailScreensController extends GetxController{

  late Trivel_Dao trivel_dao;

  @override
  void onInit() {
    // TODO: implement onInit
    creatOrOpeDatabaese();
    super.onInit();
  }

  creatOrOpeDatabaese () async {
 final database = await $FloorAppDataBase.databaseBuilder('app_database.db').build();
 trivel_dao = database.trivel_Dao;
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

}