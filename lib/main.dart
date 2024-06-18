import 'package:flutter/material.dart';
import 'page/signin.dart';
import 'page/signup.dart';
import 'page/landing_page.dart';
import 'page/partnership.dart';
import 'page/budidaya.dart';

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
        '/': (context) => SignIn(), // Halaman login sebagai halaman awal
        '/register': (context) => SignUp(), // Halaman pendaftaran sebagai halaman awal
        '/landing': (context) => LandingPage(), // Routing ke halaman pendaratan
        '/partnership': (context) => PartnershipPage(), // Routing ke halaman partnership
        '/budidaya': (context) => BudidayaPage(), // Routing ke halaman budidaya
      },
    );
  }
}
