import 'package:flutter/material.dart';
import 'package:flutter_practise/fonts/font_manager.dart';

class TextStylesApp {
  ///weight: 300
  static TextStyle light({
    double fontSize = 14.0,
    required Color color,
    double? lineHeight,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightApp.light,
      color: color,
      height: lineHeight != null ? lineHeight / fontSize : null,
    );
  }

  ///weight: 400
  static TextStyle regular({
    double fontSize = 16.0,
    required Color color,
    double? lineHeight,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightApp.regular,
      color: color,
      height: lineHeight != null ? lineHeight / fontSize : null,
    );
  }

  ///weight: 500
  static TextStyle medium({
    double fontSize = 16.0,
    required Color color,
    double? lineHeight,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightApp.medium,
      color: color,
      height: lineHeight != null ? lineHeight / fontSize : null,
    );
  }

  ///weight: 600
  static TextStyle semiBold({
    double fontSize = 18.0,
    required Color color,
    double? lineHeight,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightApp.semiBold,
      color: color,
      height: lineHeight != null ? lineHeight / fontSize : null,
    );
  }

  ///weight: 700
  static TextStyle bold({
    double fontSize = 18.0,
    required Color color,
    double? lineHeight,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightApp.bold,
      color: color,
      height: lineHeight != null ? lineHeight / fontSize : null,
    );
  }
}
