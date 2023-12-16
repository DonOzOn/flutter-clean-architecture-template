class IterableHelpers {
  static bool isNotNullOrEmpty(Iterable? iterable,
      {bool nullableChild = true}) {
    return !isNullOrEmpty(iterable, nullableChild: nullableChild);
  }

  static bool isNullOrEmpty(Iterable? iterable, {bool nullableChild = true}) {
    if (nullableChild) {
      return iterable == null || iterable.isEmpty;
    } else {
      final updatedIterable = iterable?.where((element) => element != null);
      return updatedIterable == null || updatedIterable.isEmpty;
    }
  }

  /// Moving an item in an [Iterable] from [oldIndex] to [newIndex]
  ///
  /// [value]: The editing [Iterable]
  ///
  /// [oldIndex]: The old index of reordering element
  ///
  /// [newIndex]: The new index of reordering element
  ///
  /// [autofill]: In some reorder UIs (ReorderableListView, SliverReorderableList,...),
  /// when user is moving an item, others will autofill to [oldIndex]. In this
  /// case, the new index of reordering element must be subtract.
  static List<E> reorder<E>(
      {required Iterable<E> value,
      required int oldIndex,
      required int newIndex,
      bool autofill = false}) {
    // Get reordering element
    final element = value.toList()[oldIndex];

    // Get insert element index
    final insertIndex =
        autofill ? (newIndex > oldIndex ? newIndex - 1 : newIndex) : newIndex;

    // Return updated list
    return value.toList()
      ..removeAt(oldIndex)
      ..insert(insertIndex, element);
  }
}
