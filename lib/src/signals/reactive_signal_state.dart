import 'package:flutter/material.dart';
import 'package:onix_flutter_signals/src/signals/passive_signal_state.dart';
import 'package:onix_flutter_signals/src/signals/signal_model.dart';
import 'package:signals/signals_flutter.dart';

abstract class ReactiveSignalState<M extends SignalModel,
    W extends StatefulWidget> extends PassiveSignalState<M, W> {
  @override
  Widget buildWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Watch.builder(
      builder: (context) {
        state.value.computedValue.value; // Trigger the computed value
        return buildWidget(context);
      },
      dependencies: [state.value.computedValue],
    );
  }
}
