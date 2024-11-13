import 'package:onix_flutter_signals/onix_flutter_signals.dart';
import 'package:signals/signals.dart';

class ReactiveStateExampleModel extends SignalModel {
  final Signal<int> counter = signal(0);

  ReactiveStateExampleModel() {
    computedValue = Computed<int>(() => 0);
    init();
  }

  void init() {
    counter.value = 3;
  }

  void incrementCounter() {
    counter.value++;
  }
}
