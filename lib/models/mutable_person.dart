import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mutable_person.freezed.dart';
part 'mutable_person.g.dart';

@unfreezed
class MutablePerson with _$MutablePerson {
  factory MutablePerson({
    required final int id, // unfreezed data class 에서는 final 을 지정해야만 immutable이 된다
    required String name,
    required String email,
  }) = _MutablePerson;



  factory MutablePerson.fromJson(Map<String, dynamic> json) =>
      _$MutablePersonFromJson(json);
}