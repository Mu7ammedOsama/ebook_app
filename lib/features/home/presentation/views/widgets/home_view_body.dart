import 'package:ebook_app/core/utilities/styles.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                FeaturedBooksListView(),
                SizedBox(height: 24),
                Text(
                  'Newest Books',
                  style: Styles.textStyle18,
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
          SliverFillRemaining(
            child: NewestBooksListView(),
          ),
        ],
      ),
    );
  }
}
