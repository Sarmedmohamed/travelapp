import 'package:flutter/material.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/screens/trip_detail_screens.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imagUrl;
  final int duoation;
  final Triptype tripType;
  final Season season;
  // final removIetm;

  TripItem(this.id,this.title, this.imagUrl, this.duoation, this.tripType, this.season);

String get seasonText{

  switch (season){
    case Season.Winter:
      return 'شتاء';
      break;
    case Season.Spring:
      return 'ربيع';
      break;
    case Season.Summer:
      return 'صيف';
      break;
    case Season.Autumn:
      return 'خريف';
      break;
    default: return 'غير معروف';
  }
}
String get triptypeText{

  switch (tripType){
    case Triptype.Explaration:
      return 'استكشاف';
      break;
    case Triptype.Recovery:
      return 'نقاهة';
      break;
    case Triptype.Activities:
      return 'أنشطة';
      break;
    case Triptype.Therapy:
      return 'معالجة';
      break;
    default: return 'غير معروف';
  }
}
  void selectTrip(BuildContext context){
  Navigator.of(context).pushNamed(TripDetailScreens.screenRout ,
  arguments: id).then((value) {
if(value != null) {
  // removIetm (value);
} });
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
onTap: () => selectTrip(context),
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
                 child:Image.network(imagUrl,
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
                 child: Text(title ,
                 style:  TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontFamily: 'EIMessiri',
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.fade
          ),
                 ),
               )
             ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                    Icon(Icons.today,color: Colors.amber,),
                     SizedBox(
                     width: 6,
                     ),
                      Text('$duoation أيام'),
                  ],
                  ),
                  Row(
                    children: [
                    Icon(Icons.wb_sunny,color: Colors.amber,),
                     SizedBox(
                     width: 6,
                     ),
                      Text(seasonText),
                  ],
                  ),
                  Row(
                    children: [
                    Icon(Icons.family_restroom,color: Colors.amber,),
                     SizedBox(
                     width: 6,
                     ),
                      Text(triptypeText),
                  ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
