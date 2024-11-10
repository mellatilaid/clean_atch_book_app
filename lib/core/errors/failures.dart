import 'package:dio/dio.dart';

class Failures {
  final String errMessage;

  const Failures({required this.errMessage});
}

class ServerFailure extends Failures {
  const ServerFailure({required super.errMessage});

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionError:
        return const ServerFailure(
            errMessage: 'Connection Error with ApiService');
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(
            e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return const ServerFailure(errMessage: 'Request Canceled');
      case DioExceptionType.connectionTimeout:
        return const ServerFailure(
            errMessage: 'Connection Timeout with ApiService');
      case DioExceptionType.receiveTimeout:
        return const ServerFailure(
            errMessage: 'Receive Timeout with ApiService');
      case DioExceptionType.sendTimeout:
        return const ServerFailure(errMessage: 'Send Timeout with ApiService');
      default:
        return const ServerFailure(
            errMessage: 'Opps there was an error, please try later');
    }
  }

  factory ServerFailure.fromBadResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return const ServerFailure(errMessage: 'Your request not found');
    } else if (statusCode >= 500) {
      return const ServerFailure(
          errMessage: 'Internal Server Error, Please try later');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errMessage: response['error']);
    } else {
      return const ServerFailure(
          errMessage: 'there was an unknows error, Please try again');
    }
  }
}
