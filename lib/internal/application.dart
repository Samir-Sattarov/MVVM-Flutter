import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/view_model/post_view_model.dart';
import 'package:provider/provider.dart';

import '../locator/locator.dart';
import '../view/screens/post_view.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late PostViewModel postViewModel ;

  @override
  void initState() {
    postViewModel = locator();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: postViewModel),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          useMaterial3: false,
        ),
        home: const PostView(),
      ),
    );
  }
}
