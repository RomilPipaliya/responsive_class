import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ResponsiveClass extends StatelessWidget {
  const ResponsiveClass({
    Key? key,
    required this.builder,
    this.maxMobileWidth = 599,
    this.maxTabletWidth,
  }) : super(key: key);

  /// Builds the widget whenever the orientation changes
  final ResponsiveBuilderType builder;

  /// This is the breakpoint used to determine whether the device is
  /// a mobile device or a tablet.
  ///
  /// If the `MediaQuery`'s width **in portrait mode** is less than or equal
  /// to `maxMobileWidth`, the device is in a mobile device
  final double maxMobileWidth;

  /// By default, the `ScreenType` can only be mobile or tablet. If this is set,
  /// the `ScreenType` can be desktop as well
  ///
  /// This is the breakpoint used to determine whether the device is
  /// a tablet or a desktop.
  ///
  /// If the `MediaQuery`'s width **in portrait mode** is
  /// less than or equal to `maxTabletWidth`, the device is in a tablet device
  final double? maxTabletWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        Device.setScreenSize(
          context,
          constraints,
          orientation,
          maxMobileWidth,
          maxTabletWidth,
        );
        if (constraints.maxWidth == 0 || constraints.maxHeight == 0) {
          return const SizedBox();
        }
        return builder(context, orientation, Device.screenType);
      });
    });
  }
}

typedef ResponsiveBuilderType = Widget Function(
    BuildContext,
    Orientation,
    ScreenType,
    );

enum DeviceType { android, ios, fuchsia, web, windows, mac, linux }

/// Type of Screen
///
/// This can either be mobile or tablet
enum ScreenType { mobile, tablet, desktop }

class Device {
  /// Device's BoxConstraints
  static late BoxConstraints boxConstraints;

  /// Device's Orientation
  static late Orientation orientation;

  /// Type of Device
  static late DeviceType deviceType;

  /// Type of Screen
  static late ScreenType screenType;

  /// Device's Height
  static late double height;

  /// Device's Width
  static late double width;

  /// Device's Aspect Ratio
  static late double aspectRatio;

  /// Device's Pixel Ratio
  static late double pixelRatio;

  /// Sets the Screen's size and Device's `Orientation`,
  /// `BoxConstraints`, `Height`, and `Width`
  static void setScreenSize(
      BuildContext context,
      BoxConstraints constraints,
      Orientation currentOrientation,
      double maxMobileWidth, [
        double? maxTabletWidth,
      ]) {
    // Sets boxconstraints and orientation
    boxConstraints = constraints;
    orientation = currentOrientation;

    // Sets screen width and height
    width = boxConstraints.maxWidth;
    height = boxConstraints.maxHeight;

    // Sets aspect and pixel ratio
    aspectRatio = constraints.constrainDimensions(width, height).aspectRatio;
    pixelRatio = _ambiguate(WidgetsBinding.instance)!.window.devicePixelRatio;

    // Sets DeviceType
    if (kIsWeb) {
      deviceType = DeviceType.web;
    } else {
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
          deviceType = DeviceType.android;
          break;
        case TargetPlatform.iOS:
          deviceType = DeviceType.ios;
          break;
        case TargetPlatform.windows:
          deviceType = DeviceType.windows;
          break;
        case TargetPlatform.macOS:
          deviceType = DeviceType.mac;
          break;
        case TargetPlatform.linux:
          deviceType = DeviceType.linux;
          break;
        case TargetPlatform.fuchsia:
          deviceType = DeviceType.fuchsia;
          break;
      }
    }

    // Sets ScreenType
    if ((orientation == Orientation.portrait && width <= maxMobileWidth) ||
        (orientation == Orientation.landscape && height <= maxMobileWidth)) {
      screenType = ScreenType.mobile;
    } else if (maxTabletWidth == null ||
        (orientation == Orientation.portrait && width <= maxTabletWidth) ||
        (orientation == Orientation.landscape && height <= maxTabletWidth)) {
      screenType = ScreenType.tablet;
    } else {
      screenType = ScreenType.desktop;
    }
  }

  /// This allows a value of type T or T?
  /// to be treated as a value of type T?.
  ///
  /// We use this so that APIs that have become
  /// non-nullable can still be used with `!` and `?`
  /// to support older versions of the API as well.
  static T? _ambiguate<T>(T? value) => value;
}

