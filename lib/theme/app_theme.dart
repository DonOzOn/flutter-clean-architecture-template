import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData buildTheme() => ThemeData(
        fontFamily: 'Avenir Next LT Pro',
        backgroundColor: Appcolor.backgroundColor,
        primaryColor: Appcolor.primaryColor,
        brightness: Brightness.dark,
        iconTheme: const IconThemeData(color: Appcolor.mainWhiteColor),
        listTileTheme: ListTileThemeData(
          // dense: true,
          contentPadding: EdgeInsets.zero,
          tileColor: Colors.transparent,
          iconColor: Appcolor.mainWhiteColor,
          textColor: Appcolor.mainWhiteColor,
          selectedColor: Appcolor.mainPrimaryColor,
          selectedTileColor: Appcolor.mainPrimaryColor,
          horizontalTitleGap: 0,
          minVerticalPadding: 0,
        ),
        textTheme: const TextTheme(
            displayLarge: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.0,
                color: Appcolor.textHighColor,
                height: 1.285),
            displaySmall: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.0,
                color: Appcolor.textHighColor,
                height: 1.27),
            bodyLarge: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.0,
                color: Appcolor.textHighColor,
                height: 1.5)),
        tabBarTheme: const TabBarTheme(
          labelStyle: TextStyle(
              fontFamily: 'Avenir Next LT Pro',
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              fontSize: 16.0,
              height: 1.0,
              color: Appcolor.textHighColor,
              letterSpacing: 0.0),
          unselectedLabelStyle: TextStyle(
              fontFamily: 'Avenir Next LT Pro',
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              fontSize: 16.0,
              height: 1.0,
              color: Appcolor.textTextLow,
              letterSpacing: 0.0),
          labelColor: Colors.white,
          labelPadding: EdgeInsets.fromLTRB(16, 0, 16, 13),
          unselectedLabelColor: Appcolor.textTextLow,
        ),
        scrollbarTheme: ScrollbarThemeData(
          thumbVisibility: MaterialStateProperty.all(true),
          thickness: MaterialStateProperty.all(4.0),
          thumbColor: MaterialStateProperty.all(Appcolor.neutralN600),
          radius: const Radius.circular(99.0),
          crossAxisMargin: 4.0,
        ),
        buttonTheme: ButtonThemeData(
          padding: const EdgeInsets.symmetric(vertical: 13.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
      );
}

/// Define a custom text style:
/// styleName: Label/Small Demi;
/// font-family: Avenir Next LT Pro;
/// font-size: 12px;
/// font-style: normal;
/// font-weight: 600;
/// line-height: 12px;
/// letter-spacing: 0px;

