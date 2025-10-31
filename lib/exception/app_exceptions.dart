class AppException implements Exception {
  final String? message;
  final String? prefix;

  const AppException([this.message, this.prefix]);

  @override
  String toString() {
    return '${prefix != null ? '$prefix: ' : ''}${message ?? ''}';
  }
}

class FetchDataException extends AppException {
  const FetchDataException([String? message])
      : super(message, 'Error During Communication');
}

class BadRequestException extends AppException {
  const BadRequestException([String? message])
      : super(message, 'Invalid Request');
}

class UnauthorisedException extends AppException {
  const UnauthorisedException([String? message])
      : super(message, 'Unauthorized Request');
}

class InvalidInputException extends AppException {
  const InvalidInputException([String? message])
      : super(message, 'Invalid Input');
}

class NoInternetException extends AppException {
  const NoInternetException([String? message])
      : super(message, 'No Internet Connection');
}
