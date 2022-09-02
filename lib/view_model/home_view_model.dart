import 'dart:math';

import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  incrementCounter() async {
    _counter++;
    print('+');
    notifyListeners();
  }

  decrementCounter() async {
    _counter = max(_counter - 1, 0);
    print('-');

    notifyListeners();
  }
}
