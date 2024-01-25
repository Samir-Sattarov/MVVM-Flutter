import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/core/repositories/post/post_repository.dart';

import '../model/post_results.dart';

class PostViewModel extends ChangeNotifier {
  final PostRepository postRepository;

  PostViewModel(this.postRepository);

  late PostResults _results = PostResults.empty();

  PostResults get results => _results;

  load() async {
    final response = await postRepository.getPostsResults();

    _results = response;

    notifyListeners();
  }
}
