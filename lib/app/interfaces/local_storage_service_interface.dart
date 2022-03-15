import 'package:dartz/dartz.dart';
import 'package:to_do_list/app/adapters/movie.dart';
import 'package:to_do_list/app/services/errors/repository_errors.dart';

abstract class ILocalStorageService {
  get(String key);
  Future<Either<DeleteFailure, bool>> delete(Movie movie);
  Future<Either<SaveFailure, bool>> insert(Movie movie);
  Future<Either<UpdateFailure, bool>> put(Movie movie);
  List<Movie> getAll();
}
