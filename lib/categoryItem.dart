import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/screens/categories_trips_screen.dart';

class CategoryItem extends StatelessWidget {
final String id;
final String titlel;
final String imagUrl;
  CategoryItem(this.id, this.titlel, this.imagUrl);
void navepush (BuildContext context){
  Get.toNamed(categoriesTrips.screenRout,arguments:{ 'id': id,
      'title':titlel});
  // Navigator.of(context).pushNamed(
  //     categoriesTrips.screenRout,
  //   arguments: {
  //     'id': id,
  //     'title':titlel
  //   }
  // );
}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>navepush(context) ,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [

          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(image: NetworkImage(imagUrl),
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.center,
child: Text(titlel,style: TextStyle(fontSize: 30,color: Colors.white),),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(15)
            ),
          ),
        ],
      ),
    );
  }
}
