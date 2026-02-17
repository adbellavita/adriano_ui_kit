import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher.dart';

// Import localizzazioni generate
import '../l10n/generated/adriano_localizations.dart';

import '../widgets/adriano_dialogs.dart';
import '../theme/app_colors.dart';

class AdrianoReviewManager {
  // Configurazione soglia
  static const int _threshold = 1;
  static const String _keyCount = 'adriano_review_count';
  static const String _keyRated = 'adriano_review_rated';

  final String supportEmail;
  final String appStoreId;

  AdrianoReviewManager({required this.supportEmail, this.appStoreId = ''});

  /// Metodo principale da chiamare dopo un'azione positiva (es. calcolo riuscito)
  Future<void> incrementAndCheck(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();

    // Se ha già votato o dato feedback, esce (Scommenta per produzione)
    // if (prefs.getBool(_keyRated) ?? false) return;

    int count = prefs.getInt(_keyCount) ?? 0;
    count++;
    await prefs.setInt(_keyCount, count);

    // Controlla se è il momento di mostrare il dialog
    if (count > 0 && count % _threshold == 0) {
      if (context.mounted) {
        _showDoYouLikeDialog(context, prefs);
      }
    }
  }

  // STEP 1: Dialogo iniziale "Ti piace l'app?"
  void _showDoYouLikeDialog(
    BuildContext context,
    SharedPreferences prefs,
  ) async {
    final l10n = AdrianoLocalizations.of(context)!;

    // Usiamo showConfirm che ora richiede tutti i parametri
    // true = Sì (Mi piace)
    // false = No (Non mi piace)
    // null = Annullato/Click fuori
    final bool? liked = await AdrianoDialogs.showConfirm(
      context,
      title: l10n.likeTitle,
      message: l10n.likeMsg,
      confirmText: l10n.btnYes,
      cancelText: l10n.btnNo,
    );

    if (liked == true) {
      if (context.mounted) _showRateOnStoreDialog(context, prefs);
    } else if (liked == false) {
      if (context.mounted) _showFeedbackInput(context, prefs);
    }
  }

  // STEP 2A: Utente Felice -> Chiedi recensione store
  void _showRateOnStoreDialog(
    BuildContext context,
    SharedPreferences prefs,
  ) async {
    final l10n = AdrianoLocalizations.of(context)!;

    final bool? readyToRate = await AdrianoDialogs.showConfirm(
      context,
      title: l10n.rateTitle,
      message: l10n.rateMsg,
      confirmText: l10n.btnRate,
      cancelText: l10n.btnLater,
    );

    if (readyToRate == true) {
      // Segna come "fatto" per non disturbare più
      await prefs.setBool(_keyRated, true);

      final InAppReview inAppReview = InAppReview.instance;
      if (await inAppReview.isAvailable()) {
        // Apre direttamente la scheda dello store
        inAppReview.openStoreListing(appStoreId: appStoreId);
      }
    }
  }

  // STEP 2B: Utente Scontento -> Chiedi feedback via email
  void _showFeedbackInput(BuildContext context, SharedPreferences prefs) async {
    final l10n = AdrianoLocalizations.of(context)!;

    // Richiede input testuale
    final String? feedbackText = await AdrianoDialogs.showInput(
      context,
      title: l10n.feedTitle,
      hintText: l10n.feedHint,
      confirmText: l10n.btnSend,
      cancelText: l10n.btnCancel,
    );

    if (feedbackText != null && feedbackText.trim().isNotEmpty) {
      // Invia email e segna come "fatto"
      _sendSupportEmail(feedbackText, l10n.emailSubject);
      await prefs.setBool(_keyRated, true);

      if (context.mounted) {
        // SnackBar stilizzata con AppColors
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.emeraldPrimary,
            content: Text(
              l10n.btnSend, // "Inviato" (o stringa simile)
              style: const TextStyle(color: AppColors.white),
            ),
          ),
        );
      }
    }
  }

  Future<void> _sendSupportEmail(String body, String subject) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: supportEmail,
      query: _encodeQueryParameters({'subject': subject, 'body': body}),
    );

    try {
      await launchUrl(emailUri);
    } catch (e) {
      debugPrint("Errore apertura email: $e");
    }
  }

  String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map(
          (e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
        )
        .join('&');
  }
}
