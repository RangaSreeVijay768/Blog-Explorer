import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'blog_details_screen_state.dart';
part 'blog_details_screen_cubit.freezed.dart';

class BlogDetailsScreenCubit extends Cubit<BlogDetailsScreenState> {
  BlogDetailsScreenCubit() : super(const BlogDetailsScreenState.initial());
}
