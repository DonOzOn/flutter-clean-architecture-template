class MapIterationHelpers {
  static bool isNotNullOrEmpty(Map? iterable) => !isNullOrEmpty(iterable);

  static bool isNullOrEmpty(Map? iterable) =>
      iterable == null || iterable.isEmpty;
}
