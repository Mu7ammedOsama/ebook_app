import 'package:bloc/bloc.dart';
import 'package:ebook_app/features/home/domain/entities/book_entity.dart';
import 'package:ebook_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FeaturedBookCubit(this.featuredBooksUseCase) : super(FeaturedBookInitial());

  final FetchFeaturedBooksUseCase featuredBooksUseCase;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBookLoading());

    var response = await featuredBooksUseCase.call();

    response.fold(
      (failure) => emit(FeaturedBookFailure(failure.errorMessage)),
      (books) => emit(FeaturedBookSuccess(books)),
    );
  }
}
