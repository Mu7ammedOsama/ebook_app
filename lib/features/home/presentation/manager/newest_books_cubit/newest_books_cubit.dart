import 'package:bloc/bloc.dart';
import 'package:ebook_app/features/home/domain/entities/book_entity.dart';
import 'package:meta/meta.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit() : super(NewestBooksInitial());
}
