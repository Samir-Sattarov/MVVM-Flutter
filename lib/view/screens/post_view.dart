import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/post_view_model.dart';
import '../widget/post_card_widget.dart';

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
