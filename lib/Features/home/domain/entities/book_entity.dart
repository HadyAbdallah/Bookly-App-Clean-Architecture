import 'package:hive/hive.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String? image;
  @HiveField(1)
  final String titel;
  @HiveField(2)
  final String? authorName;

  BookEntity({
    required this.image,
    required this.titel,
    required this.authorName,
  });
}
