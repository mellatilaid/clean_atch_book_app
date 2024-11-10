import 'package:hive_flutter/hive_flutter.dart';

class HiveService<T> {
  final String boxName;
  final TypeAdapter<T> adapter;
  HiveService(this.boxName, this.adapter);

  static Future<void> initialize() async {
    await Hive.initFlutter();
  }

  void _registerAdapter() {
    if (!Hive.isAdapterRegistered(adapter.typeId)) {
      Hive.registerAdapter(adapter);
    }
  }

  Future<Box<T>> openBox() async {
    _registerAdapter();
    // Check if the box is already open
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox<T>(boxName);
    } else {
      return Hive.box<T>(boxName);
    }
  }

  Future<void> addItem(String key, T item) async {
    var box = await openBox();
    await box.add(item);
  }

  Future<void> addAll(List<T> item) async {
    var box = await openBox();
    await box.addAll(item);
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
    await box.add(item);
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
