part of 'fetchfeaturedbooks_cubit.dart';

@immutable
abstract class FetchfeaturedbooksState {}

class FetchfeaturedbooksInitial extends FetchfeaturedbooksState {}

class FetchfeaturedbooksLoading extends FetchfeaturedbooksState {}

class FetchfeaturedbooksSuccess extends FetchfeaturedbooksState {
  final List<BookEntity> books;

  FetchfeaturedbooksSuccess({required this.books});
}

class FetchfeaturedbooksFailure extends FetchfeaturedbooksState {
  final String errorMessage;

  FetchfeaturedbooksFailure({required this.errorMessage});
}
