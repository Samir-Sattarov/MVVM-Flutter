import 'dart:math';

import 'package:flutter/material.dart';

import '../storage/shared_storage.dart';

class HomeViewModel extends ChangeNotifier {
  final SharedStorage sharedStorage = SharedStorage();
  int _counter = 0;
  int get counter => _counter;
  final _counterKey = 'counter';

  HomeViewModel() {
    loadValue();
  }

  loadValue() async {
    final String? savedValue = await sharedStorage.fetchValue(key: _counterKey);
    _counter = savedValue != null ? int.parse(savedValue) : 0;
  }

  incrementCounter() async {
    _counter++;
    sharedStorage.saveValue(key: _counterKey, value: _counter.toString());

    notifyListeners();
  }

  decrementCounter() async {
    _counter = max(_counter - 1, 0);
    sharedStorage.saveValue(key: _counterKey, value: _counter.toString());

    notifyListeners();
  }
}
