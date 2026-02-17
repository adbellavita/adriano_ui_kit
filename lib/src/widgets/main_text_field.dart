import 'package:adriano_ui_kit/adriano_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Serve per i Formatter

// Definiamo i tipi di input che la tua suite supporta
enum InputType {
  text, // Testo libero (Tastiera normale)
  integer, // Solo numeri interi (Tastiera 0-9)
  decimal, // Numeri, virgole e punti (Tastiera 0-9 + simboli)
}

class MainTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hint;
  final InputType inputType;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;
  final Function(String)? onChanged;

  const MainTextField({
    super.key,
    required this.controller,
    required this.label,
    this.hint,
    this.inputType = InputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Definiamo i colori locali usando AppColors
    final Color textColor = isDark ? AppColors.white : AppColors.black;
    final Color borderColor = isDark ? AppColors.white24 : AppColors.grey300;
    final Color fillColor = isDark ? AppColors.white10 : AppColors.grey50;
    final Color focusColor =
        AppColors.emeraldPrimary; // Focus è sempre smeraldo

    return TextField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: _getKeyboardType(),
      inputFormatters: _getFormatters(),
      cursorColor: focusColor, // Anche il cursore segue il brand
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        // Colore delle icone e label quando non a fuoco
        prefixIconColor: isDark ? AppColors.grey500 : AppColors.grey500,
        suffixIconColor: isDark ? AppColors.grey500 : AppColors.grey500,
        labelStyle: TextStyle(
          color: isDark ? AppColors.grey500 : AppColors.grey500,
        ),

        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon != null
            ? IconButton(icon: Icon(suffixIcon), onPressed: onSuffixTap)
            : null,

        // BORDO A RIPOSO
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: borderColor, width: 1.5),
        ),

        // BORDO FOCUS (Attivo)
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: focusColor, // Usa il colore brand
            width: 2.5,
          ),
        ),

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
        return [FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]'))];
      case InputType.text:
        return [];
    }
  }
}
