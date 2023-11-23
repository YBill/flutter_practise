import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practise/widget/outline_button.dart';

import 'counting_bloc.dart';
import 'counting_state.dart';

class CountingView extends StatefulWidget {
  const CountingView({super.key});

  @override
  State<CountingView> createState() => _CountingViewState();
}

class _CountingViewState extends State<CountingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Bloc实现'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'The num is:',
              ),
              _renderTitle(),
              const SizedBox(height: 20),
              _renderResetBtn(),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      _handlerAdd();
                    },
                    child: const Text('Add'),
                  ),
                  TextButton(
                    onPressed: () {
                      _handlerMinus();
                    },
                    child: const Text('Minus'),
                  )
                ],
              )
            ],
          ),
        ));
  }

  Widget _renderTitle() {
    return BlocBuilder<CountingBloc, CountingState>(buildWhen: (oldState, newState) {
      // print('------------- BlocBuilder buildWhen -- oldNum = ${oldState.counter}, newNum = ${newState.counter}');
      // true:执行builder,false:不执行builder
      return oldState.counter != newState.counter;
    },
        // builder:第一次执行,后面可能会被buildWhen拦截
        builder: (context, state) {
      // print('------------- BlocBuilder builder -- num = ${state.counter}');
      return Text(
        '${state.counter}',
        style: Theme.of(context).textTheme.headlineMedium,
      );
    });
  }

  Widget _renderResetBtn() {
    // listener同build,listener回调可以做一些逻辑
    return SizedBox(
      width: 100,
      child: BlocConsumer<CountingBloc, CountingState>(listenWhen: (oldState, newState) {
        // print('------------- BlocConsumer listenWhen = ${oldState.resetResponse}-${newState.resetResponse}');
        return oldState.resetResponse != newState.resetResponse;
      }, listener: (context, state) {
        // print('------------- BlocConsumer listener = ${state.resetResponse}');
        if (state.resetResponse == CountingResetResponse.success) {
          _showSuccessDialog();
        }
        context.read<CountingBloc>().resetResetCountingResponse();
      }, buildWhen: (oldState, newState) {
        // print('------------- BlocConsumer buildWhen = ${oldState.screenState}-${newState.screenState}');
        return oldState.screenState != newState.screenState;
      }, builder: (context, state) {
        return OutlinedButtonApp(
            onPressed: _handleClickReset,
            bgColor: const Color(0xFF2D87EF),
            colorText: Colors.white,
            label: 'Reset',
            isLoading: state.screenState == CountingScreenState.loading);
      }),
    );
  }

  void _handleClickReset() {
    context.read<CountingBloc>().reset();
  }

  void _handlerAdd() {
    context.read<CountingBloc>().increment();
  }

  void _handlerMinus() {
    context.read<CountingBloc>().decrement();
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
}
