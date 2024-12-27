import 'dart:convert' show jsonDecode;
import 'dart:io' show HttpStatus;
import 'dart:math' as math;

import 'package:http/http.dart' as http;
import 'package:i_updater/src/manager/interface_version.dart';
import 'package:i_updater/src/manager/updater_manager.dart';
import 'package:i_updater/src/model/app_info.dart';
import 'package:i_updater/src/utils/constants/i_updater_constants.dart';
import 'package:i_updater/src/utils/extensions/store_url_extensions.dart';
import 'package:i_updater/src/utils/extensions/version_extensions.dart';

class VersionManager extends InterfaceVersion with _VersionManagerMixin {
  final String language;
  final String countryCode;

  // Constructor to initialize the VersionManager with specified language and country code.
  VersionManager({
    required this.language,
    required this.countryCode,
  });

  /// Compares the current app version with the store version.
  ///
  /// * [currentVersion] - The current version of the app.
  /// * [storeVersion] - The version of the app available on the store.
  ///
  /// Returns true if the store version is newer than the current version.
  @override
  bool compareVersions(String currentVersion, String storeVersion) {
    final List<int> currentVersionChars = currentVersion.fromStringToIntList;
    final List<int> storeVersionChars = storeVersion.fromStringToIntList;

    final int currentVersionSize = currentVersionChars.length;
    final int storeVersionSize = storeVersionChars.length;
    final int maxSize = math.max(currentVersionSize, storeVersionSize);

    for (int i = 0; i < maxSize; i++) {
      // Compare corresponding version components.
      if ((i < currentVersionSize ? currentVersionChars[i] : 0) >
          (i < storeVersionSize ? storeVersionChars[i] : 0)) {
        return false;
      } else if ((i < currentVersionSize ? currentVersionChars[i] : 0) <
          (i < storeVersionSize ? storeVersionChars[i] : 0)) {
        return true;
      }
    }
    return false;
  }

  /// Fetches app information from Google Play Store.
  ///
  /// Returns an AppInfo object containing the version and store URL if successful, otherwise null.
  @override
  Future<AppInfo?> getAndroidInfo() async {
    final String? appId = await UpdaterManager.getAppId();
    final Uri uri = Uri.https(
      IUpdaterConstants.googlePlayBaseUrl,
      IUpdaterConstants.playStoreAppsDetailsPath,
      {"id": appId},
    );
    try {
      final response = await http.get(uri);
      return AppInfo(
        version: IUpdaterConstants.googlePlayVersionPattern
            .extractFirstMatch(response.body),
        storeUrl: uri.toString(),
      );
    } catch (_) {
      return null;
    }
  }

  /// Fetches app information from the Apple App Store.
  ///
  /// Returns an AppInfo object containing the version and store URL if successful, otherwise null.
  @override
  Future<AppInfo?> getIOSInfo() async {
    try {
      final String? appId = await UpdaterManager.getAppId();
      if (appId == null) return null;

      final url = appId.iOSUrl(countryCode);

      final Map<String, dynamic>? data = await fetch(url);
      if (data == null || data[IUpdaterConstants.results].isEmpty) return null;

      final appStoreId = (data[IUpdaterConstants.results][0]
              [IUpdaterConstants.trackId] as int?)
          ?.toString();
      if (appStoreId == null) return null;

      final appDetailsUrl = appStoreId.appDetailsUrl(language);
      final Map<String, dynamic>? appDetails = await fetch(appDetailsUrl);

      if (appDetails == null || appDetails[IUpdaterConstants.results].isEmpty) {
        return null;
      }

      return AppInfo(
        version: appDetails[IUpdaterConstants.results][0]
            [IUpdaterConstants.version],
        storeUrl: appDetails[IUpdaterConstants.results][0]
            [IUpdaterConstants.trackViewUrl],
      );
    } catch (_) {
      return null;
    }
  }
}

mixin _VersionManagerMixin {
  /// Fetches JSON data from the specified URL.
  ///
  /// * [uri] - The URI to fetch the data from.
  ///
  /// Returns a Map containing the JSON data if successful, otherwise null.
  Future<Map<String, dynamic>?> fetch(
    Uri uri,
  ) async {
    try {
      final http.Response response = await http.get(uri);
      return response.statusCode == HttpStatus.ok
          ? jsonDecode(response.body)
          : null;
    } catch (_) {
      return null;
    }
  }
}
