class ApiBaseException implements Exception {
  final String? msg;
  ApiBaseException({this.msg});
  @override
  String toString() => msg ?? 'ApiBaseException';
}

class RssNewsException extends ApiBaseException {
  RssNewsException([String? msg]);
  @override
  String toString() => msg ?? 'RssNewsException';
}
