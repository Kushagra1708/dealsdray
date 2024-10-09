import 'package:deals_dray/src/exception/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:deals_dray/src/features/authentication/screen/log_in.dart';

class RegController extends GetXController {
  static RegController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final referral = TextEditingController();
  final phoneNo = TextEditingController();

  void registerUser(String email, String password) {
    String? error = AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password) as String;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(message: error.toString()));
    }
  }

  void phoneAuthentication(String input) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo as String);
  }
}

class GetXController {}
