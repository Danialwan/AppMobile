import 'package:flutter/material.dart';
import 'signup.dart';
import 'signIn.dart';
import 'landing_page.dart';
import 'detailPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Lobsterindo';
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SignIn(), // Halaman pendaftaran sebagai halaman awal
        '/register': (context) =>
            SignUp(), // Halaman pendaftaran sebagai halaman awal
        '/landing': (context) => LandingPage(), // Routing ke halaman pendaratan
      },
    );
  }
}
