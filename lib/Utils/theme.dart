import 'package:flutter/material.dart';
import '../constants/colors.dart';

class METheme {
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      // primarySwatch: MaterialColor(0XFFFFFF, Map<int, Colo>),

      appBarTheme: const AppBarTheme(
          color: MEPrimaryColor, foregroundColor: Colors.white),
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(fontSize: 18, color: Colors.red),
      ),
      fontFamily: 'Montserrat');

  static ThemeData darkTheme =
      ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins');
}
