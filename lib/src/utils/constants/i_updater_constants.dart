class IUpdaterConstants {
  /// The base URL for Google Play.
  static const String googlePlayBaseUrl = 'play.google.com';

  /// The path for retrieving app details from the Google Play Store.
  static const String playStoreAppsDetailsPath = '/store/apps/details';

  /// Regular expression pattern used to extract the version from the Google Play response.
  static final RegExp googlePlayVersionPattern =
      RegExp(r',\[\[\["([0-9,\.]*)"]],');

  /// The URL pattern to fetch iOS app details from the App Store.
  ///
  /// The placeholder `:language` is for the language code (e.g., 'en' or 'tr'),
  /// and `:id` is for the app's bundle ID.
  static const String iOSDetailsPath =
      'https://itunes.apple.com/:language/lookup?bundleId=:id';

  /// The URL pattern to fetch detailed iOS app information from the App Store.
  ///
  /// The placeholder `:language` is for the language code (e.g., 'en' or 'tr'),
  /// and `:id` is for the app's track ID.
  static const String appStoreDetailsUrl =
      'https://itunes.apple.com/:language/lookup?id=:id';

  /// The key used in the response JSON to access the results array.
  static const String results = 'results';

  /// The key used in the response JSON to access the version of the app.
  static const String version = 'version';

  /// The key used in the response JSON to access the app's track ID.
  static const String trackId = 'trackId';

  /// The key used in the response JSON to access the app's track view URL.
  static const String trackViewUrl = 'trackViewUrl';

  /// The placeholder for the language code in the URL (e.g., 'en' or 'tr').
  static const String language = ':language';

  /// The placeholder for the app's ID (bundle ID for iOS or app ID for Android).
  static const String id = ':id';
}
