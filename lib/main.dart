import 'package:click_gift/routes/routes.dart';
import 'package:click_gift/views/login/login_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'components/theme.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Click Gift',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.login,
      getPages: Routes.routes,
      initialBinding: LoginBinding(),
    );
  }
}