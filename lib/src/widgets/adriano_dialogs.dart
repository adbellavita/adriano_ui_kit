import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

class AdrianoDialogs {
  /// Mostra un dialogo informativo con un solo bottone.
  /// Ritorna [Future<void>].
  static Future<void> showInfo(
    BuildContext context, {
    required String title,
    required String message,
    required String buttonText, // Obbligatorio: niente fallback!
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Colori dinamici
    final bgColor = isDark ? AppColors.surfaceDark : AppColors.surfaceLight;
    final titleColor = isDark
        ? AppColors.textPrimaryDark
        : AppColors.textPrimaryLight;
    final msgColor = isDark
        ? AppColors.textSecondaryDark
        : AppColors.textSecondaryLight;

    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: bgColor,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

        title: Text(
          title,
          style: AppTypography.header2.copyWith(color: titleColor),
        ),
        content: Text(
          message,
          style: AppTypography.body.copyWith(color: msgColor),
        ),

        actionsPadding: const EdgeInsets.all(20),
        actions: [
          SizedBox(
            width: double.infinity, // Bottone largo per l'info
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.emeraldPrimary,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: () => Navigator.pop(ctx),
              child: Text(
                buttonText,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Mostra un dialogo di conferma (Sì/No).
  /// Ritorna [true] se confermato, [false] se annullato (bottone), [null] se chiuso cliccando fuori.
  static Future<bool?> showConfirm(
    BuildContext context, {
    required String title,
    required String message,
    required String confirmText, // Obbligatorio
    required String cancelText, // Obbligatorio
    bool isDanger = false, // Opzionale: cambia colore in rosso
  }) async {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final bgColor = isDark ? AppColors.surfaceDark : AppColors.surfaceLight;
    final titleColor = isDark
        ? AppColors.textPrimaryDark
        : AppColors.textPrimaryLight;
    final msgColor = isDark
        ? AppColors.textSecondaryDark
        : AppColors.textSecondaryLight;
    final cancelColor = isDark
        ? AppColors.textSecondaryDark
        : AppColors.textSecondaryLight;

    return showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: bgColor,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

        title: Text(
          title,
          style: AppTypography.header2.copyWith(color: titleColor),
        ),
        content: Text(
          message,
          style: AppTypography.body.copyWith(color: msgColor),
        ),

        actionsPadding: const EdgeInsets.all(20),
        actions: [
          // Tasto Annulla (Testo semplice)
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(
              cancelText,
              style: TextStyle(
                color: cancelColor,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),

          // Tasto Conferma (Bottone colorato)
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: isDanger ? Colors.red : AppColors.emeraldPrimary,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              confirmText,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  /// Mostra un dialogo con un campo di input testo.
  /// Ritorna la [String] inserita se confermato, o [null] se annullato.
  static Future<String?> showInput(
    BuildContext context, {
    required String title,
    required String hintText, // Obbligatorio
    required String confirmText, // Obbligatorio
    required String cancelText, // Obbligatorio
  }) async {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final bgColor = isDark ? AppColors.surfaceDark : AppColors.surfaceLight;
    final titleColor = isDark
        ? AppColors.textPrimaryDark
        : AppColors.textPrimaryLight;
    final cancelColor = isDark
        ? AppColors.textSecondaryDark
        : AppColors.textSecondaryLight;
    final inputBg = isDark
        ? AppColors.midnightBackground
        : AppColors.inputBackgroundLight;
    final textColor = isDark
        ? AppColors.textPrimaryDark
        : AppColors.textPrimaryLight;
    final hintColor = isDark
        ? AppColors.textSecondaryDark
        : AppColors.textSecondaryLight;

    final TextEditingController controller = TextEditingController();

    return showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: bgColor,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

        title: Text(
          title,
          style: AppTypography.header2.copyWith(color: titleColor),
        ),

        content: TextField(
          controller: controller,
          autofocus: true,
          maxLines: 3,
          style: TextStyle(color: textColor),
          cursorColor: AppColors.emeraldPrimary,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: hintColor),
            filled: true,
            fillColor: inputBg,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.emeraldPrimary,
                width: 2,
              ),
            ),
            contentPadding: const EdgeInsets.all(16),
          ),
        ),

        actionsPadding: const EdgeInsets.all(20),
        actions: [
          // Tasto Annulla
          TextButton(
            onPressed: () => Navigator.pop(ctx, null),
            child: Text(cancelText, style: TextStyle(color: cancelColor)),
          ),

          // Tasto Conferma
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.emeraldPrimary,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            onPressed: () => Navigator.pop(ctx, controller.text),
            child: Text(
              confirmText,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
