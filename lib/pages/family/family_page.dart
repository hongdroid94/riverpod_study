import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_study/pages/family/family_provider.dart';

class FamilyPage extends ConsumerWidget {
  const FamilyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final helloJohn = ref.watch(familyHelloProvider('john'));
    // final helloJane = ref.watch(familyHelloProvider('jane'));

    final incVal = ref.watch(familyCounterProvider(10));
    final decVal = ref.watch(familyCounterProvider(-10));

    return Scaffold(
      appBar: AppBar(
        title: Text('Provder'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$incVal',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(width: 20),
                FilledButton(
                  onPressed: () {
                    ref.read(familyCounterProvider(10).notifier).update((state) => state + 10);
                  },
                  child: Text(
                    'Increment',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$decVal',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(width: 20),
                FilledButton(
                  onPressed: () {
                    ref.read(familyCounterProvider(-10).notifier).update((state) => state - 10);
                  },
                  child: Text(
                    'Decrement',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
