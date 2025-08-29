import 'package:flutter/material.dart';
import 'truc.dart';
import 'page_a.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Truc> trucs = [
    const Truc('Pomme', 1),
    const Truc('Banane', 2),
    const Truc('Orange', 3),
    const Truc('Fraise', 4),
    const Truc('Kiwi', 5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Nav truc'),
      ),
      body: ListView.builder(
        itemCount: trucs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(trucs[index].nom),
            subtitle: Text('ID: ' + trucs[index].id.toString()),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageA(truc: trucs[index]),
                  ),
                );
              }
          );
        }
      ),
    );
  }
}
