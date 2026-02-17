import 'package:flutter/material.dart';
import 'app_colors.dart'; // Import interno al pacchetto

class AppTheme {
  // --- DARK THEME ---
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.midnightBackground,
      primaryColor: AppColors.emeraldPrimary,

      colorScheme: const ColorScheme.dark(
        primary: AppColors.emeraldPrimary,
        surface: AppColors.midnightSurface,
        onSurface: AppColors.textWhite,
        background: AppColors.midnightBackground,
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.midnightBackground,
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0, // Evita cambio colore allo scroll
        iconTheme: IconThemeData(color: AppColors.textWhite),
        titleTextStyle: TextStyle(
          color: AppColors.textWhite,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),

      // Definiamo uno stile di default per gli input, coerente con MainTextField
      inputDecorationTheme: _inputTheme(
        baseColor: AppColors.midnightSurface,
        textColor: AppColors.textWhite,
      ),
    );
  }

  // --- LIGHT THEME ---
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightBackground,
      primaryColor: AppColors.emeraldPrimary,

      colorScheme: const ColorScheme.light(
        primary: AppColors.emeraldPrimary,
        surface: AppColors.lightSurface,
        onSurface: AppColors.textBlack,
        background: AppColors.lightBackground,
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.lightBackground,
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(color: AppColors.textBlack),
        titleTextStyle: TextStyle(
          color: AppColors.textBlack,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),

      inputDecorationTheme: _inputTheme(
        baseColor: Colors.white,
        textColor: AppColors.textBlack,
      ),
    );
  }

  // Helper privato per non ripetere codice
  static InputDecorationTheme _inputTheme({
    required Color baseColor,
    required Color textColor,
  }) {
    return InputDecorationTheme(
      filled: true,
      fillColor: baseColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.emeraldPrimary, width: 2),
      ),
      labelStyle: TextStyle(color: textColor.withOpacity(0.7)),
      hintStyle: TextStyle(color: textColor.withOpacity(0.4)),
    );
  }
}
