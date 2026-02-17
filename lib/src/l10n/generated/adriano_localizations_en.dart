// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'adriano_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AdrianoLocalizationsEn extends AdrianoLocalizations {
  AdrianoLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get likeTitle => 'Do you like the app?';

  @override
  String get likeMsg =>
      'We are working hard to make it useful. Are you enjoying it?';

  @override
  String get btnYes => 'Yes, I love it!';

  @override
  String get btnNo => 'Not really...';

  @override
  String get rateTitle => 'Rate us!';

  @override
  String get rateMsg =>
      'Awesome! It would help us a lot if you could leave a quick review on the store.';

  @override
  String get btnRate => 'Rate now';

  @override
  String get btnLater => 'Later';

  @override
  String get feedTitle => 'How can we improve?';

  @override
  String get feedHint => 'Write your suggestion here...';

  @override
  String get btnSend => 'Send Feedback';

  @override
  String get btnCancel => 'Cancel';

  @override
  String get emailSubject => 'App Feedback';
}
