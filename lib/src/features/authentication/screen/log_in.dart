import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:deals_dray/src/features/authentication/controllers/reg_controller.dart';
import 'package:deals_dray/src/features/authentication/screen/otp_screen.dart';
import 'package:deals_dray/src/features/authentication/screen/registration_screen.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController _inputController = TextEditingController();
  bool isPhoneSelected = true;
  final RegController regController = Get.put(RegController());

  void _sendCode() {
    final input = _inputController.text.trim();
    if (input.isEmpty) {
      Get.snackbar(
          'Error', 'Please enter a valid phone number or email address');
      return;
    }

    if (isPhoneSelected) {
      RegController.instance.phoneAuthentication(input);

      print('Send code to phone number: $input');
    } else {
      print('Send code to email: $input');
    }
    Get.to(() => OtpScreen());
  }

  void _toggleInputType(int index) {
    setState(() {
      isPhoneSelected = index == 0;
      _inputController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset('assets/logo.png', height: 100),
                  SizedBox(height: 16),
                  ToggleButtons(
                    isSelected: [isPhoneSelected, !isPhoneSelected],
                    borderRadius: BorderRadius.circular(20),
                    selectedColor: Colors.white,
                    fillColor: Colors.red,
                    color: Colors.black,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text('Phone'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text('Email'),
                      ),
                    ],
                    onPressed: _toggleInputType,
                  ),
                  SizedBox(height: 32),
                  Text(
                    'Glad to see you!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    isPhoneSelected
                        ? 'Please provide your phone number'
                        : 'Please provide your email address',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _inputController,
                    keyboardType: isPhoneSelected
                        ? TextInputType.phone
                        : TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: isPhoneSelected ? 'Phone' : 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _sendCode,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red[200],
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('SEND CODE'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => RegistrationScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('REGISTER'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
