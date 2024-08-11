import 'package:flutter/material.dart';

class MeloSliderTheme{

  static SliderThemeData lightSliderThemeData = SliderThemeData(
    overlayShape: SliderComponentShape.noOverlay,
    activeTrackColor: const Color(0xffB7B7B7),
    inactiveTrackColor: Colors.grey.withOpacity(0.3),
    thumbColor: const Color(0xffB7B7B7),
  );

  static SliderThemeData darkSliderThemeData = SliderThemeData(
    overlayShape: SliderComponentShape.noOverlay,
    activeTrackColor: const Color(0xffB7B7B7),
    inactiveTrackColor: Colors.grey.withOpacity(0.3),
    thumbColor: const Color(0xffB7B7B7),
  );
}