class IUpdaterConstants {
  static const String googlePlayBaseUrl = 'play.google.com';

  static const String playStoreAppsDetailsPath = '/store/apps/details';

  // Google Play'den sürüm almak için kullanılan regex deseni
  static final RegExp googlePlayVersionPattern =
      RegExp(r',\[\[\["([0-9,\.]*)"]],');

  static const String iOSDetailsPath =
      'https://itunes.apple.com/:language/lookup?bundleId=:id';

  static const String results = 'results';
  static const String version = 'version';
  static const String trackViewUrl = 'trackViewUrl';
  static const String language = ':language';
  static const String id = ':id';
}
