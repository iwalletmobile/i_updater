import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'i_updater_platform_interface.dart';

/// An implementation of [IUpdaterPlatform] that uses method channels.
class MethodChannelIUpdater extends IUpdaterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('i_updater');

  @override
  Future<String?> getCurrentVersion() async => await methodChannel.invokeMethod<String>('getAppVersion');

  @override
  Future<String?> getAppId() async => await methodChannel.invokeMethod<String>('appId');

  @override
  Future<String?> openStore(String url) async => await methodChannel.invokeMethod<String>('openStore', {'url': url});
}
