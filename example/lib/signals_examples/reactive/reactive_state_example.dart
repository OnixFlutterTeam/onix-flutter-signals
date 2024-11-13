import 'package:example/signals_examples/passive/passive_state_example.dart';
import 'package:example/signals_examples/reactive/signals/reactive_state_example_model.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_signals/onix_flutter_signals.dart';
import 'package:signals/signals_flutter.dart';

class ReactiveStateExample extends StatefulWidget {
  const ReactiveStateExample({super.key});

  @override
  State<ReactiveStateExample> createState() => _ReactiveStateExampleState();
}

class _ReactiveStateExampleState extends ReactiveSignalState<
    ReactiveStateExampleModel, ReactiveStateExample> {
  @override
  ReactiveStateExampleModel createModel() => ReactiveStateExampleModel();

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reactive State Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),

            /// This is a passive signal, but with ReactiveSignalState it will
            /// update the child widget
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Passive: ',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  '${stateSignals.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),

            /// No need to wrap the Text widget with a SignalWatch widget
            /// because ReactiveSignalState will update the child widget
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Reactive (wrapped with Watch): ',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Watch(
                  (context) => Text(
                    '${stateSignals.counter}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () =>
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const PassiveStateExample(),
                    )),
                child: const Text('Switch to PassiveState')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => model.incrementCounter(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
