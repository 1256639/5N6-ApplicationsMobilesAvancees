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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Demo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 200,
            child: Row(
              children: [
                Expanded(flex: 2, child: Container(color: Colors.red)),
                Expanded(flex: 1, child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(flex: 1, child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(alignment: Alignment.centerLeft ,child: Text('YO', style: TextStyle(color: Colors.red),)),
                      ],
                    )),
                    Expanded(flex: 1, child: Row(
                      children: [
                        Expanded(child: Container(color: Colors.white)),
                        Expanded(child: Container(color: Colors.black)),
                      ],
                    ))
                  ],
                ),)
              ],
            ),
          ),
          ElevatedButton(onPressed: () {}, child: Text('Bouton en bas'))
        ],
      ),
    );
  }
}
