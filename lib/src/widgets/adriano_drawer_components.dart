import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

// -----------------------------------------------------------------------------
// 1. ADRIANO DRAWER HEADER
// -----------------------------------------------------------------------------
class AdrianoDrawerHeader extends StatelessWidget {
  final String appTitle;
  final String version;
  final IconData logoIcon;

  const AdrianoDrawerHeader({
    super.key,
    required this.appTitle,
    required this.version, // Passa "v 1.0.0" da fuori
    this.logoIcon = Icons.percent_rounded,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.fromLTRB(24, 60, 24, 24),
      decoration: BoxDecoration(
        color: isDark 
            ? Colors.black12 
            : AppColors.emeraldPrimary.withValues(alpha: 0.05),
        border: Border(bottom: BorderSide(
          color: isDark ? Colors.white10 : Colors.grey.withValues(alpha: 0.1),
        )),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.emeraldPrimary,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.emeraldPrimary.withValues(alpha: 0.4),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                )
              ]
            ),
            child: Icon(logoIcon, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                appTitle,
                style: TextStyle(
                  fontSize: 18, 
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : AppColors.black,
                ),
              ),
              Text(
                version,
                style: TextStyle(
                  fontSize: 12, 
                  color: isDark ? AppColors.textGrey : Colors.grey,
                  fontWeight: FontWeight.w500
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// 2. ADRIANO SECTION LABEL
// -----------------------------------------------------------------------------
class AdrianoSectionLabel extends StatelessWidget {
  final String label;
  const AdrianoSectionLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, bottom: 8),
      child: Text(
        label.toUpperCase(),
        style: const TextStyle(
          color: AppColors.emeraldPrimary,
          fontSize: 11,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// 3. ADRIANO SETTINGS TILE (Boxed Style)
// -----------------------------------------------------------------------------
class AdrianoSettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget trailing;
  final VoidCallback onTap;

  const AdrianoSettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.trailing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: isDark ? AppColors.white10 : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? Colors.white10 : Colors.grey.withValues(alpha: 0.2),
        ),
        boxShadow: isDark ? null : [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.emeraldPrimary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: AppColors.emeraldPrimary, size: 22),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: isDark ? Colors.white : AppColors.black,
          ),
        ),
        trailing: trailing,
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// 4. ADRIANO ACTION TILE (Minimal Style)
// -----------------------------------------------------------------------------
class AdrianoActionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const AdrianoActionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = isDark ? Colors.grey.shade400 : Colors.grey.shade700;

    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      leading: Icon(icon, color: color, size: 24),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
          color: color,
        ),
      ),
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}

// -----------------------------------------------------------------------------
// 5. ADRIANO DRAWER FOOTER
// -----------------------------------------------------------------------------
class AdrianoDrawerFooter extends StatelessWidget {
  final String text;
  const AdrianoDrawerFooter({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isDark ? AppColors.textGrey : Colors.grey.shade400,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}