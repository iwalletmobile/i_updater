import 'package:i_updater/src/utils/enums/language_codes.dart';

extension LanguageExtensions on LanguageCodes {
  String get title {
    switch (this) {
      case LanguageCodes.ar:
        return 'إصدار جديد متاح';
      case LanguageCodes.es:
        return 'Nueva versión disponible';
      case LanguageCodes.fr:
        return 'Nouvelle version disponible';
      case LanguageCodes.de:
        return 'Neue Version verfügbar';
      case LanguageCodes.hi:
        return 'नई संस्करण उपलब्ध';
      case LanguageCodes.it:
        return 'Nuova versione disponibile';
      case LanguageCodes.tr:
        return 'Yeni sürüm mevcut';
      case LanguageCodes.en:
        return 'New version available';
      case LanguageCodes.pt:
        return 'Nova versão disponível';
      case LanguageCodes.ru:
        return 'Новая версия доступна';
      case LanguageCodes.zh:
        return '新版本可用';
      default:
        return '';
    }
  }

  String get content {
    switch (this) {
      case LanguageCodes.ar:
        return 'لقد قمنا بإطلاق نسخة جديدة. يرجى تحديث التطبيق لتحسين التجربة.';
      case LanguageCodes.es:
        return 'Hemos lanzado una nueva versión. Por favor, actualice la aplicación para una mejor experiencia.';
      case LanguageCodes.fr:
        return 'Nous avons lancé une nouvelle version. Veuillez mettre à jour l\'application pour une meilleure expérience.';
      case LanguageCodes.de:
        return 'Wir haben eine neue Version veröffentlicht. Bitte aktualisieren Sie die App für eine bessere Erfahrung.';
      case LanguageCodes.hi:
        return 'हमने एक नई संस्करण लॉन्च किया है। कृपया बेहतर अनुभव के लिए ऐप को अपडेट करें।';
      case LanguageCodes.it:
        return 'Abbiamo lanciato una nuova versione. Si prega di aggiornare l\'app per un\'esperienza migliore.';
      case LanguageCodes.tr:
        return 'Yeni bir sürümü kullanıma sunduk. Daha iyi bir deneyim için lütfen uygulamayı güncelleyin.';
      case LanguageCodes.en:
        return 'We have launched a new version. Please update the app for a better experience.';
      case LanguageCodes.pt:
        return 'Lançamos uma nova versão. Por favor, atualize o aplicativo para uma melhor experiência.';
      case LanguageCodes.ru:
        return 'Мы выпустили новую версию. Пожалуйста, обновите приложение для лучшего опыта.';
      case LanguageCodes.zh:
        return '我们推出了新版本。请更新应用程序以获得更好的体验。';
      default:
        return '';
    }
  }

  String versions(String currentVersion, String storeVersion) {
    switch (this) {
      case LanguageCodes.ar:
        return 'الإصدار الحالي: $currentVersion\nالإصدار الجديد: $storeVersion';
      case LanguageCodes.es:
        return 'Versión actual: $currentVersion\nNueva versión: $storeVersion';
      case LanguageCodes.fr:
        return 'Version actuelle : $currentVersion\nNouvelle version : $storeVersion';
      case LanguageCodes.de:
        return 'Aktuelle Version: $currentVersion\nNeue Version: $storeVersion';
      case LanguageCodes.hi:
        return 'वर्तमान संस्करण: $currentVersion\nनया संस्करण: $storeVersion';
      case LanguageCodes.it:
        return 'Versione attuale: $currentVersion\nNuova versione: $storeVersion';
      case LanguageCodes.tr:
        return 'Mevcut Sürüm: $currentVersion\nYeni Sürüm: $storeVersion';
      case LanguageCodes.en:
        return 'Current Version: $currentVersion\nNew Version: $storeVersion';
      case LanguageCodes.pt:
        return 'Versão atual: $currentVersion\nNova versão: $storeVersion';
      case LanguageCodes.ru:
        return 'Текущая версия: $currentVersion\nНовая версия: $storeVersion';
      case LanguageCodes.zh:
        return '当前版本：$currentVersion\n新版本：$storeVersion';
      default:
        return '';
    }
  }

  String get maybeLater {
    switch (this) {
      case LanguageCodes.ar:
        return 'ربما لاحقًا';
      case LanguageCodes.es:
        return 'Quizás más tarde';
      case LanguageCodes.fr:
        return 'Peut-être plus tard';
      case LanguageCodes.de:
        return 'Vielleicht später';
      case LanguageCodes.hi:
        return 'शायद बाद में';
      case LanguageCodes.it:
        return 'Forse più tardi';
      case LanguageCodes.tr:
        return 'Daha sonra';
      case LanguageCodes.en:
        return 'Maybe later';
      case LanguageCodes.pt:
        return 'Talvez mais tarde';
      case LanguageCodes.ru:
        return 'Может быть позже';
      case LanguageCodes.zh:
        return '也许以后';
      default:
        return '';
    }
  }

  String get update {
    switch (this) {
      case LanguageCodes.ar:
        return 'تحديث';
      case LanguageCodes.es:
        return 'Actualizar';
      case LanguageCodes.fr:
        return 'Mettre à jour';
      case LanguageCodes.de:
        return 'Aktualisieren';
      case LanguageCodes.hi:
        return 'अपडेट करें';
      case LanguageCodes.it:
        return 'Aggiornare';
      case LanguageCodes.tr:
        return 'Güncelle';
      case LanguageCodes.en:
        return 'Update';
      case LanguageCodes.pt:
        return 'Atualizar';
      case LanguageCodes.ru:
        return 'Обновить';
      case LanguageCodes.zh:
        return '更新';
      default:
        return '';
    }
  }
}
