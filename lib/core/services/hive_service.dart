import 'package:hive/hive.dart';

abstract class HiveService<T> {
  final String boxName;
  final TypeAdapter<T> adapter;
  HiveService(this.boxName, this.adapter);

  Future<Box<T>> openBox() async {
    // Check if the box is already open
    if (!Hive.isBoxOpen(boxName)) {
      Hive.registerAdapter(adapter);
      return await Hive.openBox<T>(boxName);
    } else {
      return Hive.box<T>(boxName);
    }
  }

  Future<void> addItem(String key, T item) async {
    var box = await openBox();
    await box.put(key, item);
  }

  Future<T?> getItem(String key) async {
    var box = await openBox();
    return box.get(key);
  }

  Future<void> deleteItem(String key) async {
    var box = await openBox();
    await box.delete(key);
  }

  Future<void> updateItem(String key, T item) async {
    var box = await openBox();
    await box.put(key, item);
  }

  Future<List<T>> getAllItems() async {
    var box = await openBox();
    return box.values.toList();
  }

  Future<void> clearAllItems() async {
    var box = await openBox();
    await box.clear();
  }

  Future<void> closeBox() async {
    if (Hive.isBoxOpen(boxName)) {
      await Hive.box(boxName).close();
    }
  }
}
