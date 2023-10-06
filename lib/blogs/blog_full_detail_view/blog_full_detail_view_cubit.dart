import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'blog_full_detail_view_state.dart';
part 'blog_full_detail_view_cubit.freezed.dart';

class BlogFullDetailViewCubit extends Cubit<BlogFullDetailViewState> {
  BlogFullDetailViewCubit() : super(const BlogFullDetailViewState.initial());
}
