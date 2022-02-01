import 'package:bloc/bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  void onIncrement() => emit(CounterIncrement(state.count + 1));
  void onDecrement() => emit(CounterDecrement(state.count - 1));
  void onReset() => emit(CounterReset());
}
