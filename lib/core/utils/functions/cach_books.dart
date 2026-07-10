import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

void cahcBooks({required List<BookEntity> books, required String bookName}) {
  var box = Hive.box<BookEntity>(bookName);
  box.addAll(books);
}
