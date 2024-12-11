import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/domain/entities/book_entity.dart';
import '../../../../home/presentation/views/widgets/newest_books_list_view_item.dart';
import '../../manger/search_for_books_cubit/search_for_books_cubit.dart';

class SearchResultListView extends StatefulWidget {
  const SearchResultListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  State<SearchResultListView> createState() => _SearchResultListViewState();
}

class _SearchResultListViewState extends State<SearchResultListView> {
  late final ScrollController _scrollController;
  int nextPage = 1;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    var currendPosition = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currendPosition >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<SearchForBooksCubit>(context).searchForBooks(
            pageNumber: nextPage++,
            q: BlocProvider.of<SearchForBooksCubit>(context).q);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      padding: EdgeInsets.zero,
      itemCount: widget.books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(
            book: widget.books[index],
          ),
        );
      },
    );
  }
}
