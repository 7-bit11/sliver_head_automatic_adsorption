import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sliver_head_automatic_adsorption/sliver_head_automatic_adsorption_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelSliverHeadAutomaticAdsorption platform = MethodChannelSliverHeadAutomaticAdsorption();
  const MethodChannel channel = MethodChannel('sliver_head_automatic_adsorption');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
