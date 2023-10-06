class Blogs {
  final String id;
  final String title;
  final String image_url;
  bool favourite;

  Blogs({required this.id, required this.title, required this.image_url, this.favourite = false});

  Blogs copyWith({
    String? id,
    String? title,
    String? image_url,
    bool? favourite,
  }) {
    return Blogs(
      id: id ?? this.id,
      title: title ?? this.title,
      image_url: image_url ?? this.image_url,
      favourite: favourite ?? this.favourite,
    );
  }
}
