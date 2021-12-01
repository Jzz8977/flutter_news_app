import 'package:flutter/material.dart';
import 'package:flutter_news_app/common/utils/utils.dart';
import 'package:flutter_news_app/common/values/values.dart';

Widget inputTextEdit({
  required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
  String? hintText,
  bool isPassword = false,
  double marginTop = 15,
}) {
  return Container(
    width: duSetWidth(295),
    margin: EdgeInsets.only(top: duSetHeight(marginTop)),
    decoration: const BoxDecoration(
      color: AppColors.secondaryElement,
      borderRadius: Radii.k6pxRadius,
    ),
    child: TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
        border: InputBorder.none,
      ),
      style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: Font.primaryText,
          fontWeight: FontWeight.w400,
          fontSize: duSetFontSize(18)),
      maxLines: 1,
      autocorrect: false, //自动纠正
      // obscureText: isPassword, //隐藏内容，密码框
      obscureText: isPassword, //隐藏内容，密码框
    ),
  );
}
