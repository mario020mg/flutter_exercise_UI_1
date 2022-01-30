import 'package:get/get.dart';

import 'package:stack/app/modules/home/bindings/home_binding.dart';
import 'package:stack/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const kINITIAL = Routes.kHOME;

  static final routes = [
    GetPage(
      name: _Paths.kHOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
