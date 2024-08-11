import 'package:flutter/material.dart';

import '../app_colors.dart';

class MeloTabBarTheme{

  static const TabBarTheme lightTabBarTheme = TabBarTheme(
    labelColor: Colors.black,
    indicatorColor: AppColors.primary,
    dividerColor: Colors.transparent,
    overlayColor: WidgetStatePropertyAll(Colors.transparent),
  );

  static const TabBarTheme darkTabBarTheme = TabBarTheme(
    labelColor: Colors.white,
    indicatorColor: AppColors.primary,
    dividerColor: Colors.transparent,
    overlayColor: WidgetStatePropertyAll(Colors.transparent),
  );



}