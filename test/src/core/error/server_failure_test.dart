import 'package:blog/src/core/error/server_failure.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("ServerFailure deve ter uma mensagem padão", () {
    const failure = ServerFailure();
    expect(failure.errorMessage, "Ocorreu um erro no servidor.");
  });

  test("ServerFailure deve aceitar mensagem personalizadas ", () {
    const failure = ServerFailure(errorMessage: "Erro personalizado.");
    expect(failure.errorMessage, "Erro personalizado.");
  });
}
