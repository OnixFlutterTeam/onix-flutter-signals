## Features

This package contains some base classes designed to improve experience of using Signals state
management.

- `PassiveSignalState` - a state class that doesn't automatically rebuild the widget on model changes. You have to wrap widgets that should be rebuilt with `Watch` or `Watch.builder`. There is also the .watch(context) extension method that can be used to rebuild a widget when a signal changes.
- `ReactiveSignalState` - a state class that automatically rebuilds the widget on model changes. It uses `Watch` widget under the hood.

## Usage

Extend your ScreenModel class from `SignalModel`:

```
class MainScreenModel extends SignalModel {
```

Add signals to your model:

```
final Signal<int> counter = signal(0);
```

Initialize `computedModel` in the constructor to change state of the model when signals change.
If using multiple signals, don't forget to add them. `computedModel` is a signal that changes its value when any of the signals it depends on changes.
It handles int values, so if you need to use other types, you have to `compute` their hashes:

```
final Signal<int> counter = signal(0);
final Signal<String> text = signal('');

MainScreenModel() {
    computedModel = computed(
        () => counter.value.hashCode ^ text.value.hashCode,
    );
}
```

Extend your stateful widget state from `PassiveSignalState` to manually control widget rebuilds:

```
class _MainScreenState extends PassiveSignalState<MainScreenModel, MainScreen>
```

or `ReactiveSignalState` to automatically rebuild widget on model changes:

```
class _MainScreenState extends ReactiveSignalState<MainScreenModel, MainScreen>
```

Create Model instance in `createModel` function:

```
MainScreenModel createModel() => MainScreenModel();
```

Write you widget body in `buildWidget` instead of `build`

```
@override
    Widget buildWidget(BuildContext context) {
        return Scaffold(...);
}
```

If using `PassiveSignalState` you have to manually rebuild the widget when model changes:

with `Watch` widget:

```
Watch(
    (context) => Text(
        '${stateSignals.counter}',
        style: Theme.of(context).textTheme.headlineMedium,
    ),
),
```

with `Watch.builder` widget:

```
Watch.builder(
    builder: (context) => Text(
        '${stateSignals.counter}',
        style: Theme.of(context).textTheme.headlineMedium,
    ),
),
```

or use the `.watch(context)` extension method:

```
Text(
    '${stateSignals.counter}',
    style: Theme.of(context).textTheme.headlineMedium,
).watch(context),
```