import 'package:flutter/material.dart';
import 'package:flutter_practise/page/getit/di/factory_manager.dart';
import 'package:flutter_practise/widget/outline_button.dart';

class GetItUsePage extends StatefulWidget {
  const GetItUsePage({super.key});

  @override
  State<GetItUsePage> createState() => _GetItUsePageState();
}

class _GetItUsePageState extends State<GetItUsePage> {
  int _responseData = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: const Text('GeIt Use')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'The response data is:',
              ),
              Text(
                '$_responseData',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 30),
              _renderGetDataBtn(),
            ],
          ),
        ));
  }

  Widget _renderGetDataBtn() {
    return SizedBox(
      width: 100,
      child: OutlinedButtonApp(
        onPressed: _handleClickReset,
        bgColor: const Color(0xFF2D87EF),
        colorText: Colors.white,
        label: 'Get',
        isLoading: false,
      ),
    );
  }

  Future<void> _handleClickReset() async {
    final userRepo = FactoryManager.provideDioUserRepo();
    _responseData = await userRepo.getData(1);
    setState(() {});
  }
}
