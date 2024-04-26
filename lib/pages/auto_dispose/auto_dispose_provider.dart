// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auto_dispose_provider.g.dart';

// final autoDisposeHelloProvider = Provider.autoDispose<String>((ref) {
//   print('[autoDisposeHelloProvider] created');
//   ref.onDispose(() {
//     print('[autoDisposeHelloProvider] disposed');
//   });
//   return 'Hello';
// },);

@riverpod // 소문자와 대소문자의 차이는 소문자는 넘길 인자가 필요없을 때 ! 대문자는 넘길 인자 (옵션)을 적용하고 싶을 때 활용
String autoDisposeHello (AutoDisposeHelloRef ref) {
  print('[autoDisposeHelloProvider] created');
  ref.onDispose(() {
    print('[autoDisposeHelloProvider] disposed');
  });
  return 'Hello';
}