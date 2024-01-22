import 'package:flutter/material.dart';

class StyleData {
  static ThemeData masterTheme = ThemeData(
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color.fromARGB(255, 215, 215, 215),
        onPrimary: Color.fromARGB(255, 235, 235, 235),
        secondary: Colors.deepOrangeAccent,
        onSecondary: Colors.deepOrangeAccent,
        error: Colors.redAccent,
        onError: Colors.redAccent,
        background: Color.fromARGB(255, 245, 245, 245),
        onBackground: Colors.grey,
        surface: Color.fromARGB(255, 214, 214, 214),
        onSurface: Colors.black),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepOrangeAccent.shade400,
        elevation: 2.5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 3.5,
      shadowColor: Colors.black,
      backgroundColor: Colors.deepOrangeAccent,
      foregroundColor: Colors.white,
    ),
    cardTheme: CardTheme(
      color: const Color.fromARGB(255, 235, 235, 235),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    ),
    dataTableTheme: const DataTableThemeData(
      checkboxHorizontalMargin: 15,
    ),
    inputDecorationTheme: const InputDecorationTheme(hintStyle: TextStyle(fontWeight: FontWeight.normal)),
  );

  static TextTheme masterTextTheme = const TextTheme(titleMedium: TextStyle(letterSpacing: 0.1));
  static EdgeInsets verticalMargin = const EdgeInsets.symmetric(vertical: 10);
  static EdgeInsets horizontalMargin =
      const EdgeInsets.symmetric(horizontal: 17.5);
}
