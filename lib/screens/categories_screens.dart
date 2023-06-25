import 'package:flutter/material.dart';
import 'package:travel_app/app_data.dart';
import 'package:travel_app/categoryItem.dart';
import '../app_data.dart';
class CategoriesScareen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(10),
        gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 7/8,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        children: Category_data.map((e) => CategoryItem(e.id, e.title, e.imagUrl)).toList()
      );
  }
}
