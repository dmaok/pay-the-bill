import 'package:flutter/material.dart';

class CounterInputScreen extends StatelessWidget {
  const CounterInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Input'),
      ),
      body: const Center(
        child: Text('Counter Input Screen'),
      ),
    );
  }
}