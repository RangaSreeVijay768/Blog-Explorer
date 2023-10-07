import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'blog_home_screen_server_error_state.dart';
part 'blog_home_screen_server_error_cubit.freezed.dart';

class BlogHomeScreenServerErrorCubit extends Cubit<BlogHomeScreenServerErrorState> {
  BlogHomeScreenServerErrorCubit() : super(const BlogHomeScreenServerErrorState.initial());
}
