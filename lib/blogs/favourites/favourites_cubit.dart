import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../blogs_model/blogs_model.dart';

part 'favourites_state.dart';
part 'favourites_cubit.freezed.dart';

class FavouritesCubit extends Cubit<List<Blogs>> {
  FavouritesCubit() : super([]);

  void addFavorite(Blogs favorite) {
    state.add(favorite);
    emit(List.from(state));
  }

  void removeFavorite(Blogs favorite) {
    state.removeWhere((element) => element.id == favorite.id);
    emit(List.from(state));
  }
}
