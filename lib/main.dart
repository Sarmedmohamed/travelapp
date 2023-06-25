import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/Getx/databese_bindings/databese_binding.dart';
import 'package:travel_app/screens/Filters_Screen.dart';
import 'package:travel_app/screens/categories_screens.dart';
import 'package:travel_app/screens/categories_trips_screen.dart';
import 'package:travel_app/screens/tabs_screens.dart';
import 'package:travel_app/screens/trip_detail_screens.dart';

import 'app_data.dart';
import 'models/trip.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DatabeseBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String , bool> _filters = {
'summer':false,
'winter':false,
'family':false,
};
  List<Trip> _availableTrips = Trips_data;
  static List<Trip> favoriteTrips = [];
  void _changeFilter(Map<String, bool>filterData){
setState(() {
  _filters = filterData;

  _availableTrips = Trips_data.where((trip) {
    if (_filters['summer'] == true && trip.isInSummer != true) {
      return false;
    }
    if (_filters['winter'] == true && trip.isInWinter != true) {
      return false;
    }
    if (_filters['family'] == true && trip.isForFamilise != true) {
      return false;
    }
    return true;
  }).toList();
});
  }
  void _manageFavorite(String tripId) {
    final existingIndex =
    favoriteTrips.indexWhere((trip) => trip.id == tripId);
    if (existingIndex >= 0) {
      setState(() {
        favoriteTrips.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoriteTrips.add(
          Trips_data.firstWhere((trip) => trip.id == tripId),
        );
      });
    }
  }

  bool _isFovarite(String id) {
    return favoriteTrips.any((trip) => trip.id == id);
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
//       theme: ThemeData(
// primarySwatch: Colors.blue,
//         accentColor: Colors.amber,
//         fontFamily: 'EIMessiri',
//         textTheme: ThemeData.light().textTheme.copyWith(
//           headline5: TextStyle(
//             color: Colors.blue,
//             fontSize: 24,
//             fontFamily: 'EIMessiri',
//             fontWeight: FontWeight.bold,
//           ),
//           headline6: TextStyle(
//             color: Colors.white,
//             fontSize: 26,
//             fontFamily: 'EIMessiri',
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
      routes: {
        '/': (context) => TapsScreen(favoriteTrips),
        categoriesTrips.screenRout :(context) => categoriesTrips(_availableTrips),
        TripDetailScreens.screenRout :(context) => TripDetailScreens(_manageFavorite,_isFovarite),
        FiltersScreen.screenRoute :(context) => FiltersScreen(_filters,_changeFilter),
    },
    );
  }
}

