import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/screens/Favorites_Screen.dart';
import 'package:travel_app/screens/categories_screens.dart';
import 'package:travel_app/widgets/app_drawer.dart';

import '../Getx/controllers/taoscreen_controller.dart';
class TapsScreen extends StatefulWidget {

  final List<Trip> _favoriteTrips;

  TapsScreen(this._favoriteTrips);

  @override
  State<TapsScreen> createState() => _TapsScreenState();
}

class _TapsScreenState extends State<TapsScreen> {
  void _selectScreen(int index){
    setState(() {
      _selectedScreenIndex = index;
    });
  }
  int _selectedScreenIndex = 0;
    late List<Map<String, dynamic>> _screens;
  @override
  void initState() {
    // TODO: implement initState
    _screens= [
    {
    'Screen': CategoriesScareen(),
    'Title': 'تصنيفات رحلات'
    },
    {
    'Screen': FavoritesScreen(widget._favoriteTrips),
    'Title': 'رحلات المفضلة'
    }
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text(_screens[_selectedScreenIndex]['Title'],
        ),
        ),
        ),
      drawer: AppDrawer(),
      body: _screens[_selectedScreenIndex]['Screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
      backgroundColor: Colors.blue,
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.white,
      currentIndex: _selectedScreenIndex,
      items: [
        BottomNavigationBarItem(  icon: Icon(Icons.dashboard),label: 'التصنيفات'),
        BottomNavigationBarItem(  icon: Icon(Icons.star),label: 'المفضلة'),
      ]),
    );
  }
}


//
// class TapsScreen extends StatelessWidget {
//   const TapsScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//         length: 2,
//         child: Scaffold(
// appBar: AppBar(title: Center(child: Text('دليل سياحي')),
// bottom: TabBar(tabs: [
//   Tab(
//     icon: Icon(Icons.dashboard),text: 'التصنيفات',
//   ),
//   Tab(
//     icon: Icon(Icons.star),text: 'المفضلة',
//   ),
// ],
// ),
//
// ),
// body: TabBarView(children: [
//   CategoriesScareen(),
//   FavoritesScreen(),
// ]),
//         )
//
//     );
//   }
// }

