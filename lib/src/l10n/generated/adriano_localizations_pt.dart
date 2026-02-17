// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'adriano_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AdrianoLocalizationsPt extends AdrianoLocalizations {
  AdrianoLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get likeTitle => 'Você gosta do app?';

  @override
  String get likeMsg =>
      'Estamos trabalhando duro para torná-lo útil. Você está gostando?';

  @override
  String get btnYes => 'Sim, adorei!';

  @override
  String get btnNo => 'Não muito...';

  @override
  String get rateTitle => 'Dê 5 estrelas!';

  @override
  String get rateMsg =>
      'Incrível! Nos ajudaria muito se você deixasse uma avaliação rápida na loja.';

  @override
  String get btnRate => 'Avaliar agora';

  @override
  String get btnLater => 'Mais tarde';

  @override
  String get feedTitle => 'Como podemos melhorar?';

  @override
  String get feedHint => 'Escreva sua sugestão aqui...';

  @override
  String get btnSend => 'Enviar Feedback';

  @override
  String get btnCancel => 'Cancelar';

  @override
  String get emailSubject => 'Feedback do App';
}
