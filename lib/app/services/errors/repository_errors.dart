import 'package:analyzer/exception/exception.dart';

class RepositoryFailure implements Exception {}

class SaveFailure extends RepositoryFailure {}

class DeleteFailure extends RepositoryFailure {}

class UpdateFailure extends RepositoryFailure {}
