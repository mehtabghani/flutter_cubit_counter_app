import 'package:cubit_counter_app/business_logic/cubit/counter_cubit.dart';
import 'package:cubit_counter_app/presentation/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            // Text(
            //   '${context.watch<CounterCubit>().state.count}',
            //   style: Theme.of(context).textTheme.headline4,
            // ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state is CounterIncrement) {
                  Scaffold.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Counter Incremented.'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                } else if (state is CounterDecrement) {
                  Scaffold.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Counter Decremented.'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                } else if (state is CounterReset) {
                  Scaffold.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Counter Reset.'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return Text(
                  state.count.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (ctx) => const SecondScreen(),
                //   ),
                // );
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => BlocProvider.value(
                      value: BlocProvider.of<CounterCubit>(context),
                      child: const SecondScreen(),
                    ),
                  ),
                );

                //  Navigator.pushNamed(context, SecondScreen.routeName);
              },
              child: const Text(
                'Second screen',
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            _buildFloatingActionButtons(context)
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          heroTag: null,
          onPressed: () {
            context.read<CounterCubit>().onReset();
          },
          tooltip: 'Reset',
          child: const Icon(Icons.undo),
        ),
        FloatingActionButton(
          heroTag: null,
          onPressed: () {
            context.read<CounterCubit>().onDecrement();
          },
          tooltip: 'Decrement',
          child: const Icon(Icons.remove),
        ),
        FloatingActionButton(
          heroTag: null,
          onPressed: () {
            context.read<CounterCubit>().onIncrement();
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
