import 'package:get/get_navigation/src/routes/get_route.dart';
import '../Screens/UserFlow/login_screen.dart';
import '../Screens/UserFlow/onboarding_screen.dart';
import '../Screens/UserFlow/signup_screen.dart';
import '../Screens/bottom_nav_bar/dashboard.dart';
import '../splash_screen.dart';

class MyRouters {
  static var splashScreen = "/splashScreen";
  static var onBoardingScreen = "/onBoardingScreen";
  static var loginScreen = "/loginScreen";
  static var signupScreen = "/signupScreen";
  static var dashboard = "/dashboard";


  static var route = [
    GetPage(name: '/', page: () => const SplashScreen()),
     GetPage(name: '/onBoardingScreen', page: () => const OnBoardingScreen()),
     GetPage(name: '/loginScreen', page: () => const LoginScreen()),
     GetPage(name: '/signupScreen', page: () => const SignupScreen()),
     GetPage(name: '/dashboard', page: () => const Dashboard()),
  ];
}
