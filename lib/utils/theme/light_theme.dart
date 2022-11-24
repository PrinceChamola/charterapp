

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';

final ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: kScaffoldBackgroundLightColor,
    primaryColor: kPrimaryLightColor,
    cardColor: kCardLightColor,
    buttonColor: kButtonLightColor,
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
    ),
    textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 34,
            color: kPrimaryLightColor,
            fontWeight: FontWeight.w700),
        headline2: TextStyle(
            fontSize: 18,
            color: kPrimaryLightColor,
            fontWeight: FontWeight.w600),
        headline3: TextStyle(
            color: kPrimaryLightColor,
            fontWeight: FontWeight.w400,
            fontSize: 16),
        headline4: TextStyle(
            color: kPrimaryLightColor,
            fontWeight: FontWeight.w400,
            fontSize: 14),
        headline5: TextStyle(
            color: kPrimaryLightColor,
            fontWeight: FontWeight.w400,
            fontSize: 12),
        bodyText1: TextStyle(
            fontSize: 28,
            color: kPrimaryLightColor,
            fontWeight: FontWeight.w600,
        ),
        bodyText2: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600
        )
    ).apply(
    ));
