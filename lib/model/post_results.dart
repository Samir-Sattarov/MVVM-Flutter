import 'post.dart';

class PostResults {
  final List<Post> posts;

  PostResults({
    required this.posts,
  });

  factory PostResults.empty() {
    return PostResults(posts: []);
  }

  factory PostResults.fromJson(List json) => PostResults(
        posts: json.map((e) => Post.fromJson(e)).toList(),
      );
}
