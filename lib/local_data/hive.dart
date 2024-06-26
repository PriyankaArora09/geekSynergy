import 'package:hive_flutter/hive_flutter.dart';

class HiveStorage{
   Box _getBox() => Hive.box<dynamic>('hiveBox');


   String getStringValue(String key) {
    var box = _getBox();
    var value = box.get(key) as String? ?? '';
    return value;
  }


  int getIntValue(String key) {
    var box = _getBox();
    var defaultValue = 0;
    var value = box.get(key, defaultValue: defaultValue) as int;
    return value;
  }


  void saveValue(dynamic key, dynamic value) {
    _getBox().put(key, value);
  }


  void clearData(dynamic key) {
    _getBox().delete(key);
  }

  void clearBox() {
    _getBox().clear();
  }
}