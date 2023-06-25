import 'package:flutter/material.dart';

enum Season{
  //للفصول الاربعة
  Winter,
  Spring,
  Summer,
  Autumn,
}
enum Triptype{
  //لتحديد الرحل علاجية او ستكشافية او ترفيهية
Explaration,
  Recovery,
  Activities,
  Therapy,
}
class Trip{
  final String id;
  final List<String> catagores;
  final String titlel;
  final String imageUrl;
  final List<String> activities; //للانشطة
  final List<String> program;
  final int duration;
  final Season season;
  final Triptype triptype;
  final bool isInSummer;
  final bool isInWinter;
  final bool isForFamilise;

 const Trip(
     @required this.id,
     @required this.catagores,
     @required this.titlel,
     @required this.imageUrl,
     @required this.activities,
     @required this.program,
     @required this.duration,
     @required this.season,
     @required this.triptype,
     @required this.isInSummer,
     @required this.isInWinter,
     @required this.isForFamilise);
}