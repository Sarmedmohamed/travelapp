import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../DataBase/Trivel_Dao.dart';
import '../DataBase/Trivel_Info.dart';
import '../DataBase/database.dart';
import '../Getx/controllers/database_controller.dart';
import '../models/trip.dart';
import '../widgets/trip_item.dart';

class FavoritesScreen extends StatefulWidget {
 List<Trip> _favoriteTrips;
FavoritesScreen(this._favoriteTrips);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {

  DatabaseConrtoller databaseConrtoller = Get.find<DatabaseConrtoller>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: databaseConrtoller.getFutureProducts(),
        builder: (BuildContext context, AsyncSnapshot<List<TrivelInfo>> snapshot){
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Icon(Icons.delete_forever
                    ),
                  ),
                  key: ValueKey<int>(snapshot.data![index].id!),
                    onDismissed: (DismissDirection direction) async {

                          databaseConrtoller.deleteFromFv(snapshot.data![index]!);
                    },

      child: Card(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
        ),
        elevation: 7,
       margin: EdgeInsets.all(10),
       child: Column(
      children: [
      Stack(
     children: [
     ClipRRect(
       borderRadius: BorderRadius.only(
       topLeft: Radius.circular(15),
       topRight: Radius.circular(15),
       ),
child:Image.network(snapshot.data![index].image,
  height: 250,
  width: double.infinity,
  fit: BoxFit.cover,),
),
                Container(
                  height: 250,
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0),
                            Colors.black.withOpacity(0.8),
                          ],
                          stops: [
                            0.6,1
                          ])
                  ),
                  child: Text(snapshot.data![index].titleNmae.toString() ,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.fade
                    ),),
                )
                ],
                ),
              ]
  )
)
                );

              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
    );
  }
}



