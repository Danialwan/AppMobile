import 'package:flutter/material.dart';
<<<<<<< HEAD:Flutter Project/alwan/lib/page/main.dart
import 'signup.dart';
import 'signIn.dart';
import 'landing_page.dart';
import 'detailPage.dart';
=======
import 'page/signin.dart';
import 'page/landing_page.dart';
import 'page/detailPage.dart';
import 'page/signup.dart';
>>>>>>> a81bcac4a14270055a586d2dca9837f09267084e:alwan/lib/main.dart

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
<<<<<<< HEAD:Flutter Project/alwan/lib/page/main.dart
        '/': (context) => SignIn(), // Halaman pendaftaran sebagai halaman awal
        '/register': (context) =>
            SignUp(), // Halaman pendaftaran sebagai halaman awal
=======
        '/': (context) => SignInPage2(), // Halaman login sebagai halaman awal
        '/register': (context) => SignUp(), // Halaman pendaftaran sebagai halaman awal
>>>>>>> a81bcac4a14270055a586d2dca9837f09267084e:alwan/lib/main.dart
        '/landing': (context) => LandingPage(), // Routing ke halaman pendaratan
      },
    );
  }
}
