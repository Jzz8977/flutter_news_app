import 'package:flutter/material.dart';
import 'package:flutter_news_app/common/utils/utils.dart';
import 'package:flutter_news_app/common/values/values.dart';
import 'package:flutter_news_app/common/widgets/widgets.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  // 返回上一页面
  _handleNavPop() {
    Navigator.pop(context);
  }

  // 执行注册操作
  _handleSignUp() {
    if (!duCheckStringLength(_fullNameController.value.text, 5)) {
      toastInfo(msg: 'The user name cannot be less than 5 characters.');
      return;
    }
    if (!duIsEmail(_emailController.value.text)) {
      toastInfo(msg: 'Please enter the email address correctly.');
      return;
    }
    if (!duCheckStringLength(_passController.value.text, 5)) {
      toastInfo(msg: 'The password cannot be less than 5 characters.');
      return;
    }
    Navigator.pop(context);
  }

  _buildLogo() {
    return Container(
      margin: EdgeInsets.only(top: duSetHeight(50)),
      child: Text(
        'Sign up',
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: Font.primaryElementText,
          fontSize: duSetFontSize(24),
          fontWeight: FontWeight.w600,
          height: 1,
        ),
      ),
    );
  }

  _buildInputForm() {
    return Container(
      width: duSetWidth(295),
      margin: EdgeInsets.only(top: duSetHeight(49)),
      child: Column(
        children: [
          inputTextEdit(
            controller: _fullNameController,
            keyboardType: TextInputType.text,
            hintText: 'Full name',
            marginTop: 0,
          ),
          inputTextEdit(
            controller: _emailController,
            keyboardType: TextInputType.text,
            hintText: 'Email',
            // marginTop: 0,
          ),
          inputTextEdit(
            controller: _passController,
            keyboardType: TextInputType.visiblePassword,
            hintText: 'Password',
            // marginTop: 0,
            isPassword: true,
          ),

          // 创建

          Container(
            height: duSetHeight(44),
            margin: EdgeInsets.only(top: duSetHeight(15)),
            child: btnFlatButtonWidget(
              onPressed: _handleSignUp,
              width: 295,
              fontWeight: FontWeight.w600,
              title: 'Create an account',
            ),
          ),
          // const Spacer(),
          Container(
            height: duSetHeight(40),
            margin: EdgeInsets.only(top: duSetHeight(20)),
            child: TextButton(
              onPressed: _handleSignUp,
              child: Text(
                'Forgot password?',
                style: TextStyle(
                  color: AppColors.secondaryElementText,
                  fontFamily: Font.primaryText,
                  fontWeight: FontWeight.w400,
                  fontSize: duSetFontSize(16),
                  height: 1,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildThirdPartyLogin() {
    return Container(
      width: duSetWidth(295),
      margin: EdgeInsets.only(bottom: duSetHeight(40)),
      child: Column(
        children: [
          Text(
            'Or sign with social netwroks',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: Font.primaryElementText,
              fontSize: duSetFontSize(16),
              fontWeight: FontWeight.w400,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: duSetHeight(20)),
            child: Row(
              children: [
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 80,
                  iconFileName: 'twitter',
                ),
                const Spacer(),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 80,
                  iconFileName: 'google',
                ),
                const Spacer(),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 80,
                  iconFileName: 'facebook',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildHaveAccountButton() {
    return Container(
      margin: EdgeInsets.only(bottom: duSetHeight(20)),
      child: btnFlatButtonWidget(
        onPressed: _handleNavPop,
        width: 295,
        gbColor: AppColors.secondaryElement,
        fontColor: AppColors.primaryText,
        title: 'I have an account',
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: transparentAppBar(
        context: context,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              toastInfo(msg: 'This is the registration page');
            },
            icon: const Icon(
              Icons.info_outline,
              color: AppColors.primaryText,
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const Divider(height: 1),
            _buildLogo(),
            _buildInputForm(),
            const Spacer(),
            _buildThirdPartyLogin(),
            _buildHaveAccountButton(),
          ],
        ),
      ),
    );
  }
}
