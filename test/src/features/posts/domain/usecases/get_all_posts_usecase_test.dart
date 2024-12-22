import 'package:blog/src/core/error/failure.dart';
import 'package:blog/src/core/error/server_failure.dart';
import 'package:blog/src/core/usecases/base_usecase.dart';
import 'package:blog/src/features/posts/domain/entities/post_entity.dart';
import 'package:blog/src/features/posts/domain/repositories/i_post_repository.dart';
import 'package:blog/src/features/posts/domain/usecases/get_all_posts_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../repositories/i_post_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<IPostRepository>()])
void main() {
  late BaseUseCases usecase;
  late IPostRepository mockRepository;

  setUp(() {
    mockRepository = MockIPostRepository();
    usecase = GetAllPostsUseCase(repository: mockRepository);
  });

  // Lista de posts simulada
  final List<PostEntity> posts = [
    PostEntity(id: '1', title: 'Post 1', body: 'Body 1'),
    PostEntity(id: '2', title: 'Post 2', body: 'Body 2'),
  ];

  // Teste para retorno de sucesso
  test('It must return a list of posts in the RIGTH of EITHER', () async {
    when(mockRepository.getAllPosts()).thenAnswer((_) async => Right(posts));

    final result = await usecase(NoParams());

    expect(result, Right(posts));
    verify(mockRepository.getAllPosts()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('It must return an error of posts in the LEFT of EITHER', () async {
    // Simula o retorno de erro
    when(mockRepository.getAllPosts()).thenAnswer(
      (_) async => const Left<Failure, List<PostEntity>>(ServerFailure()),
    );

    final result = await usecase(NoParams());
    expect(result, const Right<Failure, List<PostEntity>>([]));
  });
}
