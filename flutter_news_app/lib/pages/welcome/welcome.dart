import 'package:flutter/material.dart';
import 'package:flutter_news_app/common/utils/screen.dart';
import 'package:flutter_news_app/common/values/values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  // 页头标题
  Widget _buildPageHeadTitle() {
    return Container(
      margin: EdgeInsets.only(top: duSetHeight(60)),
      child: Text(
        "Feature",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: AppColors.primaryText,
            fontFamily: Font.primaryText,
            fontWeight: FontWeight.w600,
            fontSize: duSetFontSize(24)),
      ),
    );
  }

  // 页头说明
  Widget _buildPageHeadDetail() {
    return Container(
      width: duSetWidth(242),
      height: duSetHeight(70),
      margin: EdgeInsets.only(top: duSetHeight(14)),
      child: Text(
        'The best of news channels all in one place. Trusted source and personalized news for you.',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: Font.primaryElementText,
          fontSize: duSetFontSize(16),
          fontWeight: FontWeight.normal,
          height: 1.3,
        ),
      ),
    );
  }

  // 特性说明
  Widget _buildPageFeatureItem(
      String imageName, String intro, double marginTop) {
    return Container(
      width: duSetWidth(295),
      height: duSetHeight(80),
      margin: EdgeInsets.only(top: marginTop),
      child: Row(
        children: [
          Container(
            width: duSetWidth(80),
            height: duSetHeight(80),
            child: Image.asset(
              "assets/images/${imageName}.png",
              fit: BoxFit.none,
            ),
          ),
          Spacer(),
          Container(
            width: duSetWidth(195),
            child: Text(
              intro,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: Font.primaryElementText,
                  fontWeight: FontWeight.normal,
                  fontSize: duSetFontSize(16)),
            ),
          )
        ],
      ),
    );
  }

  // 开始按钮
  Widget _buildStartButton() {
    return Container(
      width: duSetWidth(295),
      height: duSetHeight(44),
      margin: EdgeInsets.only(top: duSetHeight(20)),
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            "/sign-in",
          );
        },
        child: Text('Get started'),
        style: ButtonStyle(
          // shape: MaterialStateProperty.all(StadiumBorder()),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: Radii.k6pxRadius)),
          // shape:new RoundedRectangleBorder(borderRadius: Radii.k6pxRadius)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Set the fit size (fill in the screen size of the device in the design) If the design is based on the size of the  360*690
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      designSize: Size(375, 812 - 44 - 34),
    );
    printScreenInformation();
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Material App Bar'),
      // ),
      body: Center(
        child: Column(
          children: [
            _buildPageHeadTitle(),
            _buildPageHeadDetail(),
            _buildPageFeatureItem(
                'feature-1',
                'Compelling photography and typography provide a beautiful reading',
                86),
            _buildPageFeatureItem(
                'feature-2',
                'Sector news never shares your personal data with advertisers or publishers',
                40),
            _buildPageFeatureItem('feature-3',
                'You can get Premium to unlock hundreds of publications', 40),
            _buildStartButton(),
          ],
        ),
      ),
    );
  }
}

void printScreenInformation() {
  print('设备宽度:${1.sw}dp');
  print('设备高度:${1.sh}dp');
  print('设备的像素密度:${ScreenUtil().pixelRatio}');
  print('底部安全区距离:${ScreenUtil().bottomBarHeight}dp');
  print('状态栏高度:${ScreenUtil().statusBarHeight}dp');
  print('实际宽度和字体(dp)与设计稿(dp)的比例:${ScreenUtil().scaleWidth}');
  print('实际高度(dp)与设计稿(dp)的比例:${ScreenUtil().scaleHeight}');
  print('高度相对于设计稿放大的比例:${ScreenUtil().scaleHeight}');
  print('系统的字体缩放比例:${ScreenUtil().textScaleFactor}');
  print('屏幕宽度的0.5:${0.5.sw}dp');
  print('屏幕高度的0.5:${0.5.sh}dp');
  print('屏幕方向:${ScreenUtil().orientation}');
}
