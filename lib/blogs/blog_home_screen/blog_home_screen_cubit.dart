import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;

import '../blogs_model/blogs_model.dart';

part 'blog_home_screen_state.dart';
part 'blog_home_screen_cubit.freezed.dart';

class BlogHomeScreenCubit extends Cubit<BlogHomeScreenState<List<Blogs>>> {
  BlogHomeScreenCubit() : super(const BlogHomeScreenState.initial());

  Future<void> fetchData() async {
    const String adminSecret = '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';
    try {
      final response = await http.get(
          Uri.parse('https://intent-kit-16.hasura.app/api/rest/blogs'),
          headers: {
            'x-hasura-admin-secret': adminSecret,
          });
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(
            response.body)['blogs']; // You can parse the data here if needed
        final List<Blogs> blogs = responseData.map((data) {
          return Blogs(
            id: data['id'],
            title: data['title'],
            image_url: data['image_url'],
          );
        }).toList();
        emit(BlogHomeScreenState.data(blogs));
      }
      else {
        emit(const BlogHomeScreenState.apiError());
        // Handle error here if needed
      }
    } catch (e) {
      emit(const BlogHomeScreenState.error());
      // Handle error here if needed
    }
  }

  void toggleLike(String postId) {
    final initialState = state;
    if (initialState is _Data<List<Blogs>>) {
      final likedBlogs = initialState.data
          .map((blog) => blog.id == postId
          ? blog.copyWith(favourite: !blog.favourite)
          : blog)
          .toList();
      emit(BlogHomeScreenState.data(likedBlogs));
    }
  }

// void toggleFavorite(Blogs fav) {
//   final updatedFavorites = [...state.data];
//   if (updatedFavorites.contains(item)) {
//     updatedFavorites.remove(item);
//   } else {
//     updatedFavorites.add(item);
//   }
//   emit(state.copyWith(favorites: updatedFavorites));
// }
}