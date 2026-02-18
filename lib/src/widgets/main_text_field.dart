import 'package:adriano_ui_kit/adriano_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum InputType { text, integer, decimal }

class MainTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? label; // <--- ORA È OPZIONALE
  final String? hint;
  final InputType inputType;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;
  final Function(String)? onChanged;

  // --- NUOVI PARAMETRI ---
  final bool readOnly; // Per il campo di output
  final TextAlign textAlign; // Per allineare i numeri a destra
  final double fontSize; // Per fare i numeri grandi
  final bool removeBorder; // Per togliere il bordo quando è dentro una card

  const MainTextField({
    super.key,
    required this.controller,
    this.label, // Non più required
    this.hint,
    this.inputType = InputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.onChanged,
    // Default values per non rompere il vecchio codice
    this.readOnly = false,
    this.textAlign = TextAlign.start,
    this.fontSize = 18,
    this.removeBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final Color textColor = isDark ? AppColors.white : AppColors.black;
    // Se removeBorder è true, rendiamo trasparente il bordo
    final Color borderColor = removeBorder
        ? Colors.transparent
        : (isDark ? AppColors.white24 : AppColors.grey300);

    final Color fillColor = removeBorder
        ? Colors
              .transparent // Niente sfondo se "borderless"
        : (isDark ? AppColors.white10 : AppColors.grey50);

    final Color focusColor = AppColors.emeraldPrimary;

    return TextField(
      controller: controller,
      onChanged: onChanged,
      readOnly: readOnly, // <--- USIAMO IL PARAMETRO
      textAlign: textAlign, // <--- USIAMO IL PARAMETRO
      keyboardType: _getKeyboardType(),
      inputFormatters: _getFormatters(),
      cursorColor: focusColor,

      style: TextStyle(
        fontSize: fontSize, // <--- USIAMO IL PARAMETRO
        fontWeight: FontWeight.w600,
        color: readOnly
            ? textColor.withValues(alpha: 0.7)
            : textColor, // Leggermente più chiaro se readOnly
      ),

      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        hintStyle: TextStyle(
          color: isDark ? AppColors.grey500 : AppColors.grey400,
          fontSize: fontSize, // L'hint segue la grandezza del testo
        ),

        prefixIconColor: AppColors.grey500,
        suffixIconColor: AppColors.grey500,
        labelStyle: TextStyle(color: AppColors.grey500),

        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon != null
            ? IconButton(icon: Icon(suffixIcon), onPressed: onSuffixTap)
            : null,

        // GESTIONE BORDI
        enabledBorder: removeBorder
            ? InputBorder.none
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: borderColor, width: 1.5),
              ),

        focusedBorder: removeBorder
            ? InputBorder.none
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: focusColor, width: 2.5),
              ),

        contentPadding: removeBorder
            ? EdgeInsets.zero
            : null, // Rimuove padding extra se senza bordo

        filled: true,
        fillColor: fillColor,
      ),
    );
  }

  TextInputType _getKeyboardType() {
    switch (inputType) {
      case InputType.integer:
        return TextInputType.number;
      case InputType.decimal:
        return const TextInputType.numberWithOptions(decimal: true);
      case InputType.text:
        return TextInputType.text;
    }
  }

  List<TextInputFormatter> _getFormatters() {
    switch (inputType) {
      case InputType.integer:
        return [FilteringTextInputFormatter.digitsOnly];
      case InputType.decimal:
        // Nota: consentiamo sia punto che virgola per gestire tastiere IT/EN
        return [FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]'))];
      case InputType.text:
        return [];
    }
  }
}
