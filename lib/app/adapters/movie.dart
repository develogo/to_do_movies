import 'package:hive/hive.dart';

part 'movie.g.dart';

@HiveType(typeId: 1)
class Movie extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String type;

  @HiveField(2)
  double note;

  @HiveField(3)
  String description;

  Movie(
      {required this.title,
      required this.type,
      required this.note,
      required this.description});
}
