#ifndef FLUTTER_PLUGIN_RESPONSIVE_CLASS_PLUGIN_H_
#define FLUTTER_PLUGIN_RESPONSIVE_CLASS_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace responsive_class {

class ResponsiveClassPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  ResponsiveClassPlugin();

  virtual ~ResponsiveClassPlugin();

  // Disallow copy and assign.
  ResponsiveClassPlugin(const ResponsiveClassPlugin&) = delete;
  ResponsiveClassPlugin& operator=(const ResponsiveClassPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace responsive_class

#endif  // FLUTTER_PLUGIN_RESPONSIVE_CLASS_PLUGIN_H_
