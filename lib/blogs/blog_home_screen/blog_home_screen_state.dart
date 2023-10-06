part of 'blog_home_screen_cubit.dart';

@freezed
class BlogHomeScreenState<T> with _$BlogHomeScreenState<T> {
  const factory BlogHomeScreenState.initial() = _Initial<T>;
  // const factory BlogHomeScreenState.loading() = _Loading<T>;
  const factory BlogHomeScreenState.data(T data) = _Data<T>;
}
