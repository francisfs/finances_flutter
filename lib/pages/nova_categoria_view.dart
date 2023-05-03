import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NovaCategoriaView extends StatefulWidget {
  const NovaCategoriaView({super.key});

  @override
  State<NovaCategoriaView> createState() => _NovaCategoriaViewState();
}

class _NovaCategoriaViewState extends State<NovaCategoriaView> {
  TextEditingController nameController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('categoria'),
      ),
      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(hintText: 'adicione categoria'),
          ),
          ElevatedButton(onPressed: () {}, child: const Text("salvar"))
        ],
      ),
    );
  }
}
