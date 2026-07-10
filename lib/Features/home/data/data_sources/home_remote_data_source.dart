import 'package:bookly/Features/home/data/models/book_modal/book_modal.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/core/utils/apiServecies/api_services.dart';
import 'package:bookly/core/utils/app_constants.dart';
import 'package:bookly/core/utils/functions/cach_books.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiServices _apiServices;

  HomeRemoteDataSourceImpl(this._apiServices);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await _apiServices.get(
        endPoint:
            "volumes?filter=free-ebooks&q=programing&key=${AppConstants.apiKey}");
    List<BookEntity> books = getBooks(data);
    cahcBooks(books: books, bookName: AppConstants.kFeaturedBooksBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await _apiServices.get(
        endPoint:
            "volumes?q=programing&filter=free-ebooks&orderBy=newest&key=${AppConstants.apiKey}");

    List<BookEntity> books = getBooks(data);
    cahcBooks(books: books, bookName: AppConstants.knewestBooksBox);
    return books;
  }

  List<BookEntity> getBooks(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data["items"]) {
      books.add(BookModal.fromJson(bookMap));
    }
    return books;
  }
}
