import 'dart:convert' show jsonDecode;
import 'dart:developer';
import 'dart:io' show HttpStatus;
import 'dart:math' as math;

import 'package:http/http.dart' as http;
import 'package:i_updater/src/manager/interface_version.dart';
import 'package:i_updater/src/manager/updater_manager.dart';
import 'package:i_updater/src/model/app_info.dart';
import 'package:i_updater/src/utils/constants/i_updater_constants.dart';
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
      log(response.body.toString());
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
    final String? appId = await UpdaterManager.getAppId();
    try {
      final Map<String, dynamic>? response = await fetch(
        IUpdaterConstants.iOSDetailsPath
            .replaceAll(
              IUpdaterConstants.language,
              countryCode,
            )
            .replaceAll(
              IUpdaterConstants.id,
              appId!,
            ),
      );
      log(response.toString());
      return AppInfo(
        version: response?[IUpdaterConstants.results]
            .first[IUpdaterConstants.version],
        storeUrl: response?[IUpdaterConstants.results]
            .first[IUpdaterConstants.trackViewUrl],
      );
    } catch (_) {
      return null;
    }
  }
}

mixin _VersionManagerMixin {
  /// Fetches JSON data from the specified URL.
  ///
  /// * [url] - The URL to fetch the data from.
  ///
  /// Returns a Map containing the JSON data if successful, otherwise null.
  Future<Map<String, dynamic>?> fetch(
    String url,
  ) async {
    try {
      final http.Response response = await http.get(Uri.parse(url));
      return response.statusCode == HttpStatus.ok
          ? jsonDecode(response.body)
          : null;
    } catch (_) {
      return null;
    }
  }
}
