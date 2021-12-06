import 'package:flutter_news_app/common/entity/entitys.dart';
import 'package:flutter_news_app/common/utils/utils.dart';

class UserAPI {
  static Future<UserResponseEntity> login(
      {required UserResponseEntity params}) async {
    var response = await HttpUtil().post('/user/login', params);
    return UserResponseEntity.fromJson(response);
  }
}
