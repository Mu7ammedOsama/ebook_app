import 'package:ebook_app/core/utilities/styles.dart';
import 'package:ebook_app/features/search/presentation/views/widgets/custom_search_app_bar.dart';
import 'package:ebook_app/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:ebook_app/features/search/presentation/views/widgets/search_results_list_view.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchAppBar(),
          CustomSearchTextField(),
          SizedBox(height: 24),
          Text(
            'Search Results',
            style: Styles.textStyle18,
          ),
          SizedBox(height: 16),
          Expanded(
            child: SearchResultsListView(),
          ),
        ],
      ),
    );
  }
}
