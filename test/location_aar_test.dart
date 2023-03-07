import 'package:flutter_test/flutter_test.dart';
import 'package:location_aar/location_aar.dart';
import 'package:location_aar/location_aar_platform_interface.dart';
import 'package:location_aar/location_aar_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockLocationAarPlatform
    with MockPlatformInterfaceMixin
    implements LocationAarPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final LocationAarPlatform initialPlatform = LocationAarPlatform.instance;

  test('$MethodChannelLocationAar is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelLocationAar>());
  });

  test('getPlatformVersion', () async {
    LocationAar locationAarPlugin = LocationAar();
    MockLocationAarPlatform fakePlatform = MockLocationAarPlatform();
    LocationAarPlatform.instance = fakePlatform;

    expect(await locationAarPlugin.getPlatformVersion(), '42');
  });
}
