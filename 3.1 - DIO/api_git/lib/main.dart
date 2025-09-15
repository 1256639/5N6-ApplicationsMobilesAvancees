import 'package:api_git/lib_http.dart';
import 'package:api_git/transfer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Git repos',
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

  final TextEditingController usernameController = TextEditingController();
  final HttpService httpService = HttpService();
  List<Repository> _repositories = [];
  bool isLoading = false;
  String errorMessage = '';

  Future<void> fetchRepositories() async {
    if (usernameController.text.isEmpty) return;

    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      final repositories = await httpService.getUserRepositories(usernameController.text);
      setState(() {
        _repositories = repositories;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Git repo'),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Github username',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(onPressed: fetchRepositories, child: Text('Search repos'),),

            const SizedBox(height: 16),

            if (isLoading)
              CircularProgressIndicator()
            else if (errorMessage.isNotEmpty)
              Text(errorMessage, style: TextStyle(color: Colors.red))
            else
              Expanded(
                child: ListView.builder(
                  itemCount: _repositories.length,
                  itemBuilder: (context, index) {
                    final repo = _repositories[index];
                    return ListTile(
                      title: Text(repo.name),
                      subtitle: Text(repo.private ? 'Private' : 'Public'),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
