import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/core/repositories/post/post_repository.dart';

import '../model/post_results.dart';


class PostViewModel extends ChangeNotifier {
  final PostRepository postRepository;

  PostViewModel(this.postRepository);

  bool enableError = false;
  bool enableSuccess = false;

  late PostResults _results = PostResults.empty();

  PostResults get results => _results;

  load() async {
    try {
      final response = await postRepository.getPostsResults();
      _viewSuccess();

      _results = response;

      notifyListeners();
    } catch (error) {
      _viewError();
    }
  }

  _viewError() async {
    enableError = true;
    notifyListeners();
    await Future.delayed(
      const Duration(seconds: 1),
          () {
        enableError = false;
        notifyListeners();
      },
    );
  }

  _viewSuccess() async {
    enableSuccess = true;
    notifyListeners();
    await Future.delayed(
      const Duration(seconds: 1),
          () {
        enableSuccess = false;
        notifyListeners();
      },
    );
  }
}