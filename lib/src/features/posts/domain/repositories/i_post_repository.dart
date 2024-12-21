import 'package:blog/src/features/posts/domain/entities/post_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class IPostRepository {
  Future<Either<Failure, List<PostEntity>>> getAllPosts();
  Future<Either<Failure, Unit>> addNewPost(PostEntity post);
}
