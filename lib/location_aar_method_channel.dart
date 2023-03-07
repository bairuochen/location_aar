import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'location_aar_platform_interface.dart';

/// An implementation of [LocationAarPlatform] that uses method channels.
class MethodChannelLocationAar extends LocationAarPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('location_aar');

  @override
  Future<String?> getPlatformVersion() async {
    print(' ------------ getPlatformVersion-----2222222');
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
