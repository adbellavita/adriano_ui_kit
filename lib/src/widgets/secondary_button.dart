import 'package:flutter/material.dart';
import '../theme/app_colors.dart'; // <--- Importante

class SecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;

  const SecondaryButton({
    super.key,
    this.onPressed,
    required this.label,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bool isEnabled = onPressed != null;

    // 1. Definiamo i colori usando SOLO AppColors
    final Color activeColor =
        AppColors.emeraldPrimary; // O emeraldDark se preferisci

    final Color disabledColor = isDark ? AppColors.white30 : AppColors.grey300;

    final Color currentColor = isEnabled ? activeColor : disabledColor;

    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: icon != null
          ? Icon(icon, size: 20, color: currentColor)
          : const SizedBox.shrink(),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(55),
        // 2. Usiamo currentColor che deriva da AppColors
        side: BorderSide(color: currentColor, width: 2.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        foregroundColor: currentColor,
        splashFactory: isEnabled ? null : NoSplash.splashFactory,
      ),
    );
  }
}
