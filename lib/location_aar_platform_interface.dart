import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'location_aar_method_channel.dart';

abstract class LocationAarPlatform extends PlatformInterface {
  /// Constructs a LocationAarPlatform.
  LocationAarPlatform() : super(token: _token);

  static final Object _token = Object();

  static LocationAarPlatform _instance = MethodChannelLocationAar();

  /// The default instance of [LocationAarPlatform] to use.
  ///
  /// Defaults to [MethodChannelLocationAar].
  static LocationAarPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [LocationAarPlatform] when
  /// they register themselves.
  static set instance(LocationAarPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
