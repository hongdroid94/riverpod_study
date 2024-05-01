// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'basic_provder.g.dart';

final counterProvider = StateProvider<int>((ref) {
  ref.onDispose(() {
    print('[counterProvider] disposed');
  });
  return 0;
});

@Riverpod(keepAlive: true)
String age(AgeRef ref) {
  ref.onDispose(() {
    print('[ageProvider] disposed');
  });
  final age = ref.watch(counterProvider);
  return 'Hi! I am $age years old.';
}

// final helloProvider = Provider<String>((ref) {
//   ref.onDispose(() {
//     print('[helloProvider] disposed');
//   });
//   return "Hello";
// },);

//
// final worldProvider = Provider<String>((ref) {
//   ref.onDispose(() {
//     print('[worldProvider] disposed');
//   });
//   return "World";
// },);


@Riverpod(keepAlive: true) // autodispose를 적용하지 말라는 옵션 default는 false
 String hello (HelloRef ref) {
  ref.onDispose(() {
    print('[helloProvider] disposed');
  });
  return "Hello";
}

@Riverpod(keepAlive: true)
String world (WorldRef ref) {
  ref.onDispose(() {
    print('[worldProvider] disposed');
  });
  return "World";
}