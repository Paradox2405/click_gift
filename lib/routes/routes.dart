import 'package:click_gift/views/register/register_view.dart';
import 'package:get/get.dart';

import '../views/login/login_binding.dart';
import '../views/login/login_view.dart';


class Routes{

  static const String login= "/login_page";
  static const String registration= "/registration_page";
  static const String home = "/home_page";



  static final routes =[
    GetPage(
      name: Routes.login,
      page: ()=> LoginPage(),
      binding: LoginBinding(),
    ),

    GetPage(
      name: Routes.registration,
      page: ()=> RegistrationPage(),
    ),

  ];
}