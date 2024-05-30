import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'i_updater_method_channel.dart';

abstract class IUpdaterPlatform extends PlatformInterface {
  /// Constructs a IUpdaterPlatform.
  IUpdaterPlatform() : super(token: _token);

  static final Object _token = Object();

  static IUpdaterPlatform _instance = MethodChannelIUpdater();

  /// The default instance of [IUpdaterPlatform] to use.
  ///
  /// Defaults to [MethodChannelIUpdater].
  static IUpdaterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [IUpdaterPlatform] when
  /// they register themselves.
  static set instance(IUpdaterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getCurrentVersion() {
    throw UnimplementedError('getCurrentVersion() has not been implemented.');
  }

  Future<String?> getAppId() {
    throw UnimplementedError('getAppId() has not been implemented.');
  }

  Future<String?> openStore(String url) {
    throw UnimplementedError('openStore() has not been implemented.');
  }
}
