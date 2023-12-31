import 'package:dio/dio.dart';

abstract class Failures {
  final String errorMessage;

  const Failures(this.errorMessage);
}

class ServerFailures extends Failures {
  ServerFailures(super.errorMessage);

  factory ServerFailures.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailures('Connection Time Out with API Service');
      case DioExceptionType.sendTimeout:
        return ServerFailures('Send Time Out with API Service');
      case DioExceptionType.receiveTimeout:
        return ServerFailures('Receive Time Out with API Service');
      case DioExceptionType.badResponse:
        return ServerFailures.fromResponse(
          dioError.response!.statusCode,
          dioError.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailures('Request with API Service was Canceled');
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailures('No Internet Connection');
        }
        return ServerFailures('Unexpected Error, Please try later!');
      default:
        return ServerFailures('Opps there was an error, Please try again!');
    }
  }

  factory ServerFailures.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailures(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailures('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailures('Internal Server Error, Please try later!');
    } else {
      return ServerFailures('Opps there was an error, Please try again!');
    }
  }
}
