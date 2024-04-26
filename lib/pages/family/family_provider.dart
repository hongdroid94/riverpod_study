
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'family_provider.g.dart';

// final familyHelloProvider = Provider.family<String, String>((ref, name) {
//   ref.onDispose(() {
//     print('[familyHelloProvider($name)] disposed');
//   });
//   return 'Hello $name';
// },);

@Riverpod(keepAlive: true)
String familyHello (FamilyHelloRef ref, String there) { // family 사용하고 싶을 때 다음과 같이 구성하지만 변수명을 name으로 지정하면 안된다 (주의)
  ref.onDispose(() {
    print('[familyHelloProvider($there)] disposed');
  });
  return 'Hello $there';
}