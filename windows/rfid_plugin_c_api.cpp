#include "include/rfid_plugin/rfid_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "rfid_plugin.h"

void RfidPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  rfid_plugin::RfidPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
