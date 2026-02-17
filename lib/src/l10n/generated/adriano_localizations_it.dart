// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'adriano_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AdrianoLocalizationsIt extends AdrianoLocalizations {
  AdrianoLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get likeTitle => 'Ti piace l\'app?';

  @override
  String get likeMsg =>
      'Stiamo lavorando sodo per renderla utile. Ti stai trovando bene?';

  @override
  String get btnYes => 'Sì, molto!';

  @override
  String get btnNo => 'Non tanto...';

  @override
  String get rateTitle => 'Dacci 5 stelle!';

  @override
  String get rateMsg =>
      'Fantastico! Ci aiuteresti tantissimo lasciando una recensione veloce sullo store.';

  @override
  String get btnRate => 'Valuta ora';

  @override
  String get btnLater => 'Più tardi';

  @override
  String get feedTitle => 'Come possiamo migliorare?';

  @override
  String get feedHint => 'Scrivi qui il tuo suggerimento...';

  @override
  String get btnSend => 'Invia Feedback';

  @override
  String get btnCancel => 'Annulla';

  @override
  String get emailSubject => 'Feedback App';
}
