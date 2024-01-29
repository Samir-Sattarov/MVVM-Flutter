import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/core/widgets/error_flash_bar.dart';
import 'package:flutter_mvvm_example/core/widgets/success_flash_bar.dart';
import 'package:provider/provider.dart';

import '../../view_model/post_view_model.dart';
import '../widget/post_card_widget.dart';


//
// class PostViewModel extends ChangeNotifier {
//   final PostRepository postRepository;
//
//   PostViewModel(this.postRepository);
//
//   bool enableError = false;
//   bool enableSuccess = false;
//
//   late PostResults _results = PostResults.empty();
//
//   PostResults get results => _results;
//
//   load() async {
//     try {
//       final response = await postRepository.getPostsResults();
//       _viewSuccess();
//
//       _results = response;
//
//       notifyListeners();
//     } catch (error) {
//       _viewError();
//     }
//   }
//
//   _viewError() async {
//     enableError = true;
//     notifyListeners();
//     await Future.delayed(
//       const Duration(seconds: 1),
//           () {
//         enableError = false;
//         notifyListeners();
//       },
//     );
//   }
//
//   _viewSuccess() async {
//     enableSuccess = true;
//     notifyListeners();
//     await Future.delayed(
//       const Duration(seconds: 1),
//           () {
//         enableSuccess = false;
//         notifyListeners();
//       },
//     );
//   }
// }



class PostView extends StatefulWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  void initState() {
    context.read<PostViewModel>().load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final postProvider = context.read<PostViewModel>();
    final postProviderWatch = context.watch<PostViewModel>();

    if (mounted) {
      Future.delayed(
        Duration.zero,
        () {
          if (postProviderWatch.enableSuccess) {
            SuccessFlushBar("Success").show(context);
          }
          if (postProviderWatch.enableError) {
            ErrorFlushBar("Error").show(context);
          }
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts View"),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          physics: ClampingScrollPhysics(),
          itemCount: context.watch<PostViewModel>().results.posts.length,
          itemBuilder: (context, index) {
            final item = postProvider.results.posts[index];
            return PostCardWidget(
              entity: item,
            );
          },
        ),
      ),
    );
  }
}
