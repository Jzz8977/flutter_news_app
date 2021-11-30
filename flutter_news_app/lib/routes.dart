// 静态路由
import 'package:flutter_news_app/pages/sign_in/sign_in.dart';
import 'package:flutter_news_app/pages/sign_up/sign_up.dart';

var staticRoutes = {
  "/sign-in": (context) => SignInPage(),
  "/sign-up": (context) => SignUpPage()
};
