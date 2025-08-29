import 'package:flutter/material.dart';
import 'ecran_a.dart';
import 'ecran_accueil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const EcranAccueil(),
      routes: routes(),
    );
  }

  Map<String, WidgetBuilder> routes() {
    return {
      '/ecran_a': (context) => const EcranA(),
      '/ecran_accueil': (context) => const EcranAccueil(),
    };
  }
}
