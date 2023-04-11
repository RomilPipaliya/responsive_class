#ifndef FLUTTER_PLUGIN_RESPONSIVE_CLASS_PLUGIN_H_
#define FLUTTER_PLUGIN_RESPONSIVE_CLASS_PLUGIN_H_

#include <flutter_linux/flutter_linux.h>

G_BEGIN_DECLS

#ifdef FLUTTER_PLUGIN_IMPL
#define FLUTTER_PLUGIN_EXPORT __attribute__((visibility("default")))
#else
#define FLUTTER_PLUGIN_EXPORT
#endif

typedef struct _ResponsiveClassPlugin ResponsiveClassPlugin;
typedef struct {
  GObjectClass parent_class;
} ResponsiveClassPluginClass;

FLUTTER_PLUGIN_EXPORT GType responsive_class_plugin_get_type();

FLUTTER_PLUGIN_EXPORT void responsive_class_plugin_register_with_registrar(
    FlPluginRegistrar* registrar);

G_END_DECLS

#endif  // FLUTTER_PLUGIN_RESPONSIVE_CLASS_PLUGIN_H_
