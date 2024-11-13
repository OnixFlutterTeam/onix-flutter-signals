import 'package:example/signals_examples/passive/signals/passive_state_example_model.dart';
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
  PassiveStateExampleModel createModel() {
    return PassiveStateExampleModel();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Watch(
              (context) => Text(
                '${stateSignals.counter}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
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
