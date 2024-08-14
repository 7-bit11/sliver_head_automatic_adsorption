import 'package:flutter_test/flutter_test.dart';
import 'package:sliver_head_automatic_adsorption/sliver_head_automatic_adsorption.dart';
import 'package:sliver_head_automatic_adsorption/sliver_head_automatic_adsorption_platform_interface.dart';
import 'package:sliver_head_automatic_adsorption/sliver_head_automatic_adsorption_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSliverHeadAutomaticAdsorptionPlatform
    with MockPlatformInterfaceMixin
    implements SliverHeadAutomaticAdsorptionPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SliverHeadAutomaticAdsorptionPlatform initialPlatform = SliverHeadAutomaticAdsorptionPlatform.instance;

  test('$MethodChannelSliverHeadAutomaticAdsorption is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSliverHeadAutomaticAdsorption>());
  });

  test('getPlatformVersion', () async {
    SliverHeadAutomaticAdsorption sliverHeadAutomaticAdsorptionPlugin = SliverHeadAutomaticAdsorption();
    MockSliverHeadAutomaticAdsorptionPlatform fakePlatform = MockSliverHeadAutomaticAdsorptionPlatform();
    SliverHeadAutomaticAdsorptionPlatform.instance = fakePlatform;

    expect(await sliverHeadAutomaticAdsorptionPlugin.getPlatformVersion(), '42');
  });
}
