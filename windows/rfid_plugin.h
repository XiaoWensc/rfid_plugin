#ifndef FLUTTER_PLUGIN_RFID_PLUGIN_H_
#define FLUTTER_PLUGIN_RFID_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace rfid_plugin {

class RfidPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  RfidPlugin();

  virtual ~RfidPlugin();

  // Disallow copy and assign.
  RfidPlugin(const RfidPlugin&) = delete;
  RfidPlugin& operator=(const RfidPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace rfid_plugin

#endif  // FLUTTER_PLUGIN_RFID_PLUGIN_H_
