import 'package:flutter/material.dart';

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

  List<String> names = ['Alice', 'Bob', 'Charlie', 'David', 'Eve'];
  List<String> sortedNames = [];
  bool isOrdered = false;

  @override
  void initState() {
    super.initState();
    sortedNames = List.from(names);
    sortedNames.sort();
    shuffleNames();
  }

  void shuffleNames() {
    setState(() {;
      names.shuffle();
      checkOrder();
    });
  }

  void moveUp(int index) {
    if (index > 0) {
      setState(() {
        final temp = names[index - 1];
        names[index - 1] = names[index];
        names[index] = temp;
        checkOrder();
      });
    }
  }

  void moveDown(int index) {
    if (index < names.length - 1) {
      setState(() {
        final temp = names[index + 1];
        names[index + 1] = names[index];
        names[index] = temp;
        checkOrder();
      });
    }
  }

  void checkOrder() {
    bool ordered = true;
    for (int i = 0; i < names.length; i++){
      if (names[i] != sortedNames[i]){
        ordered = false;
        break;
      }
    }
    setState(() {
      isOrdered = ordered;
    });

    if (isOrdered) {
      shuffleNames();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Liste de noms'),
      ),
      body: Column(
        children: [
          if (isOrdered)
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(16),
              color: Colors.green,
              child: const Text(
                'Liste ordonnée !',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: names.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(
                      names[index],
                      style: const TextStyle(fontSize: 18),
                    ),
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_upward),
                      onPressed: index > 0 ? () => moveUp(index) : null,
                      color: index > 0 ? Colors.blue : Colors.grey,
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.arrow_downward),
                      onPressed: index < names.length - 1 ? () => moveDown(index) : null,
                      color: index < names.length - 1 ? Colors.blue : Colors.grey,
                    ),
                  ),
                );
              }
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: shuffleNames,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text('Mélanger', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
