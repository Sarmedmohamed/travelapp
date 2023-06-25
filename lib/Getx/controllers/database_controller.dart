import 'package:get/get.dart';
import 'package:travel_app/DataBase/Trivel_Dao.dart';
import 'package:travel_app/DataBase/database.dart';

import '../../DataBase/Trivel_Info.dart';

class DatabaseConrtoller extends GetxController{

  late AppDataBase dataBase;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    createDataBase();
  }


  void createDataBase() async {

    dataBase = await $FloorAppDataBase
        .databaseBuilder('app_database.db')
        .build();

  }

  void addToFav(TrivelInfo trivelInfo){
    dataBase.trivel_Dao.insertTrivelInfo(trivelInfo);
  }


  void deleteFromFv(TrivelInfo trivelInfo){
    dataBase.trivel_Dao.deletinfo(trivelInfo);
  }


  Future<List<TrivelInfo>> getFutureProducts() async {
    return dataBase.trivel_Dao.findAllTrivelInfo();

  }
}