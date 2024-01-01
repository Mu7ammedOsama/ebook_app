part of 'featured_books_cubit.dart';

@immutable
abstract class FeaturedBookState {}

class FeaturedBookInitial extends FeaturedBookState {}

class FeaturedBookLoading extends FeaturedBookState {}

class FeaturedBookSuccess extends FeaturedBookState {
  final List<BookEntity> books;

  FeaturedBookSuccess(this.books);
}

class FeaturedBookFailure extends FeaturedBookState {
  final String errorMessage;

  FeaturedBookFailure(this.errorMessage);
}