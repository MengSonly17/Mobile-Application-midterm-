// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:pos_mobile/screens/login_screen.dart';
// import 'package:pos_mobile/screens/main_screen.dart';
// import 'dart:async';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Future.delayed(Duration(seconds: 3), () {
//         Navigator.push(
//           context,
//           //MaterialPageRoute(builder: (context) => MainScreen()),
//           MaterialPageRoute(builder: (context) => LoginScreen()),
//         );
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
// children: [
//   Image.asset('assets/images/pos_logo.png', width: 150, height: 150),
//   // SizedBox(height: 20),
//   // Text(
//   //   'Welcome to POS Mobile',
//   //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//   // ),
//   LoadingText(),
// ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/pos_logo.png', width: 150, height: 150),
            // SizedBox(height: 20),
            // Text(
            //   'Welcome to POS Mobile',
            //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            // ),
            LoadingText(),
          ],
        ),
      ),
    );
  }
}

class LoadingText extends StatefulWidget {
  const LoadingText({super.key});

  @override
  State<LoadingText> createState() => _LoadingTextState();
}

class _LoadingTextState extends State<LoadingText> {
  String _dots = "";
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
      setState(() {
        if (_dots.length < 3) {
          _dots += ".";
        } else {
          _dots = "";
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "Loading$_dots",
      style: const TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
