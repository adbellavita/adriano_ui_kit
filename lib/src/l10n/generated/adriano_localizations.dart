import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'adriano_localizations_de.dart';
import 'adriano_localizations_en.dart';
import 'adriano_localizations_es.dart';
import 'adriano_localizations_fr.dart';
import 'adriano_localizations_it.dart';
import 'adriano_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AdrianoLocalizations
/// returned by `AdrianoLocalizations.of(context)`.
///
/// Applications need to include `AdrianoLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/adriano_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AdrianoLocalizations.localizationsDelegates,
///   supportedLocales: AdrianoLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AdrianoLocalizations.supportedLocales
/// property.
abstract class AdrianoLocalizations {
  AdrianoLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AdrianoLocalizations? of(BuildContext context) {
    return Localizations.of<AdrianoLocalizations>(
      context,
      AdrianoLocalizations,
    );
  }

  static const LocalizationsDelegate<AdrianoLocalizations> delegate =
      _AdrianoLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('it'),
    Locale('pt'),
  ];

  /// No description provided for @likeTitle.
  ///
  /// In en, this message translates to:
  /// **'Do you like the app?'**
  String get likeTitle;

  /// No description provided for @likeMsg.
  ///
  /// In en, this message translates to:
  /// **'We are working hard to make it useful. Are you enjoying it?'**
  String get likeMsg;

  /// No description provided for @btnYes.
  ///
  /// In en, this message translates to:
  /// **'Yes, I love it!'**
  String get btnYes;

  /// No description provided for @btnNo.
  ///
  /// In en, this message translates to:
  /// **'Not really...'**
  String get btnNo;

  /// No description provided for @rateTitle.
  ///
  /// In en, this message translates to:
  /// **'Rate us!'**
  String get rateTitle;

  /// No description provided for @rateMsg.
  ///
  /// In en, this message translates to:
  /// **'Awesome! It would help us a lot if you could leave a quick review on the store.'**
  String get rateMsg;

  /// No description provided for @btnRate.
  ///
  /// In en, this message translates to:
  /// **'Rate now'**
  String get btnRate;

  /// No description provided for @btnLater.
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get btnLater;

  /// No description provided for @feedTitle.
  ///
  /// In en, this message translates to:
  /// **'How can we improve?'**
  String get feedTitle;

  /// No description provided for @feedHint.
  ///
  /// In en, this message translates to:
  /// **'Write your suggestion here...'**
  String get feedHint;

  /// No description provided for @btnSend.
  ///
  /// In en, this message translates to:
  /// **'Send Feedback'**
  String get btnSend;

  /// No description provided for @btnCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get btnCancel;

  /// No description provided for @emailSubject.
  ///
  /// In en, this message translates to:
  /// **'App Feedback'**
  String get emailSubject;
}

class _AdrianoLocalizationsDelegate
    extends LocalizationsDelegate<AdrianoLocalizations> {
  const _AdrianoLocalizationsDelegate();

  @override
  Future<AdrianoLocalizations> load(Locale locale) {
    return SynchronousFuture<AdrianoLocalizations>(
      lookupAdrianoLocalizations(locale),
    );
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'de',
    'en',
    'es',
    'fr',
    'it',
    'pt',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AdrianoLocalizationsDelegate old) => false;
}

AdrianoLocalizations lookupAdrianoLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AdrianoLocalizationsDe();
    case 'en':
      return AdrianoLocalizationsEn();
    case 'es':
      return AdrianoLocalizationsEs();
    case 'fr':
      return AdrianoLocalizationsFr();
    case 'it':
      return AdrianoLocalizationsIt();
    case 'pt':
      return AdrianoLocalizationsPt();
  }

  throw FlutterError(
    'AdrianoLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
