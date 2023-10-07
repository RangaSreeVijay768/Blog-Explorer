import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../blogs_model/blogs_model.dart';

part 'favourites_state.dart';
part 'favourites_cubit.freezed.dart';

class FavouritesCubit extends Cubit<FavouritesState<List<Blogs>>> {
  FavouritesCubit() : super(const FavouritesState.initial());
}
