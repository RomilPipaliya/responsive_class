import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'responsive_class_platform_interface.dart';

/// An implementation of [ResponsiveClassPlatform] that uses method channels.
class MethodChannelResponsiveClass extends ResponsiveClassPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('responsive_class');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