extension PivotDATextTheme on TextTheme {
  TextStyle get titleVeryLargeDemi => const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 22.0,
      height: 1.3,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.0,
      color: Appcolor.textHighColor);
  TextStyle get titleLargeDemi => const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 20.0,
      height: 1.3,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.0,
      color: Appcolor.textHighColor);

  TextStyle get titleMediumDemi => const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18.0,
      height: 1.22,
      fontStyle: FontStyle.normal,
      color: Appcolor.textHighColor,
      letterSpacing: 0.0);

  TextStyle get titleMediumRegular => const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 18.0,
      height: 1.0,
      fontStyle: FontStyle.normal,
      color: Appcolor.textHighColor,
      letterSpacing: 0.0);

  TextStyle get titleSmallDemi => const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16.0,
      height: 1.25,
      fontStyle: FontStyle.normal,
      color: Appcolor.textHighColor,
      letterSpacing: 0.0);

  TextStyle get tightValueLargeDemi => const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 24.0,
      height: 1.0,
      fontStyle: FontStyle.normal,
      color: Appcolor.textHighColor,
      letterSpacing: 0.0);

  TextStyle get tightValueMediumDemi => const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 20.0,
      height: 1.2,
      fontStyle: FontStyle.normal,
      color: Appcolor.textHighColor,
      letterSpacing: 0.5);

  TextStyle get labelSmallDemi => const TextStyle(
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 12.0,
      height: 1.0,
      color: Appcolor.textHighColor,
      letterSpacing: 0.0);
  TextStyle get labelSmallRegular => const TextStyle(
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 12.0,
      height: 1.0,
      color: Appcolor.textHighColor,
      letterSpacing: 0.0);

  TextStyle get labelSmallDemiW500 => const TextStyle(
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: 12.0,
      height: 1.0,
      color: Appcolor.textMediumColor,
      letterSpacing: 0.0);

  TextStyle get labelMediumDemi => const TextStyle(
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 14.0,
      height: 1.0,
      color: Appcolor.textHighColor,
      letterSpacing: 0.0);

  TextStyle get captionDemiRegular => const TextStyle(
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 12.0,
      height: 1.17,
      color: Appcolor.textMediumColor,
      letterSpacing: 0.4);

  TextStyle get captionSmallRegular => const TextStyle(
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 12.0,
      height: 1.5,
      color: Appcolor.textMediumColor,
      letterSpacing: 0.4);

  TextStyle get labelLargeDemi => const TextStyle(
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 16.0,
      height: 1.0,
      color: Appcolor.textHighColor,
      letterSpacing: 0.0);

  TextStyle get labelTinyDemi => const TextStyle(
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 11.0,
      height: 1.0,
      color: Appcolor.textHighColor,
      letterSpacing: 0.0);
  TextStyle get labelTinyDemiSecond => const TextStyle(
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 10.0,
      height: 1.0,
      color: Appcolor.textHighColor,
      letterSpacing: 0.0);

  TextStyle get labelTinyRegularSecond => const TextStyle(
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 10.0,
      height: 1.0,
      color: Appcolor.textHighColor,
      letterSpacing: 0.0);

  TextStyle get labelSuperTinyDemi => const TextStyle(
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 7.0,
      height: 1.0,
      color: Appcolor.textHighColor,
      letterSpacing: 0.0);

  TextStyle get labelSuperTinyDemiSecond => const TextStyle(
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 9.0,
      height: 1.0,
      color: Appcolor.textHighColor,
      letterSpacing: 0.0);

  TextStyle get labelTagSmall => const TextStyle(
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 11.0,
      height: 1.0,
      letterSpacing: 0.0,
      color: Appcolor.textMediumColor);

  TextStyle get labelTagLarge => const TextStyle(
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 14.0,
      height: 1.0,
      letterSpacing: 0.0,
      color: Appcolor.textHighColor);

  TextStyle get labelTagRegular => const TextStyle(
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 12.0,
      height: 1.0,
      letterSpacing: 0.0,
      color: Appcolor.textHighColor);

  TextStyle get labelTagSmallW500 => const TextStyle(
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: 11.0,
      height: 1.0,
      letterSpacing: 0.0,
      color: Appcolor.textMediumColor);

  TextStyle get bodySmallRegular => const TextStyle(
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 14.0,
      height: 1.5,
      color: Appcolor.textHighColor,
      letterSpacing: 0.0);

  TextStyle get bodyMediumRegular => const TextStyle(
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 16.0,
      height: 1.5,
      color: Appcolor.textHighColor,
      letterSpacing: 0.0);

  TextStyle get bodyMediumBold => const TextStyle(
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 16.0,
      height: 1.5,
      color: Appcolor.textHighColor,
      letterSpacing: 0.0);

  TextStyle get bodySmallDemi => const TextStyle(
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 14.0,
      height: 1.5,
      color: Appcolor.textHighColor,
      letterSpacing: 0.0);

  TextStyle get bodySmallDemiW500 => const TextStyle(
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 14.0,
      height: 1.5,
      color: Appcolor.textHighColor,
      letterSpacing: 0.0);

  TextStyle get actualKPIDetail => const TextStyle(
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 32.0,
        height: 1.25,
      );
  TextStyle get actualKPIDetailRegular => const TextStyle(
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 32.0,
        height: 1.25,
      );
  TextStyle get headingH2Medium => const TextStyle(
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 24.0,
        height: 1.3,
      );
}
