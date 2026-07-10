import 'package:bookly/core/utils/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<type, param> {
  Future<Either<Failure, type>> call([param param]);
}

class NoParam {}
