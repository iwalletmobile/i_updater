import 'package:i_updater/src/model/app_info.dart';

abstract class InterfaceVersion {
  bool compareVersions(String currentVersion, String storeVersion);
  Future<AppInfo?> getIOSInfo();
  Future<AppInfo?> getAndroidInfo();
}
