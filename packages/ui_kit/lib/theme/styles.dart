import 'package:flutter/material.dart';
import 'package:ui_kit/theme/colors.dart';

class AppTextStyles {
  AppTextStyles._();

  //* First title.
  static TextStyle firstTitleSemiBold({
    Color? color = AppColors.black,
    FontWeight? fontWeight = FontWeight.w600,
  }) {
    return TextStyle(
      fontSize: 24,
      fontFamily: 'SFProDisplay',
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle firstTitleExtraBold({
    Color? color = AppColors.black,
    FontWeight? fontWeight = FontWeight.w800,
  }) {
    return TextStyle(
      fontSize: 24,
      fontFamily: 'SFProDisplay',
      fontWeight: fontWeight,
      color: color,
    );
  }

  //* Second title.
  static TextStyle secondTitleRegular({
    Color? color = AppColors.black,
    FontWeight? fontWeight = FontWeight.w400,
  }) {
    return TextStyle(
      fontSize: 20,
      fontFamily: 'SFProDisplay',
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle secondTitleSemibold({
    Color? color = AppColors.black,
    FontWeight? fontWeight = FontWeight.w600,
  }) {
    return TextStyle(
      fontSize: 20,
      fontFamily: 'SFProDisplay',
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle secondTitleExtraBold({
    Color? color = AppColors.black,
    FontWeight? fontWeight = FontWeight.w800,
  }) {
    return TextStyle(
      fontSize: 20,
      fontFamily: 'SFProDisplay',
      fontWeight: fontWeight,
      color: color,
    );
  }

  //* Third title.
  static TextStyle thirdTitleRegular({
    Color? color = AppColors.black,
    FontWeight? fontWeight = FontWeight.w400,
  }) {
    return TextStyle(
      fontSize: 17,
      fontFamily: 'SFProText',
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle thirdTitleMedium({
    Color? color = AppColors.black,
    FontWeight? fontWeight = FontWeight.w500,
  }) {
    return TextStyle(
      fontSize: 17,
      fontFamily: 'SFProText',
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle thirdTitleSemibold({
    Color? color = AppColors.black,
    FontWeight? fontWeight = FontWeight.w600,
  }) {
    return TextStyle(
      fontSize: 17,
      fontFamily: 'SFProText',
      fontWeight: fontWeight,
      color: color,
    );
  }

  //* Headline.
  static TextStyle headlineRegular({
    Color? color = AppColors.black,
    FontWeight? fontWeight = FontWeight.w400,
  }) {
    return TextStyle(
      fontSize: 16,
      fontFamily: 'SFProText',
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle headlineMedium({
    Color? color = AppColors.black,
    FontWeight? fontWeight = FontWeight.w500,
  }) {
    return TextStyle(
      fontSize: 16,
      fontFamily: 'SFProText',
      fontWeight: fontWeight,
      color: color,
    );
  }

  //* Text.
  static TextStyle textRegular({
    Color? color = AppColors.black,
    FontWeight? fontWeight = FontWeight.w400,
  }) {
    return TextStyle(
      fontSize: 15,
      fontFamily: 'SFProText',
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle textMedium({
    Color? color = AppColors.black,
    FontWeight? fontWeight = FontWeight.w500,
  }) {
    return TextStyle(
      fontSize: 15,
      fontFamily: 'SFProText',
      fontWeight: fontWeight,
      color: color,
    );
  }

  //* Caption.
  static TextStyle captionRegular({
    Color? color = AppColors.black,
    FontWeight? fontWeight = FontWeight.w400,
  }) {
    return TextStyle(
      fontSize: 14,
      fontFamily: 'SFProText',
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle captionSemibold({
    Color? color = AppColors.black,
    FontWeight? fontWeight = FontWeight.w600,
  }) {
    return TextStyle(
      fontSize: 14,
      fontFamily: 'SFProText',
      fontWeight: fontWeight,
      color: color,
    );
  }

  //* Second caption.
  static TextStyle secondCaptionRegular({
    Color? color = AppColors.black,
    FontWeight? fontWeight = FontWeight.w400,
  }) {
    return TextStyle(
      fontSize: 12,
      fontFamily: 'SFProText',
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle secondCaptionBold({
    Color? color = AppColors.black,
    FontWeight? fontWeight = FontWeight.w700,
  }) {
    return TextStyle(
      fontSize: 12,
      fontFamily: 'SFProText',
      fontWeight: fontWeight,
      color: color,
    );
  }
}
