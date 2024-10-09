import 'package:flutter/material.dart';

class GetxController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OTP Screen')),
      body: Center(
        child: const Text(
          'Welcome to the OTP Screen Screen!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
