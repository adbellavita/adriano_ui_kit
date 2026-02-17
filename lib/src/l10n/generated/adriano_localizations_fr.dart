// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'adriano_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AdrianoLocalizationsFr extends AdrianoLocalizations {
  AdrianoLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get likeTitle => 'Aimez-vous l\'application ?';

  @override
  String get likeMsg =>
      'Nous travaillons dur pour la rendre utile. L\'appréciez-vous ?';

  @override
  String get btnYes => 'Oui, j\'adore !';

  @override
  String get btnNo => 'Pas vraiment...';

  @override
  String get rateTitle => 'Donnez-nous 5 étoiles !';

  @override
  String get rateMsg =>
      'Génial ! Cela nous aiderait beaucoup si vous laissiez un avis rapide sur le store.';

  @override
  String get btnRate => 'Noter maintenant';

  @override
  String get btnLater => 'Plus tard';

  @override
  String get feedTitle => 'Comment pouvons-nous nous améliorer ?';

  @override
  String get feedHint => 'Écrivez votre suggestion ici...';

  @override
  String get btnSend => 'Envoyer';

  @override
  String get btnCancel => 'Annuler';

  @override
  String get emailSubject => 'Commentaires App';
}
