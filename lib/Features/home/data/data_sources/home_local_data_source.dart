import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/core/utils/app_constants.dart';
import 'package:hive_flutter/adapters.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    var box = Hive.box<BookEntity>(AppConstants.kFeaturedBooksBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(AppConstants.knewestBooksBox);
    return box.values.toList();
  }
}
