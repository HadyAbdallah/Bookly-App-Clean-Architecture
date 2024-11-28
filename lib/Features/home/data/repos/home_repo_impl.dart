import 'package:bookly_clear_arch/Features/home/data/data_source/home_local_data_source.dart';
import 'package:bookly_clear_arch/Features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly_clear_arch/Features/home/domain/entities/book_entity.dart';

import 'package:bookly_clear_arch/core/errors/failure.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../domain/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      var books = homeLocalDataSource.fetchFeaturedBooks();
      if (books.isEmpty) {
        books = await homeRemoteDataSource.fetchFeaturedBooks();
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      var books = homeLocalDataSource.fetchNewestBooks();
      if (books.isEmpty) {
        books = await homeRemoteDataSource.fetchNewestBooks();
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
