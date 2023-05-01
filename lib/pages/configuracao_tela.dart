import 'package:flutter/material.dart';
import 'package:finances_flutter/constants.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ConfigutarionView extends StatelessWidget {
  const ConfigutarionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('configuration'),
      ),
    );
  }
}
