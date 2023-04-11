import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_class/responsive_class.dart';
import 'package:responsive_class/responsive_class_platform_interface.dart';
import 'package:responsive_class/responsive_class_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockResponsiveClassPlatform
    with MockPlatformInterfaceMixin
    implements ResponsiveClassPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ResponsiveClassPlatform initialPlatform = ResponsiveClassPlatform.instance;

  test('$MethodChannelResponsiveClass is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelResponsiveClass>());
  });

  test('getPlatformVersion', () async {
    ResponsiveClass responsiveClassPlugin = ResponsiveClass();
    MockResponsiveClassPlatform fakePlatform = MockResponsiveClassPlatform();
    ResponsiveClassPlatform.instance = fakePlatform;

    expect(await responsiveClassPlugin.getPlatformVersion(), '42');
  });
}
