import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/use_case.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBookUseCase extends UseCase<List<BookEntity>, NoParam> {
  HomeRepo homeRepo;
  FetchFeaturedBookUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param]) {
    return homeRepo.fetchFeaturedBooks();
  }
}
