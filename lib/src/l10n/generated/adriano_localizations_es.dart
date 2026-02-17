// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'adriano_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AdrianoLocalizationsEs extends AdrianoLocalizations {
  AdrianoLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get likeTitle => '¿Te gusta la app?';

  @override
  String get likeMsg =>
      'Estamos trabajando duro para que sea útil. ¿La estás disfrutando?';

  @override
  String get btnYes => '¡Sí, me encanta!';

  @override
  String get btnNo => 'No mucho...';

  @override
  String get rateTitle => '¡Danos 5 estrellas!';

  @override
  String get rateMsg =>
      '¡Genial! Nos ayudarías muchísimo dejando una reseña rápida en la tienda.';

  @override
  String get btnRate => 'Calificar ahora';

  @override
  String get btnLater => 'Más tarde';

  @override
  String get feedTitle => '¿Cómo podemos mejorar?';

  @override
  String get feedHint => 'Escribe tu sugerencia aquí...';

  @override
  String get btnSend => 'Enviar comentarios';

  @override
  String get btnCancel => 'Cancelar';

  @override
  String get emailSubject => 'Comentarios de la App';
}
