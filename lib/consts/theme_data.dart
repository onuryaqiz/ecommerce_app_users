import 'package:ecommerce_app_users/consts/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Styles {
  static ThemeData themeData(
      {required bool isDarkTheme, required BuildContext context}) {
    return ThemeData(
      scaffoldBackgroundColor: isDarkTheme? AppColors.darkScaffoldColor : AppColors.lightScaffoldColor,
    );
  }
}
