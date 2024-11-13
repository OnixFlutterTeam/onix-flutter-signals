import 'package:flutter/material.dart';
import 'package:onix_flutter_signals/src/signals/signal_model.dart';
import 'package:signals/signals_flutter.dart';

abstract class PassiveSignalState<M extends SignalModel,
    W extends StatefulWidget> extends State<W> {
  late Signal<M> state;
  M get stateSignals => state.value;

  @override
  void initState() {
    super.initState();

    final model = createModel();

    state = signal(model);
  }

  M createModel();

  @override
  void dispose() {
    state.dispose();
    super.dispose();
  }

  Widget buildWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return buildWidget(context);
  }
}
