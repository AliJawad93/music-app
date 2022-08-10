import 'package:app/const/app_colors.dart';
import 'package:flutter/material.dart';

class DartThemeData {
  static ThemeData themeData() {
    return ThemeData(
        scaffoldBackgroundColor: AppColors.dartBackGround,
        appBarTheme: _appBarTheme(),
        bottomNavigationBarTheme: _bottomNavigationBarTheme(),
        textTheme: _textTheme(),
        iconTheme: IconThemeData(size: 30, color: AppColors.icon));
  }

  static _appBarTheme() {
    return AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.appBar,
        titleTextStyle: TextStyle(color: AppColors.white, fontSize: 20));
  }

  static BottomNavigationBarThemeData _bottomNavigationBarTheme() {
    return const BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkBackGroundBottomNavigation,
        selectedItemColor: AppColors.selectedIcon,
        unselectedItemColor: AppColors.dartUnSelectedIcon,
        showSelectedLabels: false,
        showUnselectedLabels: false);
  }

  static _textTheme() {
    return const TextTheme(
      titleMedium:
          TextStyle(color: AppColors.text, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(color: AppColors.text, fontSize: 12),
    );
  }
}
