import 'package:bookly_clear_arch/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_clear_arch/Features/search/data/data_source/search_remote_data_source.dart';
import 'package:bookly_clear_arch/Features/search/domain/repos/search_repo.dart';
import 'package:bookly_clear_arch/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl extends SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRepoImpl({required this.searchRemoteDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> searchForBooks(
      {int pageNumber = 0, required String q}) async {
    try {
      var books = await searchRemoteDataSource.searchForBooks(
          pageNumber: pageNumber, q: q);
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
