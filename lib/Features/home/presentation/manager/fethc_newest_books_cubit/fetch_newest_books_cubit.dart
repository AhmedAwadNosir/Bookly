import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:meta/meta.dart';

part 'fetch_newest_books_state.dart';

class FetchNewestBooksCubit extends Cubit<FetchNewestBooksState> {
  FetchNewestBooksCubit({required this.fetchNewestBookUseCase})
      : super(FetchNewestBooksInitial());
  final FetchNewestBooksUseCase fetchNewestBookUseCase;
  Future<void> fetchFeaturedBooks() async {
    emit(FetchNewestBooksLoading());
    var reslut = await fetchNewestBookUseCase.call();
    reslut.fold(
        (failure) =>
            emit(FetchNewestBooksFailure(errorMessage: failure.errorMessage)),
        (books) => emit(FetchNewestBooksSuccess(books: books)));
  }
}
