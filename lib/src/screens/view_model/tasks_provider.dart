import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:trippldee_task/src/screens/api/task_view_api.dart';
import 'package:trippldee_task/src/screens/model/profile_info_model.dart';

class TasksProvider extends ChangeNotifier {
  // task 1 data and functions
  String? currentCustomDropDownItem;
  List<String> customDropDownItemList = ['View', 'Edit', 'Send', 'Delete'];

  void changeDropDownItem({required String value}) {
    currentCustomDropDownItem = value;
    notifyListeners();
  }

  // task 2 data and functions

  String currentSelectedCountry = 'IN';
  String currentSelectedState = 'KA';

  Map<String, List<String>> countryStateMap = {
    'IN': ['KA', 'KL', 'TN', 'MH'],
    'US': ['AL', 'DE', 'GA'],
    'CA': ['ON', 'QC', 'BC'],
  };

  List<String> countryList = ['IN', 'US', 'CA'];

  void onChangeCountry({required String value}) {
    currentSelectedCountry = value;
    currentSelectedState = countryStateMap[value]!.first;
    notifyListeners();
  }

  void changeState({required String value}) {
    currentSelectedState = value;
    notifyListeners();
  }

  // task 4 data and functions

  ProfileInfoModel? userData;

  void fetchUserData({required String currentUserId}) async {
    try {
      final data = await TaskViewApi.getUserData(userId: currentUserId);
      if (data != null) {
        userData = data;
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
