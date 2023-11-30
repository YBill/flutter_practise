import 'package:flutter/material.dart';
import 'package:flutter_practise/page/counting/list_counting_page.dart';
import 'package:flutter_practise/page/gridview/gridview_page.dart';

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
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: Text(title)),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _renderButton('Counting', () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ListCountingPage()));
            }),
            const SizedBox(height: 20),
            _renderButton('GridView', () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const GridViewPage()));
            })
          ],
        )));
  }

  Widget _renderButton(String title, VoidCallback onPressed) {
    return OutlinedButton(
      onPressed: () {
        onPressed();
      },
      child: Text(title),
    );
  }
}
