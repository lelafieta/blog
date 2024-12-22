import 'package:blog/src/core/usecases/base_usecase.dart';
import 'package:blog/src/features/posts/domain/entities/post_entity.dart';
import 'package:blog/src/features/posts/domain/repositories/i_post_repository.dart';
import 'package:blog/src/features/posts/domain/usecases/add_new_post_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../repositories/i_post_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<IPostRepository>()])
void main() {
  late IPostRepository repository;
  late BaseUseCases useCase;

  setUp(() {
    repository = MockIPostRepository();
    useCase = AddNewPostUseCase(repository: repository);
  });

  final post = PostEntity();
  test("Deve retorna true depois de cadastrar", () async {
    // when((repository.addNewPost()) async => const Right(true));

    when(repository.addNewPost(post)).thenAnswer((_) async => Right(unit));

    final result = await useCase(post);

    expect(result, const Right(unit));
    verify(repository.addNewPost(post)).called(1);
    verifyNoMoreInteractions(repository);
  });
}
