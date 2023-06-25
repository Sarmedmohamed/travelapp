import 'package:flutter/material.dart';
import 'package:travel_app/screens/tabs_screens.dart';

import '../screens/Filters_Screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, IconData icon, GestureTapCallback onTapLink) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Colors.blue,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'ElMessiri',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTapLink,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Colors.amber,
            child: Text('دليلك السياحي',style: TextStyle(
              color: Colors.white,
              fontSize:26,
              fontWeight: FontWeight.bold,
            )),
          ),
          SizedBox(height: 20,),
      buildListTile(  'الرحلات',
            Icons.card_travel,
                 (){Navigator.of(context).pushReplacementNamed('/');
           },
          ),
          buildListTile(
            'الفلترة',
            Icons.filter_list,
                () {
              Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.screenRoute);
            },
          ),
        ],
      ),
    );
  }
}
