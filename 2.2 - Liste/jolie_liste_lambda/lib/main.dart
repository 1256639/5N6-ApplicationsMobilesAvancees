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

  final int count = 20;

  List<int> generateFibonacci(int n) {
    List<int> fib = [];
    for (int i = 0; i < n; i++) {
      if (i <= 1) {
        fib.add(1);
      } else {
        fib.add(fib[i - 1] + fib[i - 2]);
      }
    }
    return fib;
  }

  @override
  Widget build(BuildContext context) {

    final fibNumbers = generateFibonacci(count);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Flutter Demo Home Page',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: fibNumbers.length,
        itemBuilder: (context, index) => ((BuildContext ctx, int i) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Center(
                child: Text(
                  '${fibNumbers[index]}',
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.indigo,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        })(context, index),
      ),
    );
  }
}