import 'package:deals_dray/src/features/authentication/controllers/otp_controller.dart';
import 'package:deals_dray/src/features/authentication/controllers/reg_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:deals_dray/src/features/authentication/screen/home_screen.dart';
import 'package:deals_dray/src/features/authentication/screen/log_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late Timer _timer;
  int _start = 120; // 2 minutes countdown

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var controller;
    var otp;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/OTP_img.png', // Replace with your own image
              height: 100,
            ),
            SizedBox(height: 20),
            Text(
              "OTP Verification",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            const Text(
              "We have sent a unique OTP number  ",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              OtpTextField(
                onSubmit: (code) {
                  otp = code;
                  OtpController.instance.verifyOTP(otp);
                },
              )
            ]),
            SizedBox(height: 20),
            Text(
              "${_start ~/ 60} : ${(_start % 60).toString().padLeft(2, '0')}",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: _start == 0 ? _resendOTP : null,
              child: Text(
                "SEND AGAIN",
                style: TextStyle(
                  fontSize: 16,
                  color: _start == 0 ? Colors.blue : Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOTPField() {
    return Container(
      width: 50,
      child: TextField(
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          counterText: '',
        ),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      ),
    );
  }

  void _resendOTP() {
    setState(() {
      _start = 120; // Reset timer to 2 minutes
    });
    startTimer();
  }
}
