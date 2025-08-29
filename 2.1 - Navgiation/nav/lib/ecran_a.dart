import 'package:flutter/material.dart';

class EcranA extends StatefulWidget {
  final String valeurPassee;

  // Making valeurPassee optional with default empty string
  const EcranA({Key? key, this.valeurPassee = ''}) : super(key: key);

  @override
  State<EcranA> createState() => _EcranAState();
}

class _EcranAState extends State<EcranA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ecran A'),
      ),
      body: Center(
        child: widget.valeurPassee.isNotEmpty
            ? Text('Valeur: ' + widget.valeurPassee.toString())
            : const Text('Tu as navigué vers A'),
      ),
    );
  }
}