import '../../../home/domain/entities/book_entity.dart';

abstract class SearchRemoteDataSource {
  Future<List<BookEntity>> searchForBooks(
      {int pageNumber = 0, required String q});
}
