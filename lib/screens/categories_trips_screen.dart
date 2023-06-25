import 'package:flutter/material.dart';
import 'package:travel_app/app_data.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/widgets/trip_item.dart';

class categoriesTrips extends StatefulWidget {
  static const screenRout = '/catogry-trips';

  final List<Trip> _availableTrips;

  categoriesTrips(this._availableTrips);

  @override
  State<categoriesTrips> createState() => _categoriesTripsState();
}

class _categoriesTripsState extends State<categoriesTrips> {

  late String categoryTitle;
  late List<Trip> displayTrips;
  @override
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    final routeArgument = ModalRoute.of(context)?.settings.arguments as Map<String ,String>;
    final categoryId = routeArgument['id'];
    categoryTitle =routeArgument['title']!;
    displayTrips = widget._availableTrips.where((trip) {
      return trip.catagores.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(categoryTitle!)
      ),
      body: ListView.builder(itemBuilder: (context, index) {
return TripItem(
    displayTrips[index].id,
    displayTrips[index].titlel,
    displayTrips[index].imageUrl,
    displayTrips[index].duration,
    displayTrips[index].triptype,
    displayTrips[index].season,
    // _removTrip

);
      },
        itemCount: displayTrips.length,
      )
    );
  }
}
