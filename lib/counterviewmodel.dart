import 'package:flutter/foundation.dart';

class CounterViewModel extends ChangeNotifier{
  int _counter=0;
  int get counter{
      return _counter;
  }

  set counter(int counter){
    this._counter = counter;
  }

  void increment(){
    this._counter++;
    notifyListeners();
  }

  void decrement(){
    this._counter--;
    notifyListeners();
  }
}