import 'package:i_updater/src/method_channel/i_updater_platform_interface.dart';
import 'package:i_updater/src/utils/enums/language_codes.dart';
import 'package:i_updater/src/utils/enums/version_required_status.dart';
import 'package:i_updater/src/utils/extensions/language_extensions.dart';
import 'package:i_updater/src/widgets/adaptive_button.dart';
import 'package:i_updater/src/widgets/dialog_base.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Show a dialog
class AppUpdateDialog extends StatelessWidget {
  /// Constructor for dialog
  const AppUpdateDialog({
    Key? key,
    required this.language,
    required this.currentVersion,
    required this.storeVersion,
    required this.url,
    required this.versionRequiredStatus,
    required this.showVersions,
    this.content,
    this.title,
    this.onCloseTap,
  }) : super(key: key);

  final LanguageCodes language;
  final String currentVersion;

  final String storeVersion;

  final String url;

  final VersionRequiredStatus versionRequiredStatus;

  final bool showVersions;

  final Widget? content;

  final Widget? title;

  final VoidCallback? onCloseTap;

  /// Show the dialog for page info
  static Future<void> show(
    BuildContext context, {
    required LanguageCodes language,
    required String currentVersion,
    required String storeVersion,
    required String url,
    required VersionRequiredStatus versionRequiredStatus,
    required bool showVersions,
    Widget? content,
    Widget? title,
    VoidCallback? onCloseTap,
  }) async {
    await DialogBase.show<void>(
      context: context,
      builder: (context) => AppUpdateDialog(
        language: language,
        currentVersion: currentVersion,
        storeVersion: storeVersion,
        versionRequiredStatus: versionRequiredStatus,
        showVersions: showVersions,
        content: content,
        url: url,
        title: title,
        onCloseTap: onCloseTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: versionRequiredStatus == VersionRequiredStatus.optional,
      child: AlertDialog.adaptive(
        title: title ??
            Column(
              children: [
                const Icon(Icons.info_outline_rounded, color: CupertinoColors.activeBlue, size: 30),
                const SizedBox(height: 10),
                Text(language.title, textAlign: TextAlign.center),
              ],
            ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            content ??
                Text(
                  language.content,
                  textAlign: TextAlign.center,
                ),
            if (showVersions) ...[
              const SizedBox(height: 10),
              Text(language.versions(currentVersion, storeVersion)),
            ]
          ],
        ),
        actions: [
          if (versionRequiredStatus == VersionRequiredStatus.optional)
            AdaptiveButton(
              onPressed: onCloseTap ?? Navigator.of(context).pop,
              text: language.maybeLater,
            ),
          AdaptiveButton(
            onPressed: () async {
              Navigator.pop(context);
              await IUpdaterPlatform.instance.openStore(url);
            },
            text: language.update,
          ),
        ],
      ),
    );
  }
}
