import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ebook_app/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:ebook_app/features/home/presentation/manager/newest_books_cubit/newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());

  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());

    var response = await fetchNewestBooksUseCase.call();

    response.fold(
      (failure) => emit(NewestBooksFailure(failure.errorMessage)),
      (books) => emit(NewestBooksSuccess(books)),
    );
  }
}
