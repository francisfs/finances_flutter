import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

const Color kScafoldColor = Color.fromARGB(255, 26, 37, 26);
const Color kPrimariColor = Color.fromARGB(196, 12, 163, 250);
const Color kSecundaryColor = Color.fromARGB(255, 32, 37, 42);
const Color kTextColor = Color(0xFFFFFFFF);

final kMargin = EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h);
final kPadding = EdgeInsets.all(2.h);
final kRadius = BorderRadius.circular(2.h);

Color setupColor(double porcentagem) {
  if (porcentagem >= 0.80) {
    return kSecundaryColor;
  } else if (porcentagem >= 0.25) {
    return Colors.orange;
  }
  return Colors.red;
}
