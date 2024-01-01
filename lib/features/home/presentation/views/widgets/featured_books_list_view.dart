import 'package:ebook_app/constants.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/custom_books_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 8),
          child: GestureDetector(
            onTap: () => GoRouter.of(context).push(kBookDetailsViewRoute),
            child: const CustomBooksImage(),
          ),
        ),
      ),
    );
  }
}
