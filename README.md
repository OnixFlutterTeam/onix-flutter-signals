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

Extend your stateful widget state from `PassiveSignalState` to manually control widget rebuilds:

```
class _MainScreenState
    extends PassiveSignalState<MainScreenModel, MainScreen>
```

or `ReactiveSignalState` to automatically rebuild widget on model changes:

```
class _MainScreenState
    extends ReactiveSignalState<MainScreenModel, MainScreen>
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