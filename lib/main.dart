import 'package:ebook_app/constants.dart';
import 'package:ebook_app/core/utilities/app_routers.dart';
import 'package:ebook_app/core/utilities/functions/setup_service_locator.dart';
import 'package:ebook_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:ebook_app/features/home/domain/entities/book_entity.dart';
import 'package:ebook_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:ebook_app/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:ebook_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:ebook_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());

  setupServiceLocator();

  await Hive.openBox<BookEntity>(kFeaturedBooksBox);
  await Hive.openBox<BookEntity>(kNewestBooksBox);

  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FeaturedBooksCubit(FetchFeaturedBooksUseCase(getIt.get<HomeRepoImplementation>()))),
        BlocProvider(create: (context) => NewestBooksCubit(FetchNewestBooksUseCase(getIt.get<HomeRepoImplementation>()))),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouters.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(useMaterial3: true).copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
