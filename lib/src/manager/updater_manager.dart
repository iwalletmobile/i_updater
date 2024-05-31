// ignore_for_file: use_build_context_synchronously

import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:i_updater/src/manager/version_manager.dart';
import 'package:i_updater/src/model/app_info.dart';
import 'package:i_updater/src/utils/enums/language_codes.dart';
import 'package:i_updater/src/utils/enums/version_required_status.dart';
import 'package:i_updater/src/widgets/app_update_dialog.dart';

import '../method_channel/i_updater_platform_interface.dart';

class UpdaterManager {
  /// Retrieves the current version of the app.
  /// This version is fetched from the platform-specific implementation.
  static Future<String?> getAppVersion() async =>
      await IUpdaterPlatform.instance.getCurrentVersion();

  /// Retrieves the app ID.
  /// This ID is fetched from the platform-specific implementation.
  ///
  /// * [Android]: package name
  ///
  /// * [iOS]: bundle id
  static Future<String?> getAppId() async =>
      await IUpdaterPlatform.instance.getAppId();

  /// Fetches the version of the app available on the store.
  ///
  /// * [language] - The language code to be used when fetching store information.
  /// * [countryCode] - The country code to be used when fetching store information.
  static Future<String?> getStoreVersion({
    required String language,
    required String countryCode,
  }) async {
    final VersionManager versionManager =
        VersionManager(language: language, countryCode: countryCode);
    // Fetches the version from the store based on the platform (iOS or Android)
    return Platform.isIOS
        ? (await versionManager.getIOSInfo())?.version
        : (await versionManager.getAndroidInfo())?.version;
  }

  /// Initializes the update check process.
  ///
  /// * [context] - The BuildContext used to show the update dialog.
  /// * [language] - The language code to be used in the dialog.
  /// * [countryCode] - The country code to be used when fetching store information.
  /// * [versionRequiredStatus] - The status indicating if the update is mandatory.
  /// * [showVersions] - Whether to display version information in the dialog.
  /// * [content] - Optional widget to display as the content of the dialog.
  /// * [title] - Optional widget to display as the title of the dialog.
  /// * [onCloseTap] - Optional callback to be invoked when the dialog is closed.
  static Future<void> initialize(
    BuildContext context, {
    required LanguageCodes language,
    required String countryCode,
    required VersionRequiredStatus versionRequiredStatus,
    required bool showVersions,
    Widget? content,
    Widget? title,
    VoidCallback? onCloseTap,
  }) async {
    final VersionManager versionManager =
        VersionManager(language: language.name, countryCode: countryCode);
    final AppInfo? appInfo = Platform.isIOS
        ? await versionManager.getIOSInfo()
        : await versionManager.getAndroidInfo();

    // If app information is not available, exit the method.
    if (appInfo == null) return;

    // Fetch the current version of the app.
    final String? currentVersion = await getAppVersion();

    // If the current version or the store version is not available, exit the method.
    if (currentVersion == null || appInfo.version == null) return;

    // Compare the current version with the store version.
    if (versionManager.compareVersions(currentVersion, appInfo.version!)) {
      // If the store URL is available, show the update dialog.
      if (appInfo.storeUrl != null) {
        await AppUpdateDialog.show(
          context,
          language: language,
          currentVersion: currentVersion,
          storeVersion: appInfo.version!,
          url: appInfo.storeUrl!,
          versionRequiredStatus: versionRequiredStatus,
          showVersions: showVersions,
          content: content,
          title: title,
          onCloseTap: onCloseTap,
        );
      }
    }
  }
}
