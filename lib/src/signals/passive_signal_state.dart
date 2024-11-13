import 'package:flutter/material.dart';
import 'package:onix_flutter_signals/src/signals/signal_model.dart';
import 'package:signals/signals_flutter.dart';

abstract class PassiveSignalState<M extends SignalModel,
    W extends StatefulWidget> extends State<W> {
  late final Signal<M> state;
  late final M model;
  M get stateSignals => state.value;

  @override
  void initState() {
    super.initState();

    model = createModel();

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
