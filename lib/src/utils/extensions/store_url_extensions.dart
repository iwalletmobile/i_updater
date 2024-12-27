import 'package:i_updater/src/utils/constants/i_updater_constants.dart';

/// Extension for String to generate URLs related to the iOS App Store.
extension StoreUrlExtensions on String {
  /// Generates the URL to fetch iOS app details based on the provided [countryCode].
  ///
  /// * [countryCode] - The country code (e.g., 'us', 'tr') used in the URL.
  ///
  /// Returns a [Uri] that can be used to fetch app details from the iOS App Store.
  Uri iOSUrl(String countryCode) {
    final url = IUpdaterConstants.iOSDetailsPath
        .replaceAll(
          IUpdaterConstants.language,
          countryCode, // Replace the placeholder for the country code.
        )
        .replaceAll(
          IUpdaterConstants.id,
          this, // Replace the placeholder with the current app ID.
        );
    return Uri.parse(url);
  }

  /// Generates the URL to fetch detailed app information from the App Store based on the provided [language].
  ///
  /// * [language] - The language code (e.g., 'en', 'tr') used in the URL to fetch localized app details.
  ///
  /// Returns a [Uri] that can be used to fetch detailed app information from the App Store.
  Uri appDetailsUrl(String language) {
    final url = IUpdaterConstants.appStoreDetailsUrl
        .replaceAll(
          IUpdaterConstants.language,
          language, // Replace the placeholder for the language code.
        )
        .replaceAll(
          IUpdaterConstants.id,
          this, // Replace the placeholder with the current app ID.
        );
    return Uri.parse(url);
  }
}
