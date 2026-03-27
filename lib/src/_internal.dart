const missingIdMessage = 'Missing "id" field in JSON';

const invalidJsonMessage = 'Invalid JSON';

String typeMismatchMessage(dynamic t, dynamic r) {
  return 'Type mismatch: Expected $t, but got ${r.runtimeType}';
}

mixin AliasEnumMixin on Enum {
  String get alias;
}

mixin ValueGetterMixin<T> {
  T get value;
}
