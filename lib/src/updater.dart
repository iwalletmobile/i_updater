import 'package:i_updater/src/manager/updater_manager.dart';
import 'package:i_updater/src/utils/enums/language_codes.dart';
import 'package:i_updater/src/utils/enums/version_required_status.dart';
import 'package:flutter/material.dart';

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

  final Widget child;
  final LanguageCodes language;
  final String countryCode;
  final VersionRequiredStatus versionRequiredStatus;
  final bool showVersions;
  final Widget? content;
  final Widget? title;
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

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState lifecycleState) async {
    super.didChangeAppLifecycleState(lifecycleState);

    // When app has resumed from background.
    if (lifecycleState == AppLifecycleState.resumed) _initialize();
  }

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

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
