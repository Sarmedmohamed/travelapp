
import 'package:floor/floor.dart';

@entity
class TrivelInfo{
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String image;
  final String titleNmae;

  TrivelInfo({this.id,required this.image,required this.titleNmae});
}
