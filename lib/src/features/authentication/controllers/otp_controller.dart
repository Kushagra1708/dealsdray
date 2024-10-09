import 'package:deals_dray/src/features/authentication/controllers/getx_controller.dart';
import 'package:deals_dray/src/features/authentication/controllers/reg_controller.dart';
import 'package:deals_dray/src/features/authentication/screen/home_screen.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:deals_dray/src/exception/authentication_repository.dart';
import 'package:deals_dray/src/features/authentication/controllers/otp_controller.dart';

import 'getx_controller.dart';

class OtpController extends GetXController {
  static OtpController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(HomeScreen()) : Get.back();
  }
}
