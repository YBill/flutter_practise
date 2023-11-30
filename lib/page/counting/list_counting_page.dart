import 'package:flutter/material.dart';

import 'bloc/counting_provider.dart';
import 'original/original_counting_view.dart';

class ListCountingPage extends StatelessWidget {
  const ListCountingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: const Text('Counting')),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _renderButton('原生实现', () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const OriginalCountingView()));
            }),
            const SizedBox(height: 20),
            _renderButton('Bloc实现', () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => countingProvider));
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
