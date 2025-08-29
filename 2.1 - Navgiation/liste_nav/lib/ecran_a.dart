// lib/ecran_a.dart
import 'package:flutter/material.dart';
import 'models/truc.dart';

class EcranA extends StatelessWidget {
  const EcranA({super.key});

  @override
  Widget build(BuildContext context) {
    // Récupération du Truc passé en argument
    final truc = ModalRoute.of(context)!.settings.arguments as Truc;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails du Truc'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ID: ${truc.id}', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 16),
            Text('Nom: ${truc.nom}', style: const TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}