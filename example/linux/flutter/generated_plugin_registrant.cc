//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <responsive_class/responsive_class_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) responsive_class_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "ResponsiveClassPlugin");
  responsive_class_plugin_register_with_registrar(responsive_class_registrar);
}
