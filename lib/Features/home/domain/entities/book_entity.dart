import 'package:hive_flutter/hive_flutter.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String bookid;
  @HiveField(1)
  final String image;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String author;
  @HiveField(4)
  final num price;
  @HiveField(5)
  final num rating;
  @HiveField(6)
  final int reviewsNumbers;

  BookEntity(
      {required this.image,
      required this.title,
      required this.author,
      required this.price,
      required this.rating,
      required this.reviewsNumbers,
      required this.bookid});
}
