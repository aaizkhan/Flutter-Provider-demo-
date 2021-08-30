import 'package:flutter/widgets.dart';

class MyModel extends ChangeNotifier {
  int _mycount = 0;
  int get counter => _mycount;
  void addData() {
    _mycount++;
    notifyListeners();
  }

  void subractData() {
    _mycount--;
    notifyListeners();
  }
}
