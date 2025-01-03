import 'package:blog/src/core/error/failure.dart';
import 'package:dio/dio.dart';

class ServerFailure extends Failure {
  const ServerFailure({super.errorMessage = "Ocorreu um erro no servidor."});

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure(
            errorMessage: "Erro de conexão: O tempo de conexão expirou.");
      case DioExceptionType.receiveTimeout:
        return const ServerFailure(
            errorMessage: "Erro de resposta: O tempo de resposta expirou.");
      case DioExceptionType.sendTimeout:
        return const ServerFailure(
            errorMessage: "Erro de envio: O tempo de envio expirou.");
      case DioExceptionType.badResponse:
        return ServerFailure.fromDioException(dioException);
      case DioExceptionType.cancel:
        return const ServerFailure(
            errorMessage: "Requisição cancelada pelo usuário.");
      default:
        return const ServerFailure(
            errorMessage: "Ocorreu um erro desconhecido.");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    // final parsedResponse = response;

    switch (statusCode) {
      case 400:
        return const ServerFailure(
            errorMessage: "Requisição inválida: Verifique os dados enviados.");
      case 401:
        return const ServerFailure(
            errorMessage: "Não autorizado: Verifique suas credenciais.");
      case 403:
        return const ServerFailure(
            errorMessage:
                "Acesso negado: Você não tem permissão para acessar este recurso.");
      case 404:
        return const ServerFailure(
            errorMessage: "Recurso não encontrado: Verifique a URL.");
      case 500:
        return const ServerFailure(
            errorMessage:
                "Erro interno no servidor: Tente novamente mais tarde.");
      default:
        return ServerFailure(
            errorMessage: "Erro desconhecido: Código $statusCode.");
    }
  }
}
