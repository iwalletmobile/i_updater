import 'package:flutter/material.dart';
import 'package:i_updater/src/manager/updater_manager.dart';
import 'package:i_updater/src/utils/enums/language_codes.dart';
import 'package:i_updater/src/utils/enums/version_required_status.dart';

/// Updater widget is responsible for checking for app updates
/// and displaying an update dialog if a newer version is available.
///
/// It is designed to be a wrapper around the main application widget,
/// allowing it to intercept app lifecycle changes and perform update checks.
class Updater extends StatefulWidget {
  const Updater({
    Key? key,
    required this.child,
    this.language = LanguageCodes.en,
    this.countryCode = 'en',
    this.versionRequiredStatus = VersionRequiredStatus.optional,
    this.showVersions = true,
    this.content,
    this.title,
    this.onCloseTap,
  }) : super(key: key);

  /// The main application widget that this updater wraps around.
  final Widget child;

  /// The language code to be used for localization.
  final LanguageCodes language;

  /// The country code to be used when fetching store information.
  final String countryCode;

  /// The status indicating if the update is mandatory or optional.
  final VersionRequiredStatus versionRequiredStatus;

  /// Whether to display version information in the update dialog.
  final bool showVersions;

  /// Optional widget to display as the content of the update dialog.
  final Widget? content;

  /// Optional widget to display as the title of the update dialog.
  final Widget? title;

  /// Optional callback to be invoked when the update dialog is closed.
  final VoidCallback? onCloseTap;

  @override
  State<Updater> createState() => _UpdaterState();
}

class _UpdaterState extends State<Updater> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    _initialize();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  /// This method is called whenever the app lifecycle state changes.
  ///
  /// It specifically checks if the app has resumed from the background,
  /// and if so, reinitializes the update check.
  @override
  Future<void> didChangeAppLifecycleState(
      AppLifecycleState lifecycleState) async {
    super.didChangeAppLifecycleState(lifecycleState);

    // When app has resumed from background.
    if (lifecycleState == AppLifecycleState.resumed) _initialize();
  }

  /// Initializes the update check process.
  ///
  /// This method uses the UpdaterManager to check if an update is available
  /// and shows the update dialog if necessary.
  Future<void> _initialize() async {
    await UpdaterManager.initialize(
      context,
      countryCode: widget.countryCode,
      content: widget.content,
      versionRequiredStatus: widget.versionRequiredStatus,
      language: widget.language,
      onCloseTap: widget.onCloseTap,
      showVersions: widget.showVersions,
      title: widget.title,
    );
  }

  /// Builds the widget tree.
  ///
  /// The main application widget is wrapped within the Updater widget.
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
