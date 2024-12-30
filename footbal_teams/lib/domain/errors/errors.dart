class BaseError {
  final String errorMessage;
  BaseError({required this.errorMessage});
}

class DataFetchError extends BaseError {
  DataFetchError({required super.errorMessage});
}

class NoInternetError extends BaseError {
  NoInternetError({required super.errorMessage});
}

// we can create lots of error types as per requrement
