import 'package:hive/hive.dart';

part 'person.g.dart';

@HiveType(typeId: 2)
class Person extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  int age;

  Person({required this.name, required this.age});
}
