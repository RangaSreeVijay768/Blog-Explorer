import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'blog_home_screen_internet_error_state.dart';
part 'blog_home_screen_internet_error_cubit.freezed.dart';

class BlogHomeScreenInternetErrorCubit extends Cubit<BlogHomeScreenInternetErrorState> {
  BlogHomeScreenInternetErrorCubit() : super(const BlogHomeScreenInternetErrorState.initial());
}
