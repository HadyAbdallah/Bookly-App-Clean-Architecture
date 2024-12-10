import 'package:bookly_clear_arch/Features/search/domain/repos/search_repo.dart';
import 'package:bookly_clear_arch/core/errors/failure.dart';
import 'package:bookly_clear_arch/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

import '../../../home/domain/entities/book_entity.dart';

class SearchForBooksUseCase extends UseCase<List<BookEntity>, int> {
  final SearchRepo searchRepo;

  SearchForBooksUseCase(this.searchRepo);
  @override
  Future<Either<Failure, List<BookEntity>>> call(
      [int param = 0, String q = '']) async {
    return await searchRepo.searchForBooks(q: q, pageNumber: param);
  }
}
