import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'i_updater_platform_interface.dart';

/// An implementation of [IUpdaterPlatform] that uses method channels.
class MethodChannelIUpdater extends IUpdaterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('i_updater');

  @override
  Future<String?> getCurrentVersion() async {
    try {
      return await methodChannel.invokeMethod<String>('getAppVersion');
    } catch (_) {
      return null;
    }
  }

  @override
  Future<String?> getAppId() async {
    try {
      return await methodChannel.invokeMethod<String>('appId');
    } catch (_) {
      return null;
    }
  }

  @override
  Future<String?> openStore(String url) async {
    try {
      return await methodChannel.invokeMethod<String>('openStore', {
        'url': url,
      });
    } catch (_) {
      return null;
    }
  }
}
