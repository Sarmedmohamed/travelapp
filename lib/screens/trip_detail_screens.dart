import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:travel_app/DataBase/Trivel_Info.dart';
import 'package:travel_app/app_data.dart';

import '../DataBase/database.dart';
import '../Getx/controllers/database_controller.dart';

class TripDetailScreens extends StatefulWidget {
  TripDetailScreens(this._manageFavorite, this._isFovarite);

  final _manageFavorite;
  final _isFovarite;
  static final screenRout = '/trip-detail';
  late AppDataBase database;
  @override
  State<TripDetailScreens> createState() => _State();
}

class _State extends State<TripDetailScreens> {
  int id = 0;
  DatabaseConrtoller dataController = Get.put(DatabaseConrtoller());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedTrip = Trips_data.firstWhere((trip) => trip.id == tripId);
    return Scaffold(
        appBar: AppBar(title: Text('${selectedTrip.titlel}')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedTrip.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              buildSectionTitle('الأنشطة',),
              buildListViewContanier(
                ListView.builder(
                  itemCount: selectedTrip.activities.length,
                  itemBuilder: (context, index) => Card(
                    elevation: 0.3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(selectedTrip.activities[index]),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              buildSectionTitle('البرنامج اليومي'),
              buildListViewContanier(
                ListView.builder(
                  itemCount: selectedTrip.program.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('${index + 1}يوم'),
                        ),
                        title: Text(
                          selectedTrip.program[index],
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.star ),
            onPressed: () async {

              // setState(() {
              //   id = id + 1;
              // });
              String urlPhoto = selectedTrip.imageUrl;
              String tilte = selectedTrip.titlel;

              TrivelInfo trivelInfo = TrivelInfo(image: urlPhoto, titleNmae: tilte);
              dataController.addToFav(trivelInfo);
            }));
  }

  Widget buildListViewContanier(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      height: 200,
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: child,
    );
  }

  Widget buildSectionTitle(String titleText) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.topRight,
      child: Text(
        titleText,
        style: TextStyle(
            color: Colors.blue, fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
//
// class TripDetailScreens extends StatelessWidget {
//  static final screenRout='/trip-detail';
//
// final _manageFavorite;
// final _isFovarite;
//
//
//  TripDetailScreens(this._manageFavorite,this._isFovarite);
//
//   Widget buildSectionTitle (String titleText){
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 10),
//       alignment: Alignment.topRight,
//       child: Text(titleText,style:TextStyle(
//           color: Colors.blue,
//           fontSize: 24,
//           fontWeight: FontWeight.bold
//       ),),
//     );
//   }
//
// //   Widget buildListViewContanier(Widget child){
// //
// //    return Container(
// //         decoration: BoxDecoration(
// //         color: Colors.white,
// //         border: Border.all(color: Colors.grey),
// //     borderRadius: BorderRadius.circular(10)
// //     ),
// //     height: 200,
// //     margin: EdgeInsets.symmetric(horizontal: 15),
// //      child: child,
// //    );
// //   }
// //   @override
// //   Widget build(BuildContext context) {
// //     final tripId = ModalRoute.of(context)?.settings.arguments as String;
// //     final selectedTrip = Trips_data.firstWhere((trip) => trip.id == tripId );
// //     return Scaffold(
// //       appBar: AppBar(title: Text('${selectedTrip.titlel}')),
// //       body: SingleChildScrollView(
// //         child: Column(
// //           children: [
// //             Container(
// //               height: 300,
// //               width: double.infinity,
// //               child: Image.network(selectedTrip.imageUrl , fit: BoxFit.cover,),
// //             ),
// //             SizedBox(height: 10,),
// //             buildSectionTitle('الأنشطة'),
// //             buildListViewContanier(
// //             ListView.builder(
// //                 itemCount: selectedTrip.activities.length,
// //               itemBuilder: (context, index) => Card(
// //                 elevation: 0.3,
// //                 child: Padding(
// //                   padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
// //                   child: Text(selectedTrip.activities[index]),
// //                 ),
// //               ),),
// //             ),
// //             SizedBox(height: 10,),
// //             buildSectionTitle('البرنامج اليومي'),
// //             buildListViewContanier(
// //               ListView.builder(itemCount: selectedTrip.program.length,
// //                 itemBuilder: (context, index) =>Column(
// //                   children: [
// //                     ListTile(
// //                     leading: CircleAvatar(
// //                       child: Text('${index+1}يوم'),
// //                     ),
// //                     title: Text(selectedTrip.program[index],),
// //
// //                     ),
// //                     Divider(),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //             SizedBox(height: 100,),
// //           ],
// //         ),
// //
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //           child: Icon(_isFovarite(tripId) ? Icons.star : Icons.star_border),
// //           onPressed: () async {
// //
// // String urlPhoto=selectedTrip.imageUrl;
// // String tilte =selectedTrip.titlel;
// // final database = await $FloorAppDataBase.databaseBuilder('app_database.db').build();
// // TrivelInfo trivelInfo=TrivelInfo(1, urlPhoto, tilte);
// // database.trivel_Dao.insertTrivelInfo(trivelInfo);
// //
// //           } )
// //     );
// //   }
// }
