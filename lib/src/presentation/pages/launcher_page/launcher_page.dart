import 'package:flutter/material.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Defualt app"),
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
