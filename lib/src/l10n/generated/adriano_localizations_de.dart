// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'adriano_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AdrianoLocalizationsDe extends AdrianoLocalizations {
  AdrianoLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get likeTitle => 'Gefällt dir die App?';

  @override
  String get likeMsg =>
      'Wir arbeiten hart daran, sie nützlich zu machen. Gefällt sie dir?';

  @override
  String get btnYes => 'Ja, sehr!';

  @override
  String get btnNo => 'Nicht wirklich...';

  @override
  String get rateTitle => 'Gib uns 5 Sterne!';

  @override
  String get rateMsg =>
      'Großartig! Es würde uns sehr helfen, wenn du eine kurze Bewertung im Store hinterlassen könntest.';

  @override
  String get btnRate => 'Jetzt bewerten';

  @override
  String get btnLater => 'Später';

  @override
  String get feedTitle => 'Wie können wir uns verbessern?';

  @override
  String get feedHint => 'Schreibe deinen Vorschlag hier...';

  @override
  String get btnSend => 'Feedback senden';

  @override
  String get btnCancel => 'Abbrechen';

  @override
  String get emailSubject => 'App Feedback';
}
