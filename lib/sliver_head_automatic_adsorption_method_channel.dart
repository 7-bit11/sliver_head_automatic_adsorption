import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'sliver_head_automatic_adsorption_platform_interface.dart';

/// An implementation of [SliverHeadAutomaticAdsorptionPlatform] that uses method channels.
class MethodChannelSliverHeadAutomaticAdsorption extends SliverHeadAutomaticAdsorptionPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('sliver_head_automatic_adsorption');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
