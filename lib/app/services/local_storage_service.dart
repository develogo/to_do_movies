import 'package:hive/hive.dart';
import 'package:to_do_list/app/adapters/movie.dart';
import 'package:dartz/dartz.dart';
import 'package:to_do_list/app/interfaces/local_storage_service_interface.dart';
import 'package:to_do_list/app/services/errors/repository_errors.dart';

class LocalStorageService implements ILocalStorageService {
  @override
  Future<Either<DeleteFailure, bool>> delete(Movie movie) async {
    try {
      var box = Hive.box<Movie>('movies');
      await box.delete(movie.key);
      return Right(true);
    } catch (e) {
      return Left(DeleteFailure());
    }
  }

  @override
  get(String key) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  List<Movie> getAll() {
    var box = Hive.box<Movie>('movies');
    List<Movie> movies = box.values.toList();
    return movies;
  }

  @override
  Future<Either<SaveFailure, bool>> insert(Movie movie) async {
    try {
      var box = Hive.box<Movie>('movies');
      await box.add(movie);
      return Right(true);
    } catch (e) {
      return Left(SaveFailure());
    }
  }

  @override
  Future<Either<UpdateFailure, bool>> put(Movie movie) {
    // TODO: implement put
    throw UnimplementedError();
  }
}
