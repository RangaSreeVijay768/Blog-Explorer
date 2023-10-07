part of 'blog_home_screen_cubit.dart';

@freezed
class BlogHomeScreenState<T> with _$BlogHomeScreenState<T> {
  const factory BlogHomeScreenState.initial() = _Initial;
  const factory BlogHomeScreenState.error() = _error;
  const factory BlogHomeScreenState.data(T data) = _Data;
  const factory BlogHomeScreenState.apiError() = _apiError;
}
