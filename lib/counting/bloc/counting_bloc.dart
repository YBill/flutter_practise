import 'package:flutter_bloc/flutter_bloc.dart';

import 'counting_state.dart';

class CountingBloc extends Cubit<CountingState> {
  CountingBloc() : super(const CountingState());

  void increment() {
    int counter = state.counter;
    emit(state.copyWith(counter: counter + 1));
  }

  void decrement() {
    int counter = state.counter;
    emit(state.copyWith(counter: counter - 1));
  }

  Future<void> reset() async {
    emit(state.copyWith(screenState: CountingScreenState.loading));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(counter: 0, screenState: CountingScreenState.success, resetResponse: CountingResetResponse.success));
  }

  void resetResetCountingResponse() {
    if (state.resetResponse != CountingResetResponse.none) {
      emit(state.copyWith(resetResponse: CountingResetResponse.none));
    }
  }
}
