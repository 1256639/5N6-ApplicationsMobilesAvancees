// lib/page_a.dart
import 'package:flutter/material.dart';

class PageA extends StatelessWidget {
  final String message;
  const PageA({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final display = message.isEmpty ? 'aucun texte' : message;
    return Scaffold(
      appBar: AppBar(title: const Text('Page A')),
      body: Center(
        child: Text(
          display,
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}