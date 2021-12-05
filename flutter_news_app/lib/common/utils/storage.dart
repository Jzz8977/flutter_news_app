import 'package:flutter_news_app/common/values/values.dart';
import 'package:localstorage/localstorage.dart';

const String STORAGE_MASTER_KEY = 'ducafcat_news_app';
const String STORAGE_USER_TOKEN_KEY = 'user_token';

/// 本地存储
/// 单例 StorageUtil().getItem('key')
class StorageUtil {
  static final StorageUtil _singleton = new StorageUtil._internal();
  LocalStorage? _storage;

  factory StorageUtil() {
    return _singleton;
  }

  StorageUtil._internal() {
    _storage = new LocalStorage(STORAGE_MASTER_KEY);
  }

  String getItem(String key) {
    return _storage!.getItem(key);
  }

  Future<void> setItem(String key, String val) async {
    await _storage!.setItem(key, val);
  }
}
