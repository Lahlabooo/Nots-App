import 'package:hive/hive.dart';
part 'Nots_Model.g.dart';
@HiveType(typeId: 0)
class Note_Model extends HiveObject {
  @HiveField(0)
   String title;
  @HiveField(1)
   String  suptitle;
  @HiveField(2)
  final String date ;
  @HiveField(3)
   int color ;
  Note_Model(
      this.title,
      this.suptitle,
      this.date,
      this.color);
}