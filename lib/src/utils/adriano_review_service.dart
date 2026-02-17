import 'package:in_app_review/in_app_review.dart';

class AdrianoReviewService {
  static final InAppReview _inAppReview = InAppReview.instance;

  /// Metodo 1: MANUALE (Per il tasto nel Menu/Drawer)
  /// Apre direttamente la pagina dello store. Funziona sempre.
  static Future<void> openStoreListing() async {
    // openStoreListing è sicuro, se non trova lo store gestisce l'errore internamente o non fa nulla
    await _inAppReview.openStoreListing();
  }

  /// Metodo 2: SMART POPUP (Da chiamare dopo un'azione positiva)
  /// Mostra il popup interno all'app (1-5 stelle) senza uscire.
  /// Android/Apple decidono SE mostrarlo (hanno dei limiti di frequenza).
  static Future<void> attemptReviewPopup() async {
    try {
      if (await _inAppReview.isAvailable()) {
        await _inAppReview.requestReview();
        // Nota: Non possiamo sapere se l'utente ha votato o ha chiuso il popup.
        // L'API non restituisce un risultato per privacy.
      }
    } catch (e) {
      // Ignoriamo errori silenziosamente, non vogliamo bloccare l'utente
      print("Errore Review Service: $e");
    }
  }
}
