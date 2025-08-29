// lib/ecran_accueil.dart
import 'package:flutter/material.dart';
import 'models/truc.dart';

class EcranAccueil extends StatelessWidget {
  const EcranAccueil({super.key});

  // Liste de 5 objets Truc
  static final List<Truc> trucs = [
    const Truc(id: 1, nom: "Premier truc"),
    const Truc(id: 2, nom: "Deuxième truc"),
    const Truc(id: 3, nom: "Troisième truc"),
    const Truc(id: 4, nom: "Quatrième truc"),
    const Truc(id: 5, nom: "Cinquième truc"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Écran Accueil'),
      ),
      body: ListView.builder(
        itemCount: trucs.length,
        itemBuilder: (context, index) {
          final truc = trucs[index];
          return ListTile(
            title: Text(truc.nom),
            subtitle: Text('ID: ${truc.id}'),
            onTap: () {
              // Navigation vers l'écran A avec le truc sélectionné
              Navigator.pushNamed(
                context,
                '/ecran_a',
                arguments: truc,
              );
            },
          );
        },
      ),
    );
  }
}