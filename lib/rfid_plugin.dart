import 'package:rfid_plugin/UHFTAGInfo.dart';

import 'rfid_plugin_platform_interface.dart';

class RfidPlugin {
  Future<String?> getPlatformVersion() {
    return RfidPluginPlatform.instance.getPlatformVersion();
  }

  Future<bool> init() {
    return RfidPluginPlatform.instance.init();
  }

  Future<bool> free() {
    return RfidPluginPlatform.instance.free();
  }

  Future<String?> readData({
    required String accessPwd,
    required String bank,
    required int ptr,
    required int cnt,
    required String uii,
  }) {
    return RfidPluginPlatform.instance.readData(
        accessPwd: accessPwd, bank: bank, ptr: ptr, cnt: cnt, uii: uii);
  }

  Future<UHFTAGInfo?> readTagFromBuffer() {
    return RfidPluginPlatform.instance.readTagFromBuffer();
  }

  Future<bool> startInventoryTag({
    required int flagAnti,
    required int initQ,
    required int tidLen,
  }) {
    return RfidPluginPlatform.instance
        .startInventoryTag(flagAnti: flagAnti, initQ: initQ, tidLen: tidLen);
  }

  Future<bool> stopInventory() {
    return RfidPluginPlatform.instance.stopInventory();
  }
}
