import 'package:bloc/bloc.dart';
import 'package:ebook_app/features/home/domain/entities/book_entity.dart';
import 'package:meta/meta.dart';

part 'featured_book_state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FeaturedBookCubit() : super(FeaturedBookInitial());
}
