import 'package:flutter_mvvm_example/core/api/api_constants.dart';

import '../../../model/post_results.dart';
import '../../api/api_client.dart';

abstract class PostRepository {
  Future<PostResults> getPostsResults();
}

class PostRepositoryImpl extends PostRepository {
  final ApiClient api;

  PostRepositoryImpl(this.api);

  @override
  Future<PostResults> getPostsResults() async {
    final response = await api.get(
      ApiConstants.posts,
      {},
    );

    final model = PostResults.fromJson(response);

    return model;
  }
}
