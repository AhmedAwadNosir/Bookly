import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_featured_book_use_case.dart';
import 'package:meta/meta.dart';

part 'fetchfeaturedbooks_state.dart';

class FetchfeaturedbooksCubit extends Cubit<FetchfeaturedbooksState> {
  FetchfeaturedbooksCubit({required this.fetchFeaturedBookUseCase})
      : super(FetchfeaturedbooksInitial());
  final FetchFeaturedBookUseCase fetchFeaturedBookUseCase;
  Future<void> fetchFeaturedBooks() async {
    emit(FetchfeaturedbooksLoading());
    var reslut = await fetchFeaturedBookUseCase.call();
    reslut.fold(
        (failure) =>
            emit(FetchfeaturedbooksFailure(errorMessage: failure.errorMessage)),
        (books) => emit(FetchfeaturedbooksSuccess(books: books)));
  }
}
