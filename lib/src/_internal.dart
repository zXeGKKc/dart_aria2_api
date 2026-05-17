import 'package:collection/collection.dart';
import 'package:result_dart/result_dart.dart';

// error message
const invalidJsonMessage = 'Invalid JSON';
const missingIdMessage = 'Missing "id" field in JSON';
String typeMismatchMessage(dynamic t, dynamic r) {
  return 'Type mismatch: Expected $t, but got ${r.runtimeType}';
}

const listEquality = ListEquality();
const setEquality = SetEquality();
const resultEquality = ResultEquality();

class ResultEquality<S extends Object, F extends Object>
    implements Equality<ResultDart<S, F>> {
  const ResultEquality();

  @override
  bool equals(ResultDart<S, F>? result1, ResultDart<S, F>? result2) {
    if (identical(result1, result2)) return true;
    if (result1 == null || result2 == null) return false;
    return result1.fold(
      (s) {
        if (result2.isError()) return false;
        return s == result2.getOrNull();
      },
      (f) {
        if (result2.isSuccess()) return false;
        return f == result2.exceptionOrNull();
      },
    );
  }

  @override
  int hash(ResultDart<S, F>? result) {
    if (result == null) return null.hashCode;
    return result.fold(
      (s) {
        return s.hashCode;
      },
      (f) {
        return f.hashCode;
      },
    );
  }

  @override
  bool isValidKey(Object? o) => o is ResultDart<S, F>;
}

mixin AliasEnumMixin on Enum {
  String get alias;
}

mixin ValueGetterMixin<T> {
  T get value;
}
