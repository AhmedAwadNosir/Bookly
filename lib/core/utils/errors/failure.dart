import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});
  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
            errorMessage: "Connection Time Out with the server ,try later");

      case DioExceptionType.sendTimeout:
        return ServerFailure(
            errorMessage: "Send Time Out with the server ,try later");

      case DioExceptionType.receiveTimeout:
        return ServerFailure(
            errorMessage: "Recive Time Out with the server ,try later");

      case DioExceptionType.badCertificate:
        return ServerFailure(
            errorMessage:
                "An error occurred while establishing a secure connection Please try Later!.");

      case DioExceptionType.badResponse:
        return ServerFailure.formBadResponse(response: e.response!);

      case DioExceptionType.cancel:
        return ServerFailure(
            errorMessage: "Requst with api service is canceld");

      case DioExceptionType.connectionError:
        return ServerFailure(
            errorMessage:
                "No InternetConection Please Check your internet and trt agin");

      case DioExceptionType.unknown:
        return ServerFailure(
            errorMessage: "Unexpected Error please try later!");

      case DioExceptionType.transformTimeout:
        return ServerFailure(
            errorMessage: "TransfarTimeout with the server trt later!");

      default:
        return ServerFailure(
            errorMessage: "Opps! There is an Error. please try later!defult");
    }
  }

  factory ServerFailure.formBadResponse({required Response response}) {
    if (response.statusCode == 400 ||
        response.statusCode == 401 ||
        response.statusCode == 403) {
      // you need to look to api and get error Message
      return ServerFailure(errorMessage: response.data['error']['message']);
    } else if (response.statusCode == 404) {
      return ServerFailure(
          errorMessage: "Your request not found. please try later!");
    } else if (response.statusCode! >= 500) {
      return ServerFailure(
          errorMessage: "Internal server error. please try later!");
    } else {
      return ServerFailure(
          errorMessage:
              "Opps there is an error please try later!frombadrespons");
    }
  }
}

class NetworkFailure extends Failure {
  NetworkFailure({required super.errorMessage});
}
