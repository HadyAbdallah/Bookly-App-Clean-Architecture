import 'package:bookly_clear_arch/Features/search/data/data_source/search_remote_data_source_impl.dart';
import 'package:bookly_clear_arch/Features/search/domain/use_cases/search_for_books_use_case.dart';
import 'package:bookly_clear_arch/Features/search/presentation/manger/search_for_books_cubit/search_for_books_cubit.dart';
import 'package:bookly_clear_arch/Features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/functions/setup_service_locator.dart';
import '../../data/repos/search_repo_impl.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchForBooksCubit(
          SearchForBooksUseCase(getIt.get<SearchRepoImpl>())),
      child: const Scaffold(
        body: SafeArea(
          child: SearchViewBody(),
        ),
      ),
    );
  }
}
