import 'package:flutter/material.dart';

// Theme
Color primaryColor = const Color(0xFF554AF0);
// Base
Color whiteColor = const Color(0xFFFFFFFF);
Color blackColor = const Color(0xFF000000);
Color greyColor = const Color(0xFFBBBBBB);
// Shimmer
Color shimmerColor = const Color(0xFFDDDDDD);
Color lightColor = const Color(0xFFF7F7F7);

List<BoxShadow> boxShadow(double offset) => [
      BoxShadow(
        color: greyColor.withOpacity(0.4),
        spreadRadius: 1,
        blurRadius: 7,
        offset: Offset(0, offset),
      ),
    ];

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semibold = FontWeight.w600;

TextStyle titleText(double font) => TextStyle(
      color: blackColor,
      fontWeight: semibold,
      fontSize: font,
    );

TextStyle subtitleText(double font) => TextStyle(
      color: greyColor,
      fontWeight: regular,
      fontSize: font,
    );

TextStyle whiteText(double font) => TextStyle(
      color: whiteColor,
      fontWeight: semibold,
      fontSize: font,
    );

TextStyle mediumText(double font) => TextStyle(
      color: blackColor,
      fontWeight: medium,
      fontSize: font,
    );

TextStyle lightText(double font) => TextStyle(
      color: blackColor,
      fontWeight: light,
      fontSize: font,
    );
