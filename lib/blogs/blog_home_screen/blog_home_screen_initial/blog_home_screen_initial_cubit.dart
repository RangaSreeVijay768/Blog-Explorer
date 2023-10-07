import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'blog_home_screen_initial_state.dart';
part 'blog_home_screen_initial_cubit.freezed.dart';

class BlogHomeScreenInitialCubit extends Cubit<BlogHomeScreenInitialState> {
  BlogHomeScreenInitialCubit() : super(const BlogHomeScreenInitialState.initial());
}
