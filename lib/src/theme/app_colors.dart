import 'package:flutter/material.dart';

class AppColors {
  // --- BRAND COLORS (Smeraldo) ---
  static const Color emeraldPrimary = Color(0xFF10B981);
  static const Color emeraldDark = Color(0xFF059669);
  static const Color lightPrimary = Color(0xFF34D399);

  // --- NEUTRAL / GREY SCALE (Per bordi, testi secondari, disabilitati) ---
  static const Color white = Colors.white;
  static const Color black = Colors.black87;

  // Grigi per Light Mode
  static const Color grey50 = Color(0xFFF9FAFB); // Sfondo input light
  static const Color grey300 = Color(
    0xFFE0E0E0,
  ); // Bordo input / Disabilitato light
  static const Color grey500 = Color(
    0xFF9E9E9E,
  ); // Testo hint / Disabilitato dark

  // Grigi per Dark Mode
  static const Color white10 = Colors.white10; // Sfondo input dark
  static const Color white24 = Colors.white24; // Bordo input dark
  static const Color white30 = Colors.white30; // Testo disabilitato dark

  // --- SURFACE & BACKGROUNDS ---
  // Definisci qui i colori per i dialog e gli sfondi
  static const Color surfaceLight = Colors.white;
  static const Color surfaceDark = Color(0xFF1E293B); // Midnight Blue scuro

  static const Color inputBackgroundLight = Color(0xFFF3F4F6);
  static const Color inputBackgroundDark = Color(0xFF0F172A);

  // --- TEXTS ---
  static const Color textPrimaryLight = Colors.black87;
  static const Color textPrimaryDark = Colors.white;

  static const Color textSecondaryLight = Color(0xFF6B7280); // Grey 500
  static const Color textSecondaryDark = Color(
    0xFF9CA3AF,
  ); // Grey 400// --- BACKGROUNDS & SURFACES ---
  static const Color midnightBackground = Color(
    0xFF0F172A,
  ); // Il tuo sfondo scuro
  static const Color midnightSurface = Color(0xFF1E293B); // Le card scure

  static const Color lightBackground = Color(0xFFF9FAFB); // Sfondo chiaro
  static const Color lightSurface = Colors.white; // Card chiare

  // --- TEXTS ---
  static const Color textWhite = Colors.white;
  static const Color textBlack = Colors.black87;

  static const Color textGrey = Color(0xFF9CA3AF); // Un grigio medio/chiaro

  // --- UTILITY / SAVINGS ---
  // Sostituiscono Amber e Orange
  static const Color savingsLight = Color(0xFFFF9800); // Orange
  static const Color savingsDark = Color(0xFFFFC107); // Amber
}
