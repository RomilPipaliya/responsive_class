import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_class/responsive_class_method_channel.dart';

void main() {
  MethodChannelResponsiveClass platform = MethodChannelResponsiveClass();
  const MethodChannel channel = MethodChannel('responsive_class');

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
