import 'package:flutter/widgets.dart';
import 'package:maryam/contact/contact_screen.dart';
import 'package:maryam/payment/before_payment.dart';
import 'package:maryam/payment/pages/CheckoutMethodCard.dart';
import 'package:maryam/screens/complete_profile/complete_profile_screen.dart';
import 'package:maryam/screens/forgot_password/forgot_password_screen.dart';
import 'package:maryam/screens/login_success/login_success_screen.dart';
import 'package:maryam/screens/otp/otp_screen.dart';
import 'package:maryam/screens/sign_in/sign_in_screen.dart';
import 'package:maryam/screens/sign_in/sign_up/sign_up_screen.dart';
import 'package:maryam/screens/splash/splash_screen.dart';
import 'package:maryam/thanks.dart';
import 'package:maryam/home/home_screen.dart';

import 'package:maryam/about/about_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  CheckoutMethodCard.routeName: (context) => CheckoutMethodCard(),
  BeforePayment.routeName: (context) => BeforePayment(),
  Thanks.routeName: (context) => Thanks(),
  ContactScreen.routeName: (context) => ContactScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  AboutScreen.routeName: (context) => AboutScreen(),
};
