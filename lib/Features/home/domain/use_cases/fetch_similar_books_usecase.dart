import 'package:bookly_clear_arch/core/errors/failure.dart';
import 'package:bookly_clear_arch/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

import '../entities/book_entity.dart';
import '../repos/home_repo.dart';

class FetchSimilarBooksUsecase extends UseCase<List<BookEntity>, String> {
  final HomeRepo homeRepo;

  FetchSimilarBooksUsecase(this.homeRepo);
  @override
  Future<Either<Failure, List<BookEntity>>> call([String param = '']) async {
    return await homeRepo.fetchSimilarBooks(category: param);
  }
}
