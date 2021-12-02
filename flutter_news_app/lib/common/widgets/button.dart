import 'package:flutter/material.dart';
import 'package:flutter_news_app/common/utils/utils.dart';
import 'package:flutter_news_app/common/values/values.dart';

Widget btnFlatButtonWidget({
  required VoidCallback onPressed,
  double width = 140,
  double height = 44,
  Color gbColor = AppColors.primaryElement,
  String title = 'button',
  Color fontColor = AppColors.primaryElementText,
  double fontSize = 18,
  String fontName = Font.primaryText,
  FontWeight fontWeight = FontWeight.w400,
}) {
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    primary: fontColor,
    minimumSize: Size(88, 44),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    // shape: const RoundedRectangleBorder(
    //   borderRadius: BorderRadius.all(Radius.circular(2.0)),
    // ),
    shape: RoundedRectangleBorder(borderRadius: Radii.k6pxRadius),
    backgroundColor: gbColor,
  );
  return Container(
    width: duSetWidth(width),
    height: duSetWidth(height),
    child: TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: fontColor,
            fontFamily: fontName,
            fontWeight: fontWeight,
            fontSize: fontSize,
            height: 1),
      ),
      style: flatButtonStyle,
    ),
  );
}

Widget btnFlatButtonBorderOnlyWidget({
  required VoidCallback onPressed,
  double width = 99,
  double height = 44,
  String? iconFileName,
}) {
  return Container(
    width: duSetWidth(width),
    height: duSetHeight(height),
    child: TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: const RoundedRectangleBorder(
          side: Borders.primaryBorder,
          borderRadius: Radii.k6pxRadius,
        ),
      ),
      child: Image.asset('assets/images/icons-$iconFileName.png'),
    ),
    // child: TextButton.icon(
    //   style: TextButton.styleFrom(),
    //   icon: Icon(Icons['${iconFileName}']),
    //   onPressed: onPressed,
    //   label: Text(label),
    // ),
  );
}
