import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../manger/search_for_books_cubit/search_for_books_cubit.dart';

// ignore: must_be_immutable
class CustomSearchTextField extends StatelessWidget {
  CustomSearchTextField({super.key});
  String? search;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        search = value;
        BlocProvider.of<SearchForBooksCubit>(context)
            .searchForBooks(q: search!);
      },
      onSubmitted: (value) {
        search = value;
        BlocProvider.of<SearchForBooksCubit>(context)
            .searchForBooks(q: search!);
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        hintText: 'Seach for a book',
        suffixIcon: IconButton(
          onPressed: () {
            BlocProvider.of<SearchForBooksCubit>(context)
                .searchForBooks(q: search!);
            FocusManager.instance.primaryFocus?.unfocus();
          },
          icon: const Opacity(
            opacity: .8,
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 22,
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(
        12,
      ),
    );
  }
}
