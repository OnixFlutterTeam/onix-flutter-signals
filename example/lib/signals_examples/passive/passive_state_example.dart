import 'package:example/signals_examples/passive/signals/passive_state_example_model.dart';
import 'package:example/signals_examples/reactive/reactive_state_example.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_signals/onix_flutter_signals.dart';
import 'package:signals/signals_flutter.dart';

class PassiveStateExample extends StatefulWidget {
  const PassiveStateExample({super.key});

  @override
  State<PassiveStateExample> createState() => _PassiveStateExampleState();
}

class _PassiveStateExampleState
    extends PassiveSignalState<PassiveStateExampleModel, PassiveStateExample> {
  @override
  PassiveStateExampleModel createModel() => PassiveStateExampleModel();

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Passive State Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),

            /// This is a passive signal, so it will not update the child widget
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

            /// This is a reactive signal, so it will update the child widget
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
                      builder: (context) => const ReactiveStateExample(),
                    )),
                child: const Text('Switch to ReactiveState')),
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
