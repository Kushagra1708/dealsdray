import 'package:deals_dray/src/features/authentication/screen/log_in.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    startWait(); // Start the delay and navigation process
  }

  Future<void> startWait() async {
    // Delay for 3 seconds
    await Future.delayed(const Duration(seconds: 3));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LogIn()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Positioned(
              child: Image(
            image: AssetImage('assets/splash_img.jpg'),
            fit: BoxFit.cover,
          )),
        ],
      ),
    );
  }
}
