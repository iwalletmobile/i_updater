// ignore_for_file: use_build_context_synchronously

import 'dart:io' show Platform;

import 'package:i_updater/src/manager/version_manager.dart';
import 'package:i_updater/src/model/app_info.dart';
import 'package:i_updater/src/utils/enums/language_codes.dart';
import 'package:i_updater/src/utils/enums/version_required_status.dart';
import 'package:i_updater/src/widgets/app_update_dialog.dart';
import 'package:flutter/material.dart';

import '../method_channel/i_updater_platform_interface.dart';

class UpdaterManager {
  static Future<String?> getAppVersion() async => await IUpdaterPlatform.instance.getCurrentVersion();

  static Future<String?> getAppId() async => await IUpdaterPlatform.instance.getAppId();

  static Future<String?> getStoreVersion({
    required String language,
    required String countryCode,
  }) async {
    final VersionManager versionManager = VersionManager(language: language, countryCode: countryCode);
    return Platform.isIOS ? (await versionManager.getIOSInfo())?.version : (await versionManager.getAndroidInfo())?.version;
  }

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
    final VersionManager versionManager = VersionManager(language: language.name, countryCode: countryCode);
    final AppInfo? appInfo = Platform.isIOS ? await versionManager.getIOSInfo() : await versionManager.getAndroidInfo();
    if (appInfo == null) return;
    final String? currentVersion = await getAppVersion();
    if (currentVersion == null || appInfo.version == null) return;
    if (versionManager.compareVersions(currentVersion, appInfo.version!)) {
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
