import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'sliver_head_automatic_adsorption_method_channel.dart';

abstract class SliverHeadAutomaticAdsorptionPlatform extends PlatformInterface {
  /// Constructs a SliverHeadAutomaticAdsorptionPlatform.
  SliverHeadAutomaticAdsorptionPlatform() : super(token: _token);

  static final Object _token = Object();

  static SliverHeadAutomaticAdsorptionPlatform _instance = MethodChannelSliverHeadAutomaticAdsorption();

  /// The default instance of [SliverHeadAutomaticAdsorptionPlatform] to use.
  ///
  /// Defaults to [MethodChannelSliverHeadAutomaticAdsorption].
  static SliverHeadAutomaticAdsorptionPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SliverHeadAutomaticAdsorptionPlatform] when
  /// they register themselves.
  static set instance(SliverHeadAutomaticAdsorptionPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
