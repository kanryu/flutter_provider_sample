import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// A simple [StateNotifier] that implements a counter.
///
/// It doesn't have to be a [StateNotifier], and could be anything else such as:
/// - [ChangeNotifier], with [ChangeNotifierProvider]
/// - [Stream], with [StreamProvider]
/// ...
class Counter extends StateNotifier<int> {
  Counter() : super(0);

  void add(int adder) => state += adder;
}

/// A provider that creates and listen to a [StateNotifier].
///
/// Providers are declared as global variables.
/// This does not hinder testability, as the state of a provider is instead
/// stored inside a [ProviderScope].
final counterProvider = StateNotifierProvider<Counter, int>((_) => Counter());

class HooksRiverpodPage extends HookConsumerWidget {
  const HooksRiverpodPage({Key? key, required this.title}) : super(key: key);
  static const pageName = 'Riverpod providers with hooks Page';
  static const routeName = '/without_annotation/hooks_riverpod_page';
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Provider Managed Resources
    final countA = ref.watch(counterProvider);
    // Resources managed with hooks
    final counterB = useState(1);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              countA.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextButton(
              onPressed: () {
                Timer(Duration(milliseconds: 1000), () {
                  ref.read(counterProvider.notifier).add(counterB.value);
                });
              },
              child: Text('Add B(${counterB.value}) it after 1 second'),
            ),
            Text(
              counterB.value.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextButton(
              onPressed: () {
                counterB.value++;
              },
              child: Text('Increment B of the number to add'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).add(counterB.value);
        },
        tooltip: 'Add B(${counterB.value})',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
