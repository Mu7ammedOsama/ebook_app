import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ebook_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:ebook_app/features/home/presentation/manager/featured_books_cubit/featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.fetchFeaturedBooksUseCase) : super(FeaturedBooksInitial());

  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());

    var response = await fetchFeaturedBooksUseCase.call();

    response.fold(
      (failure) => emit(FeaturedBooksFailure(failure.errorMessage)),
      (books) => emit(FeaturedBooksSuccess(books)),
    );
  }
}
