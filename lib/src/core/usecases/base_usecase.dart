import 'package:blog/src/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class BaseUseCases<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
