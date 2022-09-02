import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Provider.of<HomeViewModel>(context, listen: true)
                  .counter
                  .toString(),
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<HomeViewModel>(context, listen: false)
                    .incrementCounter();
              },
              child: const Text('+'),
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<HomeViewModel>(context, listen: false)
                    .decrementCounter();
              },
              child: const Text('-'),
            ),
          ],
        ),
      ),
    );
  }
}
