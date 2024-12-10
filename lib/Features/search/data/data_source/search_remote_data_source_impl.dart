import 'package:bookly_clear_arch/Features/home/domain/entities/book_entity.dart';

import '../../../../core/utils/api_service.dart';
import '../../../home/data/data_source/home_remote_data_source_impl.dart';
import 'search_remote_data_source.dart';

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final ApiService apiService;

  SearchRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> searchForBooks(
      {int pageNumber = 0, required String q}) async {
    var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=$q&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getBooksList(data);
    return books;
  }
}
