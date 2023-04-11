#include "include/responsive_class/responsive_class_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "responsive_class_plugin.h"

void ResponsiveClassPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  responsive_class::ResponsiveClassPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
