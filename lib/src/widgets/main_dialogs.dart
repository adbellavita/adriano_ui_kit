import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'main_button.dart';

class MainDialogs {
  // Mostra un popup di errore o info semplice
  static void showInfo(
    BuildContext context, {
    required String title,
    required String message,
    required String okButtontext,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: isDark ? const Color(0xFF1E293B) : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          title,
          style: TextStyle(color: isDark ? Colors.white : Colors.black),
        ),
        content: Text(
          message,
          style: TextStyle(color: isDark ? Colors.white70 : Colors.black87),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(
              okButtontext,
              style: const TextStyle(
                color: AppColors.emeraldPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Mostra un popup di conferma (Sì/No) - Utile per "Cancella dati?"
  static Future<bool> showConfirm(
    BuildContext context, {
    required String title,
    required String message,
    required String okButtontext,
    required String cancelText,
  }) async {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: isDark ? const Color(0xFF1E293B) : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          title,
          style: TextStyle(color: isDark ? Colors.white : Colors.black),
        ),
        content: Text(
          message,
          style: TextStyle(color: isDark ? Colors.white70 : Colors.black87),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(
              cancelText,
              style: TextStyle(color: isDark ? Colors.grey : Colors.grey[600]),
            ),
          ),
          // Usiamo il nostro bottone per la conferma!
          SizedBox(
            width: 120,
            height: 40,
            child: MainButton(
              label: okButtontext,
              onPressed: () => Navigator.pop(ctx, true),
            ),
          ),
        ],
      ),
    );
    return result ?? false;
  }
}
