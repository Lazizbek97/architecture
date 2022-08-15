import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Defualt app project"),
      ),
      body: const Center(
        child: Text(
          "This is Launcher page",
          style: TextStyle(color: Colors.green),
        ),
      ),
    );
  }
}
