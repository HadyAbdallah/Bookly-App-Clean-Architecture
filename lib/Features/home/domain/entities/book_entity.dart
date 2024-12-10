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
  @HiveField(3)
  final String? category;
  @HiveField(4)
  final String? pdfLink;

  BookEntity({
    required this.category,
    required this.pdfLink,
    required this.image,
    required this.titel,
    required this.authorName,
  });
}
