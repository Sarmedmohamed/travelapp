import 'package:floor/floor.dart';
import 'Trivel_Info.dart';

@dao
abstract class Trivel_Dao{
  @Query('SELECT * FROM TrivelInfo')
  Future<List<TrivelInfo>> findAllTrivelInfo();

  @Query('SELECT * FROM TrivelInfo WHERE id = :id')
  Stream<TrivelInfo?> findTrivelInfoById(int id);

  @insert
  Future<void> insertTrivelInfo(TrivelInfo person);
  @delete
  Future<void> deletinfo(TrivelInfo person);
}