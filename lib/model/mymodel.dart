import 'package:flutter/widgets.dart';

class MyModel extends ChangeNotifier {
  int _mycount = 0;
  int _valueHolder = 20;
  int get counter => _mycount;
  int get slide => _valueHolder;

  void addData() {
    _mycount++;
    notifyListeners();
  }

  void subractData() {
    _mycount--;
    notifyListeners();
  }

  void sliderData(double newValue) {
    _valueHolder = newValue.round();
    notifyListeners();
  }
}
