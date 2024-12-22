// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blog/src/features/posts/domain/entities/post_entity.dart';
import 'package:dartz/dartz.dart';

import 'package:blog/src/core/error/failure.dart';
import 'package:blog/src/core/usecases/base_usecase.dart';
import 'package:blog/src/features/posts/domain/repositories/i_post_repository.dart';

class GetAllPostsUseCase extends BaseUseCases<List<PostEntity>, NoParams> {
  final IPostRepository repository;
  GetAllPostsUseCase({required this.repository});
  @override
  Future<Either<Failure, List<PostEntity>>> call(NoParams params) async {
    return await repository.getAllPosts();
  }
}
