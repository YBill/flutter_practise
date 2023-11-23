import 'package:flutter/material.dart';
import 'package:flutter_practise/counting/bloc/counting_state.dart';
import 'package:flutter_practise/widget/outline_button.dart';

class OriginalCountingView extends StatefulWidget {
  const OriginalCountingView({super.key});

  @override
  State<OriginalCountingView> createState() => _OriginalCountingViewState();
}

class _OriginalCountingViewState extends State<OriginalCountingView> {
  late int _counter;
  late CountingScreenState _screenState;
  late CountingResetResponse _resetResponse;

  @override
  void initState() {
    super.initState();
    _counter = 0;
    _screenState = CountingScreenState.none;
    _resetResponse = CountingResetResponse.none;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('原生实现'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'The num is:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 20),
              _renderResetBtn(),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      _incrementCounter();
                    },
                    child: const Text('Add'),
                  ),
                  TextButton(
                    onPressed: () {
                      _minusCounter();
                    },
                    child: const Text('Minus'),
                  )
                ],
              )
            ],
          ),
        ));
  }

  Widget _renderResetBtn() {
    return SizedBox(
        width: 100,
        child: OutlinedButtonApp(
            onPressed: _handleClickReset,
            bgColor: const Color(0xFF2D87EF),
            colorText: Colors.white,
            label: 'Reset',
            isLoading: _screenState == CountingScreenState.loading));
  }

  void _showSuccessDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Reset Success'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'))
            ],
          );
        });
  }

  Future<void> _handleClickReset() async {
    setState(() {
      _screenState = CountingScreenState.loading;
    });

    await Future.delayed(const Duration(seconds: 2));

    _counter = 0;
    _screenState = CountingScreenState.success;
    _resetResponse = CountingResetResponse.success;
    setState(() {});
    if (_resetResponse == CountingResetResponse.success) {
      _showSuccessDialog();
    }
    _resetResponse = CountingResetResponse.none;
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _minusCounter() {
    setState(() {
      _counter--;
    });
  }
}
