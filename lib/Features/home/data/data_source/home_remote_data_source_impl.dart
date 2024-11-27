import 'package:bookly_clear_arch/Features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly_clear_arch/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_clear_arch/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_clear_arch/constants.dart';
import 'package:bookly_clear_arch/core/utils/api_service.dart';

import '../../../../core/utils/functions/save_books.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=programming');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kFeaturedBooks);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=Programming&Sorting=newest');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kNewestBooks);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
