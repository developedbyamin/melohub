import 'package:flutter/material.dart';
import 'package:melohub/core/configs/theme/appTheme/elevated_button_theme.dart';
import 'package:melohub/core/configs/theme/appTheme/input_decoration_theme.dart';
import 'package:melohub/core/configs/theme/appTheme/slider_theme.dart';
import 'package:melohub/core/configs/theme/appTheme/tab_bar_theme.dart';
import 'package:melohub/core/configs/theme/appTheme/text_button_theme.dart';
import 'package:melohub/core/configs/theme/appTheme/text_theme.dart';

import '../app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    brightness: Brightness.light,
    fontFamily: 'Satoshi',
    sliderTheme: MeloSliderTheme.darkSliderThemeData,
    textButtonTheme: MeloTextButtonTheme.lightTextButtonThemeData,
    tabBarTheme: MeloTabBarTheme.lightTabBarTheme,
    inputDecorationTheme: MeloInputDecorationTheme.lightInputDecorationTheme,
    elevatedButtonTheme: MeloElevatedButtonTheme.lightElevatedButtonThemeData,
    textTheme: MeloTextTheme.lightTextTheme,
  );

  static final darkTheme = ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.darkBackground,
      brightness: Brightness.dark,
      fontFamily: 'Satoshi',
      sliderTheme: MeloSliderTheme.darkSliderThemeData,
      textButtonTheme: MeloTextButtonTheme.darkTextButtonThemeData,
      tabBarTheme: MeloTabBarTheme.darkTabBarTheme,
      inputDecorationTheme: MeloInputDecorationTheme.darkInputDecorationTheme,
      elevatedButtonTheme: MeloElevatedButtonTheme.darkElevatedButtonThemeData,
      textTheme: MeloTextTheme.darkTextTheme
  );
}
