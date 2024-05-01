import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_study/pages/basic/basic_provder.dart';

class BasicPage extends ConsumerStatefulWidget {
  const BasicPage({super.key});

  @override
  ConsumerState<BasicPage> createState() => _BasicPageState();
}

class _BasicPageState extends ConsumerState<BasicPage> {
  @override
  Widget build(BuildContext context) {
    // ref.listen<int>(counterProvider, (previous, next) {
    //   if (next == 3) {
    //     showDialog(context: context, builder: (context) {
    //       return AlertDialog(
    //         content: Text('counter : $next'),
    //       );
    //     },);
    //   }
    // });
    final hello = ref.watch(helloProvider);
    final world = ref.watch(worldProvider);
    // final value = ref.watch(counterProvider);
    final value = ref.watch(ageProvider);



    return Scaffold(
      appBar: AppBar(
        title: Text('Provder'),
      ),
      body: Center(
        child: Text(
          '$value',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
