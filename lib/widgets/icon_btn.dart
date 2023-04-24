
import 'package:flutter/material.dart';

class CustonBtn extends StatelessWidget {
  const CustonBtn({super.key, required this.onPress, required this.iconData});
  final VoidCallback onPress;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPress,
      icon: Icon(iconData),
    );
  }
}
