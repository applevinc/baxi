import 'package:baxi/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get theme {
    return ThemeData(
      primarySwatch: Colors.blue,
      // textTheme: GoogleFonts.poppinsTextTheme().apply(
      //   displayColor: AppColors.text,
      //   bodyColor: AppColors.text,
      // ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 50.h,
      ),
    );
  }
}
