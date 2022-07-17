import 'package:flutter/material.dart';

class WebScreenLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("This is app bar"),
      ),
      body: const Center(
        child: Text("web Screen"),
      ),
    );
  }
}
