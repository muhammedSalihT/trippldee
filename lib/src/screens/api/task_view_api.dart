import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:trippldee_task/src/screens/model/profile_info_model.dart';

class TaskViewApi {
  static Dio client = Dio();

  static Future<ProfileInfoModel?> getUserData({required String userId}) async {
    try {
      final response = await client.get("https://reqres.in/api/users/$userId");
      if (response.statusCode == 200) {
        log(response.data.toString());
        return ProfileInfoModel.fromJson(response.data);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
