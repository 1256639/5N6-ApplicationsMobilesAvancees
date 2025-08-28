import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'plein_de_containers',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'plein_de_containers'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.black12,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              height: 200,
              color: Colors.red,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: double.infinity,
              height: 200,
              color: Colors.blue,
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, top: 10, right: 10, bottom: 5),
              width: double.infinity,
              height: 200,
              color: Colors.green,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              height: 200,
              color: Colors.yellow,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: double.infinity,
              height: 200,
              color: Colors.orange,
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, top: 10, right: 10, bottom: 5),
              width: double.infinity,
              height: 200,
              color: Colors.purple,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              height: 200,
              color: Colors.cyan,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: double.infinity,
              height: 200,
              color: Colors.pink,
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, top: 10, right: 10, bottom: 5),
              width: double.infinity,
              height: 200,
              color: Colors.lime,
            ),
            Container(
                margin: const EdgeInsets.all(10),
                width: double.infinity,
                height: 200,
                color: Colors.greenAccent
            ),
          ],
        ),
      ),
    );
  }
}
