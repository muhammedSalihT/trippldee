import 'package:flutter/material.dart';

class TasksProvider extends ChangeNotifier {
  String? currentCustomDropDownItem;
  List<String> customDropDownItemList = ['View', 'Edit', 'Send', 'Delete'];

  void changeDropDownItem({required String value}) {
    currentCustomDropDownItem = value;
    notifyListeners();
  }
}
