import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';

final ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: kScaffoldBackgroundDarkColor,
    primaryColor: kPrimaryDarkColor,
    cardColor: kCardDarkColor,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 0,
    ),
    textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 34,
            color: kPrimaryDarkColor,
            fontWeight: FontWeight.w700),
        headline2: TextStyle(
            fontSize: 18,
            color: kPrimaryDarkColor,
            fontWeight: FontWeight.w600),
        headline3: TextStyle(
            color: kPrimaryDarkColor,
            fontWeight: FontWeight.w400,
            fontSize: 16),
        headline4: TextStyle(
            color: kPrimaryDarkColor,
            fontWeight: FontWeight.w400,
            fontSize: 14),
        headline5: TextStyle(
            color: kPrimaryDarkColor,
            fontWeight: FontWeight.w400,
            fontSize: 12),
    ).apply(
    ));
