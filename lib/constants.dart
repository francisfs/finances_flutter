import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

const Color kScafoldColor = Color(0xFF1C2833);
const Color kPrimariColor = Color(0xFF17202A);
const Color kSecundaryColor = Color(0xFF3283DF);
const Color kTextColor = Color(0xFFFFFFFF);

final kMargin = EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h);
final kPadding = EdgeInsets.all(2.h);
final kRadius = BorderRadius.circular(2.h);

Color setupColor(double percentage) {
  if (percentage >= 0.50) {
    return kScafoldColor;
  } else if (percentage >= 0.25) {
    return Colors.orange;
  }
  return Colors.red;
}
