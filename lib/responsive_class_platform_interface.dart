import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'responsive_class_method_channel.dart';

abstract class ResponsiveClassPlatform extends PlatformInterface {
  /// Constructs a ResponsiveClassPlatform.
  ResponsiveClassPlatform() : super(token: _token);

  static final Object _token = Object();

  static ResponsiveClassPlatform _instance = MethodChannelResponsiveClass();

  /// The default instance of [ResponsiveClassPlatform] to use.
  ///
  /// Defaults to [MethodChannelResponsiveClass].
  static ResponsiveClassPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ResponsiveClassPlatform] when
  /// they register themselves.
  static set instance(ResponsiveClassPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
