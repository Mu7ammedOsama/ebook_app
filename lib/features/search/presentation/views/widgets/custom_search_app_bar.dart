import 'package:ebook_app/constants.dart';
import 'package:ebook_app/core/utilities/styles.dart';
import 'package:flutter/material.dart';

class CustomSearchAppBar extends StatelessWidget {
  const CustomSearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          'Search',
          style: Styles.textStyle20,
        ),
        centerTitle: true,
      ),
    );
  }
}
