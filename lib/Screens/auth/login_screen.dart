import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shopemakeup/Provider/auth_block/provider_auth.dart';
import 'package:shopemakeup/const/const_text_filed.dart';
import 'package:shopemakeup/sharedPreferences/StooregSharedAuth.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var _object = Provider.of<ProviderAuth>(context,listen: false);
    return ChangeNotifierProvider<ProviderAuth>(
        create: (context) => ProviderAuth(),
        child:Scaffold(
          body: Padding(
            padding: EdgeInsets.only(top: 64.h),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.h),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome Back!',
                          style: TextStyle(
                              fontFamily: 'inter',
                              fontSize: 22.sp,
                              color: Color(0xffEF5DA8),
                              fontWeight: FontWeight.w700)),
                      SizedBox(
                        height: 11.h,
                      ),
                      Text(
                        'Sign in to your account',
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                            fontFamily: 'inter',
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 64.h,
                      ),
                      text_filed().TEXTINPUT(
                          keyboardType: TextInputType.emailAddress,
                          src_img: 'email.png',
                          hintText: 'Email Address',
                          enabled: true,
                          controller: _object.EmailLogin,
                          obscureText: false),
                      SizedBox(height: 12.h),
                      text_filed().TEXTINPUT(
                          keyboardType: TextInputType.text,
                          src_img: 'lock.png',
                          hintText: 'Password',
                          enabled: true,
                          controller: _object.PasswordLogin,
                          suffixIcon: IconButton(
                              onPressed: () {
                                if (
                                Provider.of<ProviderAuth>(context,listen: false).
                                visibilitys_obscureText) {
                                  Provider.of<ProviderAuth>(context,
                                      listen: false)
                                      .setVisibility_obscureText(false);
                                 } else {
                                  Provider.of<ProviderAuth>(context,
                                      listen: false)
                                      .setVisibility_obscureText(true);
                                 }
                              },
                              icon: Icon(Provider.of<ProviderAuth>(context)
                                  .visibilitys_obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          obscureText:
                          Provider.of<ProviderAuth>(context, listen: false)
                              .visibilitys_obscureText),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, 'ChangePassword_Screen');
                            },
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                  fontFamily: 'inter',
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _object.Login(context: context);
                          // Navigator.popAndPushNamed(context,'Login_Screen');
                        },
                        child: Text(
                          'Login ${storegAuthShared().emailUser}',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'inter',
                              fontWeight: FontWeight.w700),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(311.03.w, 56.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(90.r),
                          ),
                          primary: Color(0xf0F178B6),
                        ),
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      Column(
                        children: [
                          Text(
                            'Or continue with',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.black,
                                fontFamily: 'inter',
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 28.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                  heroTag: 'Google',
                                  onPressed: () {
                                    _object.SignInWithGoogle(context);
                                  },
                                  child: Image.asset('assets/icons/google.png'),
                                  backgroundColor: Colors.white),
                              SizedBox(
                                width: 32.h,
                              ),
                              FloatingActionButton(
                                  onPressed: ()  {
                                     _object.SignInWithFaceBook(context);
                                  },
                                  heroTag: 'Facebook',
                                  backgroundColor: Colors.white,
                                  child:
                                  Image.asset('assets/icons/Facebook.png')),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don’t have an account?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.black,
                                fontFamily: 'inter',
                                fontWeight: FontWeight.w500),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.popAndPushNamed(
                                  context, 'SingUp_Screen');
                            },
                            child: Text('Sign Up',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'inter',
                                    color: Color(0xffEF67AC),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }
}
