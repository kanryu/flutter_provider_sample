import 'package:freezed_annotation/freezed_annotation.dart';
part 'todo.freezed.dart';

// The freezed annotation makes the class an immutable object.
// If you change the property, replace it with a new instance with the new properties set.
@freezed
class Todo with _$Todo {
  const factory Todo({
    required int id,
    required String content,
    required bool completed,
  }) = _Todo;
}
