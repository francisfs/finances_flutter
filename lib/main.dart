import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'constants.dart';
import 'pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gerenciador de Despesas',
        theme: ThemeData(
            scaffoldBackgroundColor: kScafoldColor,
            appBarTheme: const AppBarTheme(
              backgroundColor: kPrimariColor,
              iconTheme: IconThemeData(size: 23, color: kSecundaryColor),
            ),
            iconTheme: const IconThemeData(size: 23, color: kSecundaryColor)),
        home: const HomePage(),
      );
    });
  }
}
