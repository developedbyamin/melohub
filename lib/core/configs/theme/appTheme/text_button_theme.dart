import 'package:flutter/material.dart';

class MeloTextButtonTheme{

  static TextButtonThemeData lightTextButtonThemeData = TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
          return Colors.black;
        },
      ),
    ),
  );

  static TextButtonThemeData darkTextButtonThemeData = TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
          return Colors.white;
        },
      ),
    ),
  );

}