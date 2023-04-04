import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'constants.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, Orientation, DeviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Expense Manager',
        theme: ThemeData(
            scaffoldBackgroundColor: kScafoldColor,
            appBarTheme: AppBarTheme(
              backgroundColor: kPrimariColor,
              iconTheme: IconThemeData(size: 23, color: kSecundaryColor),
            ),
            iconTheme: IconThemeData(size: 23, color: kSecundaryColor)),
        home: const HomePage(),
      );
    });
  }
}
