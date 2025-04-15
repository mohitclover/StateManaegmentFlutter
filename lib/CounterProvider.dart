import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
// Variable without underscore it's behave like public other wise with underscore in variable behave as a private member.
  int _count = 0;

  int getCount() => _count;

//Event that means functions
  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    if(_count>0){
      _count--;
    }
    notifyListeners();
  }
}