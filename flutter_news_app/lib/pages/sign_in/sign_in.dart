import 'package:flutter/material.dart';
import 'package:flutter_news_app/common/utils/screen.dart';
import 'package:flutter_news_app/common/utils/utils.dart';
import 'package:flutter_news_app/common/values/values.dart';
import 'package:flutter_news_app/common/widgets/widgets.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // 执行登录操作
  _handleSignIn() {
    if (!duIsEmail(_emailController.value.text)) {
      toastInfo(msg: '请正确输入邮件');
      return;
    }
    if (!duCheckStringLength(_passwordController.value.text, 6)) {
      toastInfo(msg: '请正确输入密码');
      return;
    }
  }

  // 执行登录操作
  _handleNavSignUp() {
    Navigator.pushNamed(
      context,
      '/sign-up',
    );
  }

  // logo
  Widget _buildLogo() {
    return Container(
      width: duSetHeight(110),
      margin: EdgeInsets.only(top: duSetHeight(40 + 44.0)),
      child: Column(
        children: [
          Container(
            height: duSetWidth(76),
            width: duSetWidth(76),
            margin: EdgeInsets.symmetric(horizontal: duSetWidth(15)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  right: 0,
                  child: Container(
                    height: duSetWidth(76),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBackground,
                      boxShadow: [
                        Shadows.primaryShadow,
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          duSetWidth(76 * 0.5),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.none,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: duSetHeight(15)),
            child: Text(
              'SECTOR',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: Font.primaryText,
                fontSize: duSetFontSize(24),
                height: 1,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: duSetHeight(15)),
            child: Text(
              'news',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: Font.primaryElementText,
                fontSize: duSetFontSize(24),
                height: 1,
              ),
            ),
          )
        ],
      ),
    );
  }

  // 登录表单
  Widget _buildInputForm() {
    return Container(
      width: duSetWidth(295),
      margin: EdgeInsets.only(top: duSetHeight(49)),
      child: Column(
        children: [
          inputTextEdit(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            hintText: 'Email',
            marginTop: 0,
          ),
          inputTextEdit(
            controller: _passwordController,
            keyboardType: TextInputType.visiblePassword,
            hintText: 'Password',
            marginTop: 15,
            isPassword: true,
          ),
          Container(
            height: duSetHeight(44),
            margin: EdgeInsets.only(top: duSetHeight(15)),
            child: Row(
              children: [
                btnFlatButtonWidget(
                  onPressed: () {},
                  gbColor: AppColors.thirdElement,
                  title: "Sign up",
                ),
                Spacer(),
                btnFlatButtonWidget(
                  onPressed: _handleSignIn,
                  gbColor: AppColors.primaryElement,
                  title: "Sign in",
                ),
              ],
            ),
          ),
          FlatButton(
            onPressed: () {},
            child: Text(
              'Forgot password?',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.secondaryElementText,
                  fontFamily: Font.primaryElementText,
                  fontSize: duSetFontSize(16),
                  fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }

  // 第三方登录
  Widget _buildThirdPartyLogin() {
    return Container(
      width: duSetWidth(295),
      margin: EdgeInsets.only(bottom: duSetHeight(40)),
      child: Column(
        children: [
          Text(
            'Or sign in with social networks',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: Font.primaryElementText,
              color: AppColors.primaryText,
               fontSize: duSetFontSize(14),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: duSetHeight(20)),
            child: Row(
              children: [
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: "twitter",
                ),
                Spacer(),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: "google",
                ),
                Spacer(),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: "facebook",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // 注册按钮
  Widget _buildSignUpButton() {
    return Container(
      margin: EdgeInsets.only(bottom: duSetHeight(20)),
      child: btnFlatButtonWidget(
        onPressed: _handleNavSignUp,
        width: 294,
        gbColor: AppColors.secondaryElement,
        fontColor: AppColors.primaryText,
        title: 'Sign up',
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            _buildLogo(),
            _buildInputForm(),
            Spacer(),
            _buildThirdPartyLogin(),
            _buildSignUpButton(),
          ],
        ),
      ),
    );
  }
}
