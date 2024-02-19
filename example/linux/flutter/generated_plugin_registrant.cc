//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <rfid_plugin/rfid_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) rfid_plugin_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "RfidPlugin");
  rfid_plugin_register_with_registrar(rfid_plugin_registrar);
}
