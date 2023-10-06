part of 'favourites_cubit.dart';

@freezed
class FavouritesState with _$FavouritesState {
  const factory FavouritesState.initial({required bool isLiked}) = _Initial;
}
