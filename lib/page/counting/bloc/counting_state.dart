enum CountingScreenState {
  none,
  loading,
  failed,
  success,
}

enum CountingResetResponse {
  none,
  failed,
  success,
}

class CountingState {
  final int counter;
  final CountingScreenState screenState;
  final CountingResetResponse resetResponse;

  const CountingState({this.counter = 0, this.screenState = CountingScreenState.none, this.resetResponse = CountingResetResponse.none});

  CountingState copyWith({int? counter, CountingScreenState? screenState, CountingResetResponse? resetResponse}) {
    return CountingState(
      counter: counter ?? this.counter,
      screenState: screenState ?? this.screenState,
      resetResponse: resetResponse ?? this.resetResponse,
    );
  }
}
