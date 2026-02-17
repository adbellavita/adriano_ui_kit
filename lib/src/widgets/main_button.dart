import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class MainButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;

  const MainButton({super.key, required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bool isEnabled = onPressed != null;

    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        // Gradiente attivo solo se Dark Mode e Abilitato
        gradient: isEnabled && isDark
            ? const LinearGradient(
                colors: [AppColors.emeraldPrimary, AppColors.emeraldDark],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        // Colore di sfondo
        color: !isEnabled
            ? (isDark
                  ? Colors.grey.withValues(alpha: 0.2)
                  : Colors.grey.shade300)
            : (isDark ? null : AppColors.lightPrimary),
        // Ombra
        boxShadow: isEnabled && isDark
            ? [
                BoxShadow(
                  color: AppColors.emeraldPrimary.withValues(alpha: 0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          disabledForegroundColor: isDark
              ? Colors.white30
              : Colors.grey.shade500,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isEnabled
                ? AppColors.white
                : (isDark ? Colors.white30 : Colors.grey.shade500),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
