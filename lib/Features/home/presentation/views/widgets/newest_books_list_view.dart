import 'package:bookly_clear_arch/Features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import 'newest_books_list_view_item.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: BookListViewItem(
            book: books[index],
          ),
        );
      },
    );
  }
}
