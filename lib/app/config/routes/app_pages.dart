library app_pages;

import 'package:get/get.dart';
import 'package:music_app/app/features/dashboard/views/screen/dashboard_screen.dart';

part 'app_routes.dart';

abstract class AppPages {
  static const initial = _Paths.dashboard;

  static final pages = [
    GetPage(
      name: _Paths.dashboard,
      page: () => DashboardScreen(),
      binding: DashboardBinding(),
    ),
  ];
}
