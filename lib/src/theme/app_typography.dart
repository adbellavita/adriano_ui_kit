import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTypography {
  // Titoli grandi (es. Risultato Calcolo)
  static const TextStyle header1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w800,
    letterSpacing: -1.0,
    height: 1.2,
  );

  // Titoli di sezione (es. "Impostazioni")
  static const TextStyle header2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
  );

  // Etichette (es. Label dei campi input)
  static const TextStyle label = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
  );

  // Testo normale (es. Descrizioni)
  static const TextStyle body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    height: 1.5,
  );

  // Helper per ottenere il colore giusto in base al tema
  static TextStyle header1Color(bool isDark) =>
      header1.copyWith(color: isDark ? AppColors.white : AppColors.black);

  static TextStyle bodyColor(bool isDark) => body.copyWith(
    color: isDark ? AppColors.grey500 : AppColors.black.withOpacity(0.7),
  );
}
