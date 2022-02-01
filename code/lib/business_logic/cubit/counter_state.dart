part of 'counter_cubit.dart';

// class CounterState {
//   int count;

//   CounterState(this.count);
// }

// @immutable
// abstract class CounterState {}

class CounterState {
  final int count;
  CounterState(this.count);
}

class CounterInitial extends CounterState {
  CounterInitial() : super(0);
}

class CounterIncrement extends CounterState {
  int value;
  CounterIncrement(this.value) : super(value);
}

class CounterDecrement extends CounterState {
  int value;
  CounterDecrement(this.value) : super(value);
}

class CounterReset extends CounterState {
  CounterReset() : super(0);
}
