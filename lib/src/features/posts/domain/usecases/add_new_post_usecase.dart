// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blog/src/features/posts/domain/entities/post_entity.dart';
import 'package:dartz/dartz.dart';

import 'package:blog/src/core/error/failure.dart';
import 'package:blog/src/core/usecases/base_usecase.dart';
import 'package:blog/src/features/posts/domain/repositories/i_post_repository.dart';

class AddNewPostUseCase extends BaseUseCases<Unit, PostEntity> {
  final IPostRepository repository;
  AddNewPostUseCase({required this.repository});
  @override
  Future<Either<Failure, Unit>> call(PostEntity params) async {
    return await repository.addNewPost(params);
  }
}
