import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:location_aar/location_aar_method_channel.dart';

void main() {
  MethodChannelLocationAar platform = MethodChannelLocationAar();
  const MethodChannel channel = MethodChannel('location_aar');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
